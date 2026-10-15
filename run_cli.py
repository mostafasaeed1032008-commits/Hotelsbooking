"""
أداة سطر الأوامر التفاعلية لإدارة وفحص قاعدة بيانات فنادق مكة والمدينة
======================================================================
تشغيل الأداة: python run_cli.py
"""

import sys
import os
import subprocess
from pathlib import Path
import json

# ضبط ترميز الطرفية للعربية والإنجليزية
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

# إضافة المسار الحالي لمسارات بايثون
current_dir = Path(__file__).resolve().parent
if str(current_dir) not in sys.path:
    sys.path.insert(0, str(current_dir))

from config.settings import TEMPLATES_DIR, EXPORTS_DIR, SEED_DATA_DIR
from models.hotel import Hotel, RoomType
from services.seed_database import get_default_seed_hotels
from services.excel_manager import generate_master_template, parse_excel_file, export_hotels_to_excel
from services.sql_exporter import export_hotels_to_sql
from services.html_exporter import export_hotels_to_html, parse_html_file
from services.places_crawler import crawl_live_hotels, merge_and_update_hotels
from services.ota_live_scraper import scrape_live_ota_hotels
import webbrowser


def print_banner(hotel_count: int = 0):
    banner = f"""
=============================================================================
  [Hajj & Umrah Hotel Intelligence Suite] - منظومة فنادق الحرمين الشريفين
  Current Database: [{hotel_count} Hotels Registered] | قاعدة البيانات: [{hotel_count} فندق]
=============================================================================
 [1] View Current Hotels Catalog        - استعراض الفنادق والأسعار والغرف
 [2] Live Multi-OTA Scraper & Search    - كشط منصات الحجز العالمية (بوكينج) والبحث الحي
 [3] Reset / Zero-Out Database (0)      - تصفير ومسح قاعدة البيانات بالكامل (0 فندق)
 [4] Generate Master Excel Template     - توليد قالب الإكسيل المعتمد (26 عاموداً)
 [5] Inspect & Import Excel / HTML      - فحص واستيراد شيت إكسيل أو دليل HTML
 [6] Export Multi-Format Database       - تصدير قاعدة البيانات (Excel + HTML + SQL + JSON)
 [7] Open Interactive HTML in Browser   - فتح شيت ودليل HTML التفاعلي في المتصفح
 [8] Restore Curated Master Hotels (95) - استعادة الدليل النموذجي الموسع (95 فندقاً)
 [9] Launch Interactive Web Dashboard   - تشغيل لوحة التحكم بالمتصفح (Streamlit)
 [0] Exit                               - خروج
=============================================================================
"""
    print(banner)


def load_hotels() -> list[Hotel]:
    json_path = SEED_DATA_DIR / "initial_hotels.json"
    if json_path.exists():
        try:
            with open(json_path, "r", encoding="utf-8") as f:
                data = json.load(f)
                return [Hotel.from_dict(h) for h in data]
        except Exception:
            pass
    return []


def save_and_sync_all(hotels: list[Hotel]):
    json_path = SEED_DATA_DIR / "initial_hotels.json"
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump([h.to_dict() for h in hotels], f, ensure_ascii=False, indent=2)

    # مزامنة ملفات التصدير تلقائياً دائماً
    export_hotels_to_excel(hotels, EXPORTS_DIR / "makkah_madinah_hotels_catalog.xlsx")
    export_hotels_to_sql(hotels, EXPORTS_DIR / "seed_hotels.sql")
    export_hotels_to_html(hotels, EXPORTS_DIR / "hotels_catalog.html")
    export_hotels_to_html(hotels, current_dir / "دليل_الفنادق_التفاعلي.html")
    with open(EXPORTS_DIR / "hotels_database.json", "w", encoding="utf-8") as f:
        json.dump([h.to_dict() for h in hotels], f, ensure_ascii=False, indent=2)


def view_hotels(hotels: list[Hotel]):
    print(f"\n--- Hotel Catalog / كتالوج الفنادق المسجلة حالياً ({len(hotels)} فندق) ---")
    if not hotels:
        print("⚠️ Database is completely empty (0 hotels) / قاعدة البيانات فارغة تماماً (0 فندق).")
        print("Use option [2] to search and crawl real hotels, or [7] to load demo hotels.\n")
        return

    print(f"{'Code':<14} | {'Hotel Name (English / Arabic)':<36} | {'City':<10} | {'Distance':<9} | {'Zone':<24} | {'Stars':<5} | {'Min B2C'}")
    print("-" * 120)
    for h in hotels:
        display_name = f"{h.name_en[:18]} ({h.name_ar[:14]})"
        city_str = "Makkah" if h.city == "makkah" else "Madinah"
        dist_str = f"{h.distance_to_haram_m}m"
        stars_str = f"{h.star_rating}*"
        price_str = f"{h.min_b2c_price:.0f} SAR"
        print(f"{h.hotel_code:<14} | {display_name:<36} | {city_str:<10} | {dist_str:<9} | {h.zone_label_ar:<24} | {stars_str:<5} | {price_str}")
    print("-" * 120)
    print(f"Total Hotels: {len(hotels)} | إجمالي الفنادق: {len(hotels)}\n")


