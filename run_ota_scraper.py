"""
أداة الكشط المباشر لفنادق مكة والمدينة من منصات الحجز العالمية (Live Multi-OTA Web Scraper CLI)
================================================================================================
تقوم هذه الأداة بفتح متصفح خفي (Playwright Stealth Engine) وكشط فنادق مكة المكرمة والمدينة المنورة
مباشرة من موقع بوكينج وكبرى المنصات، وسحب الصور الأصلية HD، والتقييمات، وتصنيف المركزية والأحياء.
"""

import sys
import os
from pathlib import Path

# ضبط ترميز الطرفية
if hasattr(sys.stdout, 'reconfigure'):
    try:
        sys.stdout.reconfigure(encoding='utf-8')
    except Exception:
        pass
if hasattr(sys.stderr, 'reconfigure'):
    try:
        sys.stderr.reconfigure(encoding='utf-8')
    except Exception:
        pass

tool_dir = Path(__file__).resolve().parent
if str(tool_dir) not in sys.path:
    sys.path.insert(0, str(tool_dir))

import json
from models.hotel import Hotel
from services.ota_live_scraper import scrape_live_ota_hotels
from services.places_crawler import merge_and_update_hotels
from services.excel_manager import export_hotels_to_excel
from services.sql_exporter import export_hotels_to_sql
from services.html_exporter import export_hotels_to_html
from config.settings import EXPORTS_DIR, SEED_DATA_DIR


def main():
    print("""
=============================================================================
  🕋 [Live Multi-OTA Hotel Web Scraper]
  محرك الكشط الحي الشامل لفنادق الحرمين الشريفين (Booking.com & Global OTAs)
=============================================================================
    """)

    # 1. اختيار المدينة
    print("اختر المدينة المستهدفة للكشط / Select City:")
    print(" [1] مكة المكرمة (حول الحرم المكي)")
    print(" [2] المدينة المنورة (حول المسجد النبوي)")
    print(" [3] كلا المدينتين معاً (مكة والمدينة)")
    city_choice = input("Choice (1-3) [Default 1]: ").strip() or "1"
    
    city_map = {"1": "makkah", "2": "madinah", "3": "both"}
    city_key = city_map.get(city_choice, "makkah")

    # 2. تصنيف المركزية
    print("\nاختر تصنيف المركزية / Centrality Classification:")
    print(" [1] كافة الفنادق (مركزية وغير مركزية) - All Hotels")
    print(" [2] فنادق مركزية فقط (مشياً للحرم حتى 1200م) - Central Walking Only")
    print(" [3] فنادق غير مركزية فقط (شاتل باص ونطاق خارجي) - Non-Central Shuttle Only")
    cent_choice = input("Choice (1-3) [Default 1]: ").strip() or "1"
    
    cent_map = {"1": "all", "2": "central_only", "3": "non_central_only"}
    cent_key = cent_map.get(cent_choice, "all")

    # 3. العدد المطلوب
    count_str = input("\nعدد الفنادق المطلوب سحبها لكل مدينة / Target Count [Default 25]: ").strip() or "25"
    try:
        count_target = int(count_str)
    except ValueError:
        count_target = 25

    # 4. طريقة الحفظ
    print("\nطريقة حفظ النتائج / Database Save Mode:")
    print(" [1] تحديث ودمج تراكمي فوق البيانات السابقة (Cumulative Update - مستحسن)")
    print(" [2] مسح قاعدة البيانات والبدء من الصفر بهذه الفنادق (Overwrite & Reset)")
    save_choice = input("Choice (1-2) [Default 1]: ").strip() or "1"

    print("\n🚀 جاري تشغيل محرك التصفح الخفي والاتصال المباشر بمنصة Booking.com...")
    
    def on_progress(msg: str):
        print(f"  {msg}")

    crawled_hotels = scrape_live_ota_hotels(
        city=city_key,
        target_count=count_target,
        filter_centrality=cent_key,
        status_callback=on_progress
    )

    if not crawled_hotels:
        print("\n❌ لم يتم العثور على فنادق أو حدث تعذر في الاتصال.")
        return

    # تحميل قاعدة البيانات الحالية
    json_path = SEED_DATA_DIR / "initial_hotels.json"
    current_hotels = []
    if json_path.exists():
        try:
            with open(json_path, "r", encoding="utf-8") as f:
                current_hotels = [Hotel.from_dict(h) for h in json.load(f)]
        except Exception:
            current_hotels = []

    if save_choice == "2":
        final_hotels = crawled_hotels
        print(f"\n✅ تم استبدال قاعدة البيانات بنجاح وحفظ {len(final_hotels)} فندق حقيقي.")
    else:
        final_hotels, added_cnt, updated_cnt = merge_and_update_hotels(current_hotels, crawled_hotels)
        print(f"\n✅ اكتمل التحديث التراكمي! تمت إضافة {added_cnt} فندق جديد وتحديث {updated_cnt} فندق سابق.")
        print(f"📊 إجمالي الفنادق المسجلة حالياً في قاعدة البيانات: {len(final_hotels)} فندق.")

    # حفظ وتصدير كافة الصيغ تلقائياً
    print("\n💾 جاري حفظ ومزامنة البيانات في كافة الصيغ (JSON + Excel 26 columns + SQL + HTML)...")
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump([h.to_dict() for h in final_hotels], f, ensure_ascii=False, indent=2)

    with open(EXPORTS_DIR / "hotels_database.json", "w", encoding="utf-8") as f:
        json.dump([h.to_dict() for h in final_hotels], f, ensure_ascii=False, indent=2)

    export_hotels_to_excel(final_hotels, EXPORTS_DIR / "makkah_madinah_hotels_catalog.xlsx")
    export_hotels_to_sql(final_hotels, EXPORTS_DIR / "seed_hotels.sql")
    export_hotels_to_html(final_hotels, EXPORTS_DIR / "hotels_catalog.html")
    export_hotels_to_html(final_hotels, tool_dir / "دليل_الفنادق_التفاعلي.html")

    print("🎉 تم التخزين والمزامنة بنجاح تام!")
    print(f" - Excel Catalog:  {EXPORTS_DIR / 'makkah_madinah_hotels_catalog.xlsx'}")
    print(f" - SQL Seeder:     {EXPORTS_DIR / 'seed_hotels.sql'}")
    print(f" - HTML Catalog:   {tool_dir / 'دليل_الفنادق_التفاعلي.html'}")
    print(f" - JSON Database:  {EXPORTS_DIR / 'hotels_database.json'}")
    print("=" * 80)


if __name__ == "__main__":
    main()