def live_crawl_flow(current_hotels: list[Hotel]) -> list[Hotel]:
    print("\n=======================================================")
    print(" 🌐 Live Multi-OTA & Web Crawler Inspection")
    print("=======================================================")
    print("Select Scraper Engine / اختر محرك الكشط والبحث:")
    print(" [1] Live Multi-OTA Web Scraper (Booking.com & Global OTAs - Playwright Stealth) ⭐")
    print("     (كشط حي لمنصات الحجز: صور أصلية HD، تقييمات النزلاء، وتصنيف المركزية والأحياء)")
    print(" [2] OpenStreetMap Geo Crawler (المسح الميداني للخرائط المفتوحة بالنطاق)")
    eng_choice = input("Choice (1-2) [Default 1]: ").strip() or "1"

    print("\nSelect City / اختر المدينة:")
    print(" [1] Makkah Al-Mukarramah (حول الكعبة المشرفة ومحيطها)")
    print(" [2] Madinah Al-Munawwarah (حول المسجد النبوي ومحيطه)")
    print(" [3] Both Cities (مكة المكرمة والمدينة المنورة)")
    c_choice = input("Choice (1-3) [Default 1]: ").strip() or "1"
    
    if c_choice == "2":
        city_param = "madinah"
    elif c_choice == "3":
        city_param = "both"
    else:
        city_param = "makkah"

    cent_filter = "all"
    if eng_choice == "1":
        print("\nSelect Centrality Filter / تصنيف المركزية:")
        print(" [1] All Hotels (كافة الفنادق - مركزية وغير مركزية)")
        print(" [2] Central Walking Only (فنادق مركزية فقط - مشياً للحرم حتى 1200م)")
        print(" [3] Non-Central Shuttle Only (فنادق غير مركزية فقط - حافلات شاتل)")
        cent_c = input("Choice (1-3) [Default 1]: ").strip() or "1"
        if cent_c == "2":
            cent_filter = "central_only"
        elif cent_c == "3":
            cent_filter = "non_central_only"

    count_input = input("\nTarget Hotel Count / العدد المطلوب سحبه [Default 25]: ").strip() or "25"
    try:
        count_target = int(count_input)
    except ValueError:
        count_target = 25

    print("\nSave Mode / طريقة الحفظ والتحديث:")
    print(" [1] Cumulative Merge & Update (تحديث ودمج تراكمي - الافتراضي والمستحسن)")
    print(" [2] Overwrite & Reset database (مسح القديم والبدء من الصفر بهذه الفنادق)")
    sm_choice = input("Choice (1-2) [Default 1]: ").strip() or "1"

    print("\n⏳ Executing live hotel scraper & intelligence inspection...")
    
    def log_progress(msg: str):
        print(f"  -> {msg}")

    if eng_choice == "1":
        crawled = scrape_live_ota_hotels(
            city=city_param,
            target_count=count_target,
            filter_centrality=cent_filter,
            status_callback=log_progress
        )
    else:
        radius_input = input("Search Radius in meters / نطاق البحث بالمتر [Default 2500]: ").strip() or "2500"
        try:
            radius_m = int(radius_input)
        except ValueError:
            radius_m = 2500
        crawled = crawl_live_hotels(
            city=city_param,
            radius_meters=radius_m,
            target_count=count_target,
            auto_expand=True,
            status_callback=log_progress
        )

    if not crawled:
        print("❌ No hotels found. Please check connection and try again.\n")
        return current_hotels

    print(f"\n🎉 Successfully collected {len(crawled)} real verified hotels!")
    print("-" * 90)
    for idx, h in enumerate(crawled[:10], 1):
        print(f"  {idx:02d}. [{h.hotel_code}] {h.name_ar} | Dist: {h.distance_to_haram_m}m | Phone: {h.contact_phone} | {h.star_rating}* | Min: {h.min_b2c_price:.0f} SAR")
    if len(crawled) > 10:
        print(f"  ... and {len(crawled) - 10} more hotels.")
    print("-" * 90)

    if sm_choice == "2":
        final_hotels = crawled
        print(f"✅ Reset database and saved {len(final_hotels)} hotels.")
    else:
        final_hotels, added_c, updated_c = merge_and_update_hotels(current_hotels, crawled)
        print(f"✅ Cumulative update completed! Added: {added_c} new hotels, Updated: {updated_c} existing hotels.")
        print(f"📊 Total hotels in database now: {len(final_hotels)}")

    save_and_sync_all(final_hotels)
    print("✅ Database, Excel Catalog (26 columns), and SQL Seeder updated and synced successfully!\n")
    return final_hotels


def reset_database_flow() -> list[Hotel]:
    print("\n⚠️ =====================================================")
    print("  CONFIRM DATABASE RESET / تأكيد تصفير قاعدة البيانات")
    print("=======================================================")
    confirm = input("Are you sure you want to delete all hotels and set count to 0? (y/n): ").strip().lower()
    if confirm in ["y", "yes", "نعم"]:
        empty_hotels: list[Hotel] = []
        save_and_sync_all(empty_hotels)
        print("✅ Database has been completely ZEROED OUT (0 hotels)!")
        print("   - initial_hotels.json: []")
        print("   - makkah_madinah_hotels_catalog.xlsx: Empty template with headers")
        print("   - seed_hotels.sql: Clean empty transaction")
        print("Ready for fresh web crawling!\n")
        return empty_hotels
    else:
        print("Reset cancelled.\n")
        return load_hotels()


def main():
    hotels = load_hotels()

    while True:
        print_banner(len(hotels))
        choice = input("Select an option / اختر العملية (0 - 8): ").strip()

        if choice == "1":
            view_hotels(hotels)

        elif choice == "2":
            hotels = live_crawl_flow(hotels)

        elif choice == "3":
            hotels = reset_database_flow()

        elif choice == "4":
            template_path = TEMPLATES_DIR / "makkah_madinah_hotels_master_template.xlsx"
            print("\nGenerating 26-column Master Excel Template...")
            res_path = generate_master_template(template_path)
            print(f"✅ Success! Template generated at:\n   {res_path}\n")

        elif choice == "5":
            file_input = input("\nEnter Excel or HTML file path / أدخل مسار ملف الإكسيل أو الـ HTML: ").strip().strip('"').strip("'")
            path_obj = Path(file_input)
            if not path_obj.exists():
                print(f"❌ File not found / الملف غير موجود: {file_input}\n")
                continue

            print("\nInspecting and validating file...")
            if path_obj.suffix.lower() == ".html":
                imported, errs, warns = parse_html_file(path_obj)
            else:
                imported, errs, warns = parse_excel_file(path_obj)

            if errs:
                print("❌ Errors detected / أخطاء تمنع الاستيراد:")
                for e in errs:
                    print(f"  - {e}")
            else:
                print(f"✅ Inspection successful! Found {len(imported)} hotels.")
                if warns:
                    print("⚠️ Auto-corrected warnings:")
                    for w in warns[:5]:
                        print(f"  - {w}")
                
                confirm = input("Merge into current database (cumulative)? (y/n) [Default y]: ").strip().lower()
                if confirm not in ["n", "no", "لا"]:
                    hotels, added_c, upd_c = merge_and_update_hotels(hotels, imported)
                    save_and_sync_all(hotels)
                    print(f"✅ Database merged successfully! (+{added_c} new hotels, 🔄 {upd_c} updated hotels)\n")

        elif choice == "6":
            print("\nExporting database to all formats (HTML Web Sheet, Excel, SQL Seeder, JSON)...")
            save_and_sync_all(hotels)
            html_path = EXPORTS_DIR / "hotels_catalog.html"
            excel_path = EXPORTS_DIR / "makkah_madinah_hotels_catalog.xlsx"
            sql_path = EXPORTS_DIR / "seed_hotels.sql"
            json_path = EXPORTS_DIR / "hotels_database.json"

            print(f"✅ 1. Interactive HTML Web Sheet: {html_path}")
            print(f"✅ 2. Excel Catalog (26 columns): {excel_path}")
            print(f"✅ 3. PostgreSQL 16 Seeder (23 Tables): {sql_path}")
            print(f"✅ 4. JSON Master Database: {json_path}\n")

        elif choice == "7":
            html_path = EXPORTS_DIR / "hotels_catalog.html"
            if not html_path.exists() or not hotels:
                export_hotels_to_html(hotels, html_path)
            print(f"\n🌐 Opening Interactive HTML Web Sheet in your browser...")
            print(f"   Path: {html_path}")
            try:
                webbrowser.open(html_path.as_uri())
            except Exception:
                if sys.platform == "win32":
                    os.startfile(str(html_path))
            print("✅ Opened in default web browser!\n")

        elif choice == "8":
            print("\nRestoring 95 Curated Authentic Master Hotels (60 Makkah, 35 Madinah)...")
            hotels = get_default_seed_hotels()
            save_and_sync_all(hotels)
            print(f"✅ Successfully restored {len(hotels)} curated authentic hotels.\n")

        elif choice == "9":
            print("\n🚀 Launching Interactive Streamlit Dashboard in your browser...")
            app_script = current_dir / "ui" / "app.py"
            cmd = [sys.executable, "-m", "streamlit", "run", str(app_script), "--browser.gatherUsageStats", "false"]
            if sys.platform == "win32":
                subprocess.Popen(cmd, cwd=str(current_dir), creationflags=subprocess.CREATE_NEW_CONSOLE)
            else:
                subprocess.Popen(cmd, cwd=str(current_dir))
            print("✅ Dashboard launched successfully! View it in your browser at: http://localhost:8501\n")

        elif choice == "0":
            print("\nGoodbye! بالتوفيق دائماً.\n")
            break
        else:
            print("Invalid choice, please select 0 to 9.")


if __name__ == "__main__":
    main()
