"""
لوحة التحكم التشغيلية لمنظومة حجز وتغطية فنادق الحرمين الشريفين
================================================================================
غرفة عمليات المشتريات والتعاقدات الفندقية، الكشط الحي، مقارنة الأسعار مع بوكينج،
وتصنيف الأحياء والمركزية لمكة المكرمة والمدينة المنورة.
"""

import sys
from pathlib import Path

# إضافة مسار أداة جمع الفنادق إلى sys.path
root_tool_dir = Path(__file__).resolve().parent.parent
tool_dir = root_tool_dir
if str(root_tool_dir) not in sys.path:
    sys.path.insert(0, str(root_tool_dir))

import streamlit as st
import pandas as pd
import json

from config.settings import (
    CITIES_MAP, ZONES_META, MAKKAH_NEIGHBORHOODS, MADINAH_NEIGHBORHOODS,
    DATA_DIR, TEMPLATES_DIR, EXPORTS_DIR, SEED_DATA_DIR
)
from models.hotel import Hotel, RoomType
from services.seed_database import get_default_seed_hotels
from services.haram_geocoder import (
    calculate_distance_to_haram, determine_hotel_zone,
    generate_google_maps_url, geocode_hotel_online
)
from services.excel_manager import (
    generate_master_template, parse_excel_file, export_hotels_to_excel,
    export_procurement_and_coverage_excel
)
from services.sql_exporter import export_hotels_to_sql
from services.html_exporter import export_hotels_to_html, parse_html_file
from services.places_crawler import crawl_live_hotels, merge_and_update_hotels
from services.ota_live_scraper import scrape_live_ota_hotels, detect_hotel_neighborhood

# إعداد الصفحة
st.set_page_config(
    page_title="منظومة تشغيل وتغطية فنادق الحرمين والتعاقدات",
    page_icon="🕋",
    layout="wide",
    initial_sidebar_state="expanded"
)

# تخصيص المظهر باللغة العربية والخطوط الحديثة
st.markdown("""
<style>
    @import url('https://fonts.googleapis.com/css2?family=Cairo:wght@400;600;700;800&display=swap');
    html, body, [class*="css"] {
        font-family: 'Cairo', sans-serif !important;
        direction: rtl;
        text-align: right;
    }
    .stTabs [data-baseweb="tab-list"] {
        gap: 8px;
    }
    .stTabs [data-baseweb="tab"] {
        padding: 10px 18px;
        font-weight: bold;
        border-radius: 8px;
    }
    .metric-card {
        background: #f8fafc;
        border: 1px solid #e2e8f0;
        border-radius: 10px;
        padding: 16px;
        text-align: center;
    }
    .badge-pill {
        display: inline-block;
        padding: 4px 10px;
        border-radius: 6px;
        font-size: 0.85rem;
        font-weight: bold;
    }
</style>
""", unsafe_allow_html=True)

# مسار ملف البيانات
json_path = SEED_DATA_DIR / "initial_hotels.json"

# إدارة حالة الجلسة (Session State)
if "hotels" not in st.session_state:
    if json_path.exists():
        try:
            with open(json_path, "r", encoding="utf-8") as f:
                data = json.load(f)
                st.session_state.hotels = [Hotel.from_dict(h) for h in data]
        except Exception:
            st.session_state.hotels = []
    else:
        st.session_state.hotels = []

# دوال حفظ وتصدير الحالة
def save_current_state():
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump([h.to_dict() for h in st.session_state.hotels], f, ensure_ascii=False, indent=2)
    # مزامنة وتحديث ملفات التصدير تلقائياً دائماً
    export_hotels_to_excel(st.session_state.hotels, EXPORTS_DIR / "makkah_madinah_hotels_catalog.xlsx")
    export_procurement_and_coverage_excel(st.session_state.hotels, EXPORTS_DIR / "hotel_procurement_and_coverage_report.xlsx")
    export_hotels_to_sql(st.session_state.hotels, EXPORTS_DIR / "seed_hotels.sql")
    export_hotels_to_html(st.session_state.hotels, EXPORTS_DIR / "hotels_catalog.html")
    export_hotels_to_html(st.session_state.hotels, tool_dir / "دليل_الفنادق_التفاعلي.html")
    with open(EXPORTS_DIR / "hotels_database.json", "w", encoding="utf-8") as f:
        json.dump([h.to_dict() for h in st.session_state.hotels], f, ensure_ascii=False, indent=2)

def clear_all_data():
    st.session_state.hotels = []
    save_current_state()

# التأكد من وجود القالب الرسمي
template_file = TEMPLATES_DIR / "makkah_madinah_hotels_master_template.xlsx"
if not template_file.exists():
    generate_master_template(template_file)

# -------------------------------------------------------------
# القائمة الجانبية (Sidebar)
# -------------------------------------------------------------
with st.sidebar:
    st.image("https://images.unsplash.com/photo-1591604129939-f1efa4d9f7fa?auto=format&fit=crop&w=400&q=80", use_container_width=True)
    st.title("🕋 منظومة فنادق الحرمين")
    st.caption("غرفة عمليات التغطية، التعاقدات والأسعار")
    
    total_count = len(st.session_state.hotels)
    makkah_count = sum(1 for h in st.session_state.hotels if h.city == "makkah")
    madinah_count = sum(1 for h in st.session_state.hotels if h.city == "madinah")
    contracted_cnt = sum(1 for h in st.session_state.hotels if getattr(h, 'contract_status', 'open_lead') == 'contracted')
    central_cnt = sum(1 for h in st.session_state.hotels if getattr(h, 'is_central', True))
    
    st.metric("إجمالي الفنادق المسجلة", f"{total_count} فندق")
    col_s1, col_s2 = st.columns(2)
    with col_s1:
        st.metric("مكة المكرمة", f"{makkah_count}")
    with col_s2:
        st.metric("المدينة المنورة", f"{madinah_count}")
    
    col_s3, col_s4 = st.columns(2)
    with col_s3:
        st.metric("✅ متعاقد عليها", f"{contracted_cnt}")
    with col_s4:
        st.metric("🟢 فنادق مركزية", f"{central_cnt}")
        
    st.divider()

    st.markdown("### ⚙️ إدارة البيانات والتهيئة")
    
    # استرجاع قاعدة البيانات الموسعة
    if st.button("🔄 تحميل القائمة المعتمدة الموسعة (229 فندقاً)", use_container_width=True):
        st.session_state.hotels = get_default_seed_hotels()
        # ندمج ونحدث البيانات
        merged, _, _ = merge_and_update_hotels([], st.session_state.hotels)
        st.session_state.hotels = merged
        save_current_state()
        st.success("تم استرجاع وتحديث الفنادق المعتمدة بنجاح!")
        st.rerun()

    # زر تصفير البيانات بالكامل
    if st.button("🗑️ تصفير ومسح قاعدة البيانات بالكامل (0 فندق)", use_container_width=True, type="secondary"):
        clear_all_data()
        st.success("✅ تم تصفير قاعدة البيانات بنجاح! أصبحت فارغة (0 فندق).")
        st.rerun()

# -------------------------------------------------------------
# التبويبات الرئيسية
# -------------------------------------------------------------
tab_procurement, tab_neighborhoods, tab_live_search, tab_catalog, tab_add, tab_excel, tab_export = st.tabs([
    "🏢 غرفة عمليات التعاقدات والأسعار (Procurement & Pricing)",
    "🏘️ تصنيف التغطية بالأحياء والمركزية (Neighborhoods & Centrality)",
    "🌐 محرك الكشط ومطابقة أسعار بوكينج (Live Multi-OTA Scraper)",
    "🏨 كتالوج الفنادق والخريطة التفاعلية",
    "➕ إضافة وتعديل فندق وتعاقد",
    "📊 فحص واستيراد شيت إكسيل",
    "📥 تصدير تقارير التشغيل والبيانات (Reports & Exports)"
])

# -------------------------------------------------------------
# التبويب 1: غرفة عمليات التعاقدات والأسعار ومقارنة بوكينج
# -------------------------------------------------------------
with tab_procurement:
    st.subheader("🏢 غرفة عمليات التعاقدات الفندقية والأسعار (Procurement & Margins Hub)")
    st.caption("متابعة أسعار الشراء الفعلي B2B (التكلفة)، مقارنة أسعار السوق الحية على بوكينج، تسعير البيع B2C، واحتساب الأرباح وهوامش التوفير للعميل.")

    hotels_list = st.session_state.hotels

    if not hotels_list:
        st.warning("⚠️ قاعدة البيانات فارغة حالياً. انتقل إلى تبويب 'محرك الكشط الحي' أو استرجع البيانات من القائمة الجانبية.")
    else:
        # حساب المؤشرات التشغيلية والمالية الكلية
        tot_cnt = len(hotels_list)
        cnt_contracted = sum(1 for h in hotels_list if getattr(h, 'contract_status', 'open_lead') == 'contracted')
        cnt_negotiating = sum(1 for h in hotels_list if getattr(h, 'contract_status', 'open_lead') == 'negotiating')
        cnt_leads = tot_cnt - (cnt_contracted + cnt_negotiating)
        
        avg_cost = sum(h.procurement_price_effective for h in hotels_list) / tot_cnt
        avg_market = sum(h.market_price_effective for h in hotels_list) / tot_cnt
        avg_selling = sum(h.selling_price_effective for h in hotels_list) / tot_cnt
        avg_savings = sum(h.customer_savings_sar for h in hotels_list) / tot_cnt
        total_potential_profit = sum(h.total_allotment_potential_profit for h in hotels_list)

        # بطاقات المؤشرات المالية الرئيسية (KPIs)
        kpi1, kpi2, kpi3, kpi4, kpi5 = st.columns(5)
        with kpi1:
            st.metric("إجمالي الفنادق المغطاة", f"{tot_cnt} فندق", f"{cnt_contracted} متعاقد عليها")
        with kpi2:
            st.metric("متوسط سعر الشراء B2B (التكلفة)", f"{avg_cost:,.0f} ر.س", "سعر الجملة الفعلي")
        with kpi3:
            st.metric("متوسط سعر السوق (بوكينج)", f"{avg_market:,.0f} ر.س", "سعر التجزئة العام")
        with kpi4:
            st.metric("متوسط وفر العميل معنا", f"{avg_savings:,.0f} ر.س / ليلة", f"توفير {((avg_market - avg_selling) / avg_market * 100):.1f}%")
        with kpi5:
            st.metric("إجمالي الأرباح المتوقعة للكوتات", f"{total_potential_profit:,.0f} ر.س", "من الغرف المخصصة")

        st.divider()

        # فلاتر جدول التعاقدات والأسعار
        st.markdown("#### 🔍 فلاتر التشغيل والبحث المتقدم:")
        f_col1, f_col2, f_col3, f_col4, f_col5 = st.columns(5)
        with f_col1:
            p_filter_city = st.selectbox("تصفية بالمدينة:", ["الكل", "مكة المكرمة", "المدينة المنورة"], key="proc_city")
        with f_col2:
            p_filter_status = st.selectbox("حالة التعاقد:", ["الكل", "✅ تم التعاقد", "⏳ قيد التفاوض", "🎯 فرصة غير مغطاة"], key="proc_status")
        with f_col3:
            p_filter_central = st.selectbox("المركزية:", ["الكل", "🟢 فنادق مركزية (مشياً)", "🟣 فنادق غير مركزية (شاتل)"], key="proc_cent")
        with f_col4:
            all_nh = sorted(list(set(h.neighborhood_ar for h in hotels_list if h.neighborhood_ar)))
            p_filter_nh = st.selectbox("تصفية بالحي:", ["كافة الأحياء"] + all_nh, key="proc_nh")
        with f_col5:
            p_search = st.text_input("بحث بالاسم أو الكود:", key="proc_search")

        # تطبيق الفلاتر
        filtered_proc = hotels_list
        if p_filter_city == "مكة المكرمة":
            filtered_proc = [h for h in filtered_proc if h.city == "makkah"]
        elif p_filter_city == "المدينة المنورة":
            filtered_proc = [h for h in filtered_proc if h.city == "madinah"]

        if "تم التعاقد" in p_filter_status:
            filtered_proc = [h for h in filtered_proc if getattr(h, 'contract_status', 'open_lead') == 'contracted']
        elif "قيد التفاوض" in p_filter_status:
            filtered_proc = [h for h in filtered_proc if getattr(h, 'contract_status', 'open_lead') == 'negotiating']
        elif "فرصة" in p_filter_status:
            filtered_proc = [h for h in filtered_proc if getattr(h, 'contract_status', 'open_lead') == 'open_lead']

        if "مركزية (" in p_filter_central:
            filtered_proc = [h for h in filtered_proc if getattr(h, 'is_central', True)]
        elif "غير مركزية (" in p_filter_central:
            filtered_proc = [h for h in filtered_proc if not getattr(h, 'is_central', True)]

        if p_filter_nh != "كافة الأحياء":
            filtered_proc = [h for h in filtered_proc if h.neighborhood_ar == p_filter_nh]

        if p_search:
            sq = p_search.lower()
            filtered_proc = [h for h in filtered_proc if sq in h.name_ar.lower() or sq in h.hotel_code.lower() or sq in (h.neighborhood_ar or '').lower()]

        st.caption(f"عدد الفنادق المعروضة وفق الفلاتر: **{len(filtered_proc)} فندق**")

        # جدول أسعار التعاقدات والوفر وهامش الربحية
        proc_rows = []
        for idx, h in enumerate(filtered_proc, start=1):
            cent_badge = "🟢 مركزي" if getattr(h, 'is_central', True) else "🟣 غير مركزي"
            proc_rows.append({
                "م": idx,
                "الكود": h.hotel_code,
                "اسم الفندق": h.name_ar,
                "المدينة": h.city_label_ar,
                "الحي": h.neighborhood_ar,
                "المركزية": cent_badge,
                "حالة التعاقد": getattr(h, 'contract_status_label_ar', '✅ تم التعاقد'),
                "سعر الشراء B2B (التكلفة)": f"{h.procurement_price_effective:,.0f} ر.س",
                "سعر السوق (بوكينج)": f"{h.market_price_effective:,.0f} ر.س",
                "سعر البيع B2C": f"{h.selling_price_effective:,.0f} ر.س",
                "صافي الربح / ليلة": f"{h.profit_per_room_sar:,.0f} ر.س",
                "هامش الربح %": f"{h.profit_margin_percent:.1f}%",
                "وفر العميل عن بوكينج": f"{h.customer_savings_sar:,.0f} ر.س",
                "نسبة الوفر %": f"{h.customer_savings_percent:.1f}%",
                "الغرف المخصصة": getattr(h, 'allotment_total_rooms', 15) or 15,
                "إجمالي الأرباح المتوقعة": f"{h.total_allotment_potential_profit:,.0f} ر.س",
                "رابط بوكينج": h.booking_url or "-"
            })

        st.dataframe(pd.DataFrame(proc_rows), use_container_width=True)

        st.divider()

        # قسمان متجاوران: محرر التعاقد السريع + حاسبة الصفقات والعروض السعرية
        col_ed1, col_ed2 = st.columns([1, 1])

        with col_ed1:
            with st.container(border=True):
                st.markdown("### ✏️ تحديث أسعار فندق أو تسجيل تعاقد جديد فوراً")
                st.caption("اختر الفندق وحدد سعر الشراء الفعلي وسعر البيع والكوتة ليتم تحديثه وحفظه فوراً في النظام.")
                
                hotel_options = {f"{h.name_ar} ({h.hotel_code}) - {h.city_label_ar} | {h.neighborhood_ar}": h for h in hotels_list}
                selected_hotel_name = st.selectbox("اختر الفندق للتعديل والتسعير:", list(hotel_options.keys()))
                sel_h = hotel_options[selected_hotel_name]

                col_u1, col_u2 = st.columns(2)
                with col_u1:
                    new_status = st.selectbox(
                        "حالة التعاقد:",
                        ["contracted", "negotiating", "open_lead"],
                        index=["contracted", "negotiating", "open_lead"].index(getattr(sel_h, 'contract_status', 'contracted')),
                        format_func=lambda x: {"contracted": "✅ تم التعاقد وتثبيت السعر", "negotiating": "⏳ قيد التفاوض والاتفاق", "open_lead": "🎯 فرصة غير مغطاة"}.get(x)
                    )
                    new_proc_cost = st.number_input(
                        "سعر الشراء الفعلي B2B (التكلفة التعاقدية) ر.س:",
                        min_value=50.0, max_value=25000.0,
                        value=float(sel_h.procurement_price_effective), step=25.0
                    )
                    new_allotment = st.number_input(
                        "عدد الغرف المخصصة (Allotment):",
                        min_value=1, max_value=500,
                        value=int(getattr(sel_h, 'allotment_total_rooms', 15) or 15), step=5
                    )
                with col_u2:
                    new_market_price = st.number_input(
                        "سعر السوق على بوكينج ر.س:",
                        min_value=50.0, max_value=30000.0,
                        value=float(sel_h.market_price_effective), step=25.0
                    )
                    new_selling_price = st.number_input(
                        "سعر البيع المعتمد للجمهور B2C ر.س:",
                        min_value=50.0, max_value=30000.0,
                        value=float(sel_h.selling_price_effective), step=25.0
                    )
                    new_notes = st.text_input(
                        "ملاحظات وشروط التعاقد:",
                        value=getattr(sel_h, 'contract_notes', '') or f"تعاقد حي {sel_h.neighborhood_ar}"
                    )

                # المعاينة الفورية للهوامش
                preview_profit = new_selling_price - new_proc_cost
                preview_profit_pct = (preview_profit / new_proc_cost * 100) if new_proc_cost > 0 else 0
                preview_savings = max(0.0, new_market_price - new_selling_price)
                preview_savings_pct = (preview_savings / new_market_price * 100) if new_market_price > 0 else 0
                preview_total_profit = preview_profit * new_allotment

                st.info(
                    f"💡 **المؤشرات بعد التعديل:** "
                    f"صافي الربح: **{preview_profit:,.0f} ر.س** ({preview_profit_pct:.1f}%) | "
                    f"وفر العميل عن بوكينج: **{preview_savings:,.0f} ر.س** ({preview_savings_pct:.1f}%) | "
                    f"إجمالي ربح الكوتة: **{preview_total_profit:,.0f} ر.س**"
                )

                if st.button("💾 حفظ وتحديث التعاقد والأسعار الآن", use_container_width=True, type="primary"):
                    sel_h.contract_status = new_status
                    sel_h.procurement_cost_b2b = new_proc_cost
                    sel_h.ota_market_price = new_market_price
                    sel_h.allotment_total_rooms = new_allotment
                    sel_h.contract_notes = new_notes
                    # تحديث سعر الغرفة الأولى إن وجدت
                    if sel_h.rooms:
                        sel_h.rooms[0].price_full_room_b2c = new_selling_price
                        sel_h.rooms[0].price_full_room_b2b = new_proc_cost
                    save_current_state()
                    st.toast(f"تم تحديث بيانات وتعاقد فندق '{sel_h.name_ar}' بنجاح!", icon="✅")
                    st.rerun()

        with col_ed2:
            with st.container(border=True):
                st.markdown("### 🧮 حاسبة العروض السعرية والصفقات الفورية (Deal Generator)")
                st.caption("احسب تكلفة وأرباح ووفر أي عرض سعر لعميل أو شركة عمرة فورياً لنفس الفندق.")
                
                deal_hotel_name = st.selectbox("فندق العرض السعري:", list(hotel_options.keys()), key="deal_hotel_sel")
                deal_h = hotel_options[deal_hotel_name]

                col_d1, col_d2 = st.columns(2)
                with col_d1:
                    deal_rooms = st.number_input("عدد الغرف المطلوبة:", min_value=1, max_value=200, value=10, step=1)
                with col_d2:
                    deal_nights = st.number_input("عدد الليالي:", min_value=1, max_value=30, value=5, step=1)

                total_room_nights = deal_rooms * deal_nights
                total_cost_deal = deal_h.procurement_price_effective * total_room_nights
                total_market_deal = deal_h.market_price_effective * total_room_nights
                total_client_deal = deal_h.selling_price_effective * total_room_nights
                total_profit_deal = total_client_deal - total_cost_deal
                total_savings_deal = max(0.0, total_market_deal - total_client_deal)

                st.markdown("#### 📊 ملخص الصفقة المالية:")
                m_c1, m_c2 = st.columns(2)
                with m_c1:
                    st.metric("تكلفة الشراء الإجمالية علينا B2B", f"{total_cost_deal:,.0f} ر.س")
                    st.metric("إجمالي عرض السعر للعميل B2C", f"{total_client_deal:,.0f} ر.س")
                with m_c2:
                    st.metric("صافي ربح الصفقة لنا", f"{total_profit_deal:,.0f} ر.س", f"هامش {(total_profit_deal/total_cost_deal*100):.1f}%")
                    st.metric("وفر العميل معنا مقارنة ببوكينج", f"{total_savings_deal:,.0f} ر.س", f"وفر {(total_savings_deal/total_market_deal*100):.1f}%")

                deal_text = (
                    f"السلام عليكم ورحمة الله وبركاته،\n"
                    f"يسرنا تقديم عرض السعر الحصري التالي:\n\n"
                    f"🏨 فندق: {deal_h.name_ar} ({deal_h.star_rating} نجوم)\n"
                    f"📍 الموقع: {deal_h.city_label_ar} - حي {deal_h.neighborhood_ar} ({deal_h.distance_to_haram_m}م عن ساحات الحرم)\n"
                    f"🛌 عدد الغرف: {deal_rooms} غرفة | 🌙 عدد الليالي: {deal_nights} ليالٍ (إجمالي {total_room_nights} ليلة فندقية)\n"
                    f"🏷️ سعر الغرفة لليلة معنا: {deal_h.selling_price_effective:,.0f} ر.س فقط شامل الضريبة والخدمة\n"
                    f"💰 إجمالي قيمة الإقامة: {total_client_deal:,.0f} ر.س\n\n"
                    f"⭐ سعر نفس الإقامة على موقع بوكينج: {total_market_deal:,.0f} ر.س\n"
                    f"🎉 وفركم الحقيقي معنا: {total_savings_deal:,.0f} ر.س (خصم {deal_h.customer_savings_percent:.1f}% عن سعر السوق)\n\n"
                    f"للطلب وتأكيد الحجز يرجى الرد على هذه الرسالة."
                )

                st.text_area("📋 نص العرض السعري جاهز للنسخ والإرسال للعميل (واتساب / إيميل):", deal_text, height=140)

# -------------------------------------------------------------
# التبويب 2: تصنيف التغطية بالأحياء والمركزية
# -------------------------------------------------------------
with tab_neighborhoods:
    st.subheader("🏘️ تصنيف وتحليل التغطية التشغيلية حسب الأحياء ومستوى المركزية")
    st.caption("استعراض شامل ودقيق لتوزيع الفنادق في مكة المكرمة والمدينة المنورة عبر الأحياء الفندقية ومقارنة مستوى المركزية وأسعار الشراء وبوكينج.")

    hotels_list = st.session_state.hotels

    if not hotels_list:
        st.warning("⚠️ لا توجد فنادق مسجلة في قاعدة البيانات حالياً.")
    else:
        # خيار اختيار المدينة
        nh_city_choice = st.radio(
            "اختر المدينة لعرض خريطة الأحياء والتغطية:",
            ["🕋 مكة المكرمة", "🕌 المدينة المنورة", "🌐 كلا المدينتين معاً"],
            horizontal=True
        )

        city_hotels = hotels_list
        if "مكة المكرمة" in nh_city_choice:
            city_hotels = [h for h in hotels_list if h.city == "makkah"]
        elif "المدينة المنورة" in nh_city_choice:
            city_hotels = [h for h in hotels_list if h.city == "madinah"]

        # تجميع الإحصائيات حسب الحي
        nh_dict = {}
        for h in city_hotels:
            nh = h.neighborhood_ar or "غير محدد"
            if nh not in nh_dict:
                nh_dict[nh] = {
                    "total": 0, "central": 0, "non_central": 0, "contracted": 0,
                    "cost_sum": 0.0, "market_sum": 0.0, "selling_sum": 0.0, "savings_sum": 0.0,
                    "hotels": []
                }
            nh_dict[nh]["total"] += 1
            if getattr(h, 'is_central', True):
                nh_dict[nh]["central"] += 1
            else:
                nh_dict[nh]["non_central"] += 1
            if getattr(h, 'contract_status', 'open_lead') == 'contracted':
                nh_dict[nh]["contracted"] += 1
            nh_dict[nh]["cost_sum"] += h.procurement_price_effective
            nh_dict[nh]["market_sum"] += h.market_price_effective
            nh_dict[nh]["selling_sum"] += h.selling_price_effective
            nh_dict[nh]["savings_sum"] += h.customer_savings_sar
            nh_dict[nh]["hotels"].append(h)

        # جدول إحصاء الأحياء
        nh_table = []
        for nh, data in sorted(nh_dict.items(), key=lambda x: -x[1]["total"]):
            cnt = data["total"]
            avg_c = data["cost_sum"] / cnt if cnt > 0 else 0
            avg_m = data["market_sum"] / cnt if cnt > 0 else 0
            avg_s = data["selling_sum"] / cnt if cnt > 0 else 0
            avg_sav = data["savings_sum"] / cnt if cnt > 0 else 0
            cov_rate = (data["contracted"] / cnt * 100) if cnt > 0 else 0

            nh_table.append({
                "اسم الحي": nh,
                "إجمالي الفنادق": cnt,
                "🟢 فنادق مركزية": data["central"],
                "🟣 فنادق غير مركزية (شاتل)": data["non_central"],
                "✅ متعاقد عليها": data["contracted"],
                "نسبة التغطية التعاقدية": f"{cov_rate:.1f}%",
                "متوسط سعر الشراء B2B": f"{avg_c:,.0f} ر.س",
                "متوسط سعر بوكينج": f"{avg_m:,.0f} ر.س",
                "متوسط سعر البيع B2C": f"{avg_s:,.0f} ر.س",
                "متوسط وفر العميل": f"{avg_sav:,.0f} ر.س"
            })

        st.markdown(f"#### 📊 إحصائيات التغطية حسب الأحياء ({len(nh_table)} حي مغطى):")
        st.dataframe(pd.DataFrame(nh_table), use_container_width=True)

        st.divider()

        # الاستعراض التفصيلي لحي معين
        st.markdown("#### 🔍 فحص فنادق حي معين بالتفصيل:")
        selected_nh_inspect = st.selectbox(
            "اختر الحي لاستعراض كافة فنادقه وأسعاره:",
            list(sorted(nh_dict.keys(), key=lambda x: -nh_dict[x]["total"]))
        )

        inspect_data = nh_dict[selected_nh_inspect]
        hotels_in_nh = inspect_data["hotels"]

        col_nh1, col_nh2, col_nh3, col_nh4 = st.columns(4)
        col_nh1.metric("عدد فنادق الحي", f"{len(hotels_in_nh)} فندق")
        col_nh2.metric("🟢 فنادق مركزية (مشياً)", f"{inspect_data['central']} فندق")
        col_nh3.metric("🟣 فنادق غير مركزية (شاتل)", f"{inspect_data['non_central']} فندق")
        col_nh4.metric("✅ عقود مفعلة", f"{inspect_data['contracted']} عقد")

        st.caption(f"عرض فنادق حي **{selected_nh_inspect}**:")
        for idx in range(0, len(hotels_in_nh), 2):
            cols = st.columns(2)
            for j in range(2):
                if idx + j < len(hotels_in_nh):
                    h = hotels_in_nh[idx + j]
                    with cols[j]:
                        with st.container(border=True):
                            if h.cover_image_url:
                                st.image(h.cover_image_url, use_container_width=True)
                            st.markdown(f"### {h.name_ar} {'⭐' * h.star_rating}")
                            st.caption(f"{h.name_en} | الكود: {h.hotel_code}")

                            c_color = "#10b981" if getattr(h, 'is_central', True) else "#8b5cf6"
                            c_text = "🟢 فندق مركزي (مشياً للحرم)" if getattr(h, 'is_central', True) else "🟣 غير مركزي (حافلات شاتل)"
                            stat_label = getattr(h, 'contract_status_label_ar', '✅ تم التعاقد')
                            
                            st.markdown(
                                f"<span style='background:{c_color}22; color:{c_color}; font-weight:bold; padding:4px 8px; border-radius:6px;'>{c_text}</span> "
                                f"<span style='background:#f1f5f9; padding:4px 8px; border-radius:6px; font-weight:bold;'>🏘️ حي {h.neighborhood_ar}</span> "
                                f"<span style='background:#e0f2fe; padding:4px 8px; border-radius:6px; font-weight:bold;'>{stat_label}</span>",
                                unsafe_allow_html=True
                            )

                            st.markdown(f"📍 **المسافة:** **{h.distance_to_haram_m} متر** عن الحرم ({h.zone_label_ar})")
                            st.markdown(f"📞 **الهاتف:** `{h.contact_phone}`")
                            
                            col_pr1, col_pr2, col_pr3 = st.columns(3)
                            col_pr1.metric("سعر الشراء B2B", f"{h.procurement_price_effective:,.0f} ر.س")
                            col_pr2.metric("سعر بوكينج", f"{h.market_price_effective:,.0f} ر.س")
                            col_pr3.metric("سعر البيع B2C", f"{h.selling_price_effective:,.0f} ر.س")

                            st.success(f"🎉 **وفر العميل معنا:** **{h.customer_savings_sar:,.0f} ر.س** في الليلة (خصم {h.customer_savings_percent:.1f}% عن بوكينج!) | **صافي ربحنا:** **{h.profit_per_room_sar:,.0f} ر.س**")

                            col_b1, col_b2 = st.columns(2)
                            with col_b1:
                                if h.booking_url:
                                    st.link_button("🏨 فتح صفحة بوكينج الأصلية", h.booking_url, use_container_width=True)
                            with col_b2:
                                if h.google_maps_url:
                                    st.link_button("📍 فتح الموقع على خرائط Google", h.google_maps_url, use_container_width=True)

# -------------------------------------------------------------
# التبويب 3: محرك الكشط الحي الشامل لمنصات الحجز العالمية
# -------------------------------------------------------------
with tab_live_search:
    st.subheader("🌐 محرك الكشط والبحث الحي الشامل من منصات الحجز العالمية (Live Multi-OTA Scraper)")
    st.caption("كشط مباشر وتلقائي لفنادق مكة المكرمة والمدينة المنورة من كبرى منصات الحجز (Booking.com، Agoda، Expedia، Trivago) بالصور الحقيقية الأصلية HD، الأسعار، تقييمات النزلاء، وتصنيف المركزية والأحياء.")
    
    db_count = len(st.session_state.hotels)
    st.markdown("#### 📊 حالة قاعدة البيانات الحالية والتصفير:")
    col_stat1, col_stat2, col_stat3 = st.columns([2, 1, 1])
    with col_stat1:
        if db_count == 0:
            st.info("⚪ **قاعدة البيانات فارغة تماماً حالياً (0 فندق)** - جاهزة لبدء كشط حي جديد وتخزين الفنادق الحقيقية.")
        else:
            makkah_sub = sum(1 for h in st.session_state.hotels if h.city == 'makkah')
            madinah_sub = sum(1 for h in st.session_state.hotels if h.city == 'madinah')
            central_sub = sum(1 for h in st.session_state.hotels if getattr(h, 'is_central', True))
            non_central_sub = db_count - central_sub
            st.success(f"🟢 **مسجل حالياً في قاعدة البيانات:** **{db_count} فندق** (مكة: {makkah_sub} | المدينة: {madinah_sub} | 🕋 مركزي: {central_sub} | 🚌 غير مركزي: {non_central_sub})")
    with col_stat2:
        if st.button("🗑️ تصفير ومسح الكل (0 فندق)", key="btn_clear_live_tab", use_container_width=True, type="secondary"):
            clear_all_data()
            st.toast("تم تصفير ومسح قاعدة البيانات بالكامل (0 فندق) بنجاح!", icon="🗑️")
            st.rerun()
    with col_stat3:
        if st.button("🔄 استعادة الدليل الموسع (229 فندقاً)", key="btn_restore_live_tab", use_container_width=True):
            st.session_state.hotels = get_default_seed_hotels()
            save_current_state()
            st.toast("تم استرجاع الفنادق النموذجية!", icon="✅")
            st.rerun()

    st.divider()

    st.markdown("#### 🔍 معايير الكشط المباشر وسحب الفنادق:")
    with st.container(border=True):
        col_c1, col_c2 = st.columns(2)
        with col_c1:
            search_city = st.selectbox(
                "1. اختر المدينة للتغطية والكشط:",
                [
                    "مكة المكرمة (حول الكعبة المشرفة ومحيطها)",
                    "المدينة المنورة (حول المسجد النبوي ومحيطه)",
                    "كلا المدينتين معاً (مكة والمدينة)"
                ]
            )
            scraper_engine = st.selectbox(
                "2. المحرك البرمجي المستخدم للكشط:",
                [
                    "⚡ محرك الكشط الحي لمنصات الحجز العالمية (Booking.com & Global OTAs - Playwright Stealth)",
                    "🛰️ محرك المسح الميداني والخرائط المفتوحة (OpenStreetMap Crawler)"
                ]
            )
        with col_c2:
            centrality_choice = st.selectbox(
                "3. تصنيف المركزية المطلوب سحبه:",
                [
                    "🕋 كافة الفنادق (مركزية وغير مركزية)",
                    "🟢 فنادق مركزية فقط (المطلة والمحيطة بساحات الحرم مشياً حتى 1200م)",
                    "🟣 فنادق غير مركزية فقط (نطاق شاتل باص وحافلات النقل > 1200م)"
                ]
            )
            search_count = st.number_input(
                "4. عدد الفنادق المطلوب سحبها بدقة لكل مدينة:",
                min_value=5, max_value=200, value=25, step=5
            )

        col_m1, col_m2 = st.columns(2)
        with col_m1:
            save_mode = st.radio(
                "طريقة حفظ النتائج وتحديث قاعدة البيانات:",
                [
                    "🔄 تحديث ودمج الفنادق الجديدة فوق البيانات السابقة (تراكمي - الإعداد الافتراضي والمستحسن)",
                    "⚠️ مسح القديم والبدء من الصفر بهذه الفنادق فقط"
                ],
                index=0,
                horizontal=True
            )
        with col_m2:
            st.info("ℹ️ **ميزة الذكاء الفندقي:** يتم سحب الصور الحقيقية الأصلية HD مباشرة من سيرفرات الحجز العالمية بدقة 1024x768، مع استخراج تقييم النزلاء الحقيقي، الحي الدقيق، وتصنيف المركزية.")

        btn_start_crawl = st.button("🚀 ابدأ الكشط الحي وسحب الفنادق الحقيقية الآن", use_container_width=True, type="primary")

    if btn_start_crawl:
        city_key = "makkah" if "مكة المكرمة (" in search_city else ("madinah" if "المدينة المنورة (" in search_city else "both")
        
        cent_filter = "all"
        if "مركزية فقط" in centrality_choice:
            cent_filter = "central_only"
        elif "غير مركزية فقط" in centrality_choice:
            cent_filter = "non_central_only"

        status_box = st.empty()
        def on_crawler_update(msg):
            status_box.info(f"⏳ {msg}")

        with st.spinner("جاري الاتصال المباشر بمنصات الحجز وفحص الفنادق الحقيقية والكشط العميق للصور والبيانات..."):
            if "Booking.com" in scraper_engine:
                crawled_hotels = scrape_live_ota_hotels(
                    city=city_key,
                    target_count=search_count,
                    filter_centrality=cent_filter,
                    status_callback=on_crawler_update
                )
            else:
                crawled_hotels = crawl_live_hotels(
                    city=city_key,
                    radius_meters=3000,
                    target_count=search_count,
                    auto_expand=True,
                    status_callback=on_crawler_update,
                    enable_deep_scraping=True
                )

            status_box.empty()

            if crawled_hotels:
                # حفظ وتحديث البيانات تراكمياً
                if "مسح" in save_mode:
                    st.session_state.hotels = crawled_hotels
                    save_current_state()
                    st.success(f"🎉 تم استبدال وتخزين **{len(crawled_hotels)}** فندق حقيقي في قاعدة البيانات بنجاح!")
                else:
                    merged_hotels, added_cnt, updated_cnt = merge_and_update_hotels(
                        existing_hotels=st.session_state.hotels,
                        new_hotels=crawled_hotels
                    )
                    st.session_state.hotels = merged_hotels
                    save_current_state()
                    st.success(
                        f"🎉 **تم التحديث التراكمي لقاعدة البيانات بنجاح!** "
                        f"➕ تمت إضافة **{added_cnt}** فندق جديد، "
                        f"🔄 وتحديث **{updated_cnt}** فندق سابق. "
                        f"📊 إجمالي الفنادق المسجلة حالياً: **{len(merged_hotels)} فندق حقيقي**!"
                    )

                # إحصائيات سريعة
                m_central = sum(1 for h in crawled_hotels if getattr(h, 'is_central', True))
                m_non_central = len(crawled_hotels) - m_central
                avg_rating = sum(getattr(h, 'ota_rating_booking', 8.5) for h in crawled_hotels) / len(crawled_hotels) if crawled_hotels else 8.5

                c_stat1, c_stat2, c_stat3, c_stat4 = st.columns(4)
                c_stat1.metric("إجمالي الفنادق المكشوطة", f"{len(crawled_hotels)} فندق")
                c_stat2.metric("🟢 فنادق مركزية (مشياً للحرم)", f"{m_central}")
                c_stat3.metric("🟣 فنادق غير مركزية (شاتل باص)", f"{m_non_central}")
                c_stat4.metric("⭐ متوسط تقييم النزلاء", f"{avg_rating:.1f} / 10")

                # جدول النتائج المستخرجة
                st.markdown("#### 📋 قائمة الفنادق المستخرجة والمخزنة في قاعدة البيانات:")
                res_table = []
                for idx, h in enumerate(crawled_hotels, 1):
                    cent_label = "🟢 مركزي (مشياً)" if getattr(h, 'is_central', True) else "🟣 غير مركزي (شاتل)"
                    res_table.append({
                        "م": idx,
                        "الكود": h.hotel_code,
                        "اسم الفندق": h.name_ar,
                        "المدينة": h.city_label_ar,
                        "الحي": h.neighborhood_ar,
                        "تصنيف المركزية": cent_label,
                        "المسافة عن الحرم": f"{h.distance_to_haram_m} متر",
                        "النجوم": f"{h.star_rating}⭐",
                        "تقييم بوكينج": f"⭐ {getattr(h, 'ota_rating_booking', 8.8):.1f}/10",
                        "أقل سعر B2C": f"{h.min_b2c_price:.0f} ر.س",
                        "سعر الشراء B2B": f"{h.procurement_price_effective:.0f} ر.س",
                        "وفر العميل": f"{h.customer_savings_sar:.0f} ر.س",
                        "رابط الفندق المباشر": h.booking_url or "-"
                    })
                st.dataframe(pd.DataFrame(res_table), use_container_width=True)
                st.balloons()
            else:
                st.error("لم نتمكن من كشط فنادق في هذا النطاق، يرجى التحقق من الاتصال والمحاولة مجدداً.")

# -------------------------------------------------------------
# التبويب 4: كتالوج الفنادق والخريطة التفاعلية
# -------------------------------------------------------------
with tab_catalog:
    st.subheader(f"🏨 كتالوج وقاعدة بيانات الفنادق ({len(st.session_state.hotels)} فندق)")
    
    if not st.session_state.hotels:
        st.warning("⚠️ قاعدة البيانات فارغة حالياً (0 فندق). انتقل إلى تبويب 'محرك الكشط الحي' لسحب وتخزين الفنادق فوراً!")
    else:
        # فلاتر العرض المتقدمة
        col_f1, col_f2, col_f3, col_f4 = st.columns(4)
        with col_f1:
            filter_city = st.selectbox("تصفية بالمدينة:", ["الكل", "مكة المكرمة", "المدينة المنورة"], key="cat_city_tab")
        with col_f2:
            filter_central = st.selectbox(
                "تصفية بالمركزية:",
                ["الكل", "🟢 فنادق مركزية (مشياً للحرم)", "🟣 فنادق غير مركزية (حافلات شاتل)"],
                key="cat_central_tab"
            )
        with col_f3:
            recorded_neighborhoods = sorted(list(set(h.neighborhood_ar for h in st.session_state.hotels if h.neighborhood_ar)))
            filter_neighborhood = st.selectbox("تصفية بالحي:", ["كافة الأحياء"] + recorded_neighborhoods, key="cat_neighborhood_tab")
        with col_f4:
            filter_search = st.text_input("بحث بالاسم، الكود، أو الحي:", key="cat_search_tab")

        display_hotels = st.session_state.hotels
        if filter_city == "مكة المكرمة":
            display_hotels = [h for h in display_hotels if h.city == "makkah"]
        elif filter_city == "المدينة المنورة":
            display_hotels = [h for h in display_hotels if h.city == "madinah"]
        
        if "مركزية (" in filter_central:
            display_hotels = [h for h in display_hotels if getattr(h, 'is_central', True)]
        elif "غير مركزية (" in filter_central:
            display_hotels = [h for h in display_hotels if not getattr(h, 'is_central', True)]

        if filter_neighborhood != "كافة الأحياء":
            display_hotels = [h for h in display_hotels if h.neighborhood_ar == filter_neighborhood]

        if filter_search:
            q = filter_search.lower()
            display_hotels = [h for h in display_hotels if q in h.name_ar.lower() or q in h.hotel_code.lower() or q in (h.neighborhood_ar or '').lower()]

        st.caption(f"عدد الفنادق المعروضة وفق الفلاتر: **{len(display_hotels)} فندق** من أصل {len(st.session_state.hotels)} مسجلة.")

        # خريطة تفاعلية
        map_points = [{"lat": h.latitude, "lon": h.longitude, "name": h.name_ar} for h in display_hotels if h.latitude and h.longitude]
        if map_points:
            with st.expander(f"🗺️ خريطة المواقع التفاعلية ({len(map_points)} فندق)", expanded=False):
                st.map(pd.DataFrame(map_points), latitude="lat", longitude="lon", zoom=13)

        # نمط العرض
        view_mode = st.radio(
            "اختر نمط الاستعراض:",
            ["📋 جدول البيانات الشامل (Excel Table)", "🖼️ معرض بطاقات الفنادق بالصور الحقيقية (Cards Gallery)"],
            horizontal=True
        )

        if "جدول" in view_mode:
            catalog_table = []
            for h in display_hotels:
                cent_badge = "🟢 مركزي" if getattr(h, 'is_central', True) else "🟣 غير مركزي"
                catalog_table.append({
                    "الكود": h.hotel_code,
                    "اسم الفندق": h.name_ar,
                    "المدينة": h.city_label_ar,
                    "الحي": h.neighborhood_ar,
                    "المركزية": cent_badge,
                    "حالة التعاقد": getattr(h, 'contract_status_label_ar', '✅ تم التعاقد'),
                    "المسافة": f"{h.distance_to_haram_m}م",
                    "النجوم": f"{h.star_rating}⭐",
                    "تقييم بوكينج": f"⭐ {getattr(h, 'ota_rating_booking', 8.8):.1f}/10",
                    "سعر الشراء B2B": f"{h.procurement_price_effective:,.0f} ر.س",
                    "سعر السوق (بوكينج)": f"{h.market_price_effective:,.0f} ر.س",
                    "سعر البيع B2C": f"{h.selling_price_effective:,.0f} ر.س",
                    "وفر العميل": f"{h.customer_savings_sar:,.0f} ر.س",
                    "هاتف التواصل": h.contact_phone,
                    "Booking": h.booking_url or "-",
                    "الخريطة": h.google_maps_url
                })
            st.dataframe(pd.DataFrame(catalog_table), use_container_width=True)
        else:
            st.caption(f"عرض {len(display_hotels)} فندق بصورها الفوتوغرافية الحقيقية:")
            for i in range(0, len(display_hotels), 2):
                cols = st.columns(2)
                for j in range(2):
                    if i + j < len(display_hotels):
                        h = display_hotels[i + j]
                        with cols[j]:
                            with st.container(border=True):
                                if h.cover_image_url:
                                    st.image(h.cover_image_url, use_container_width=True)
                                st.markdown(f"### {h.name_ar} {'⭐' * h.star_rating}")
                                st.caption(f"{h.name_en} | {h.hotel_code}")
                                
                                ota_rating = getattr(h, 'ota_rating_booking', 8.8) or 8.8
                                ota_rev = getattr(h, 'ota_reviews_count', 1200) or 1200
                                st.info(f"⭐ **تقييم بوكينج المعتمد:** `{ota_rating:.1f}/10` ({ota_rev:,} تقييم حقيقي)")

                                cent_color = "#10b981" if getattr(h, 'is_central', True) else "#8b5cf6"
                                cent_text = "🟢 فندق مركزي (مشياً للحرم)" if getattr(h, 'is_central', True) else "🟣 فندق غير مركزي (شاتل باص)"
                                st.markdown(
                                    f"<span style='background:{cent_color}22; color:{cent_color}; font-weight:bold; padding:4px 8px; border-radius:6px;'>{cent_text}</span> "
                                    f"<span style='background:#f1f5f9; padding:4px 8px; border-radius:6px; font-weight:bold;'>🏘️ حي {h.neighborhood_ar}</span> "
                                    f"<span style='background:#e0f2fe; padding:4px 8px; border-radius:6px; font-weight:bold;'>{getattr(h, 'contract_status_label_ar', '✅ تم التعاقد')}</span>",
                                    unsafe_allow_html=True
                                )

                                st.markdown(f"🚶 **المسافة:** **{h.distance_to_haram_m} متر** عن الحرم ({h.zone_label_ar})")
                                st.markdown(f"📞 **الهاتف:** `{h.contact_phone}`")
                                
                                p_c1, p_c2, p_c3 = st.columns(3)
                                p_c1.metric("سعر الشراء B2B", f"{h.procurement_price_effective:,.0f} ر.س")
                                p_c2.metric("سعر بوكينج", f"{h.market_price_effective:,.0f} ر.س")
                                p_c3.metric("سعر البيع B2C", f"{h.selling_price_effective:,.0f} ر.س")

                                st.success(f"🎉 **وفر العميل:** **{h.customer_savings_sar:,.0f} ر.س** في الليلة | **ربحنا:** **{h.profit_per_room_sar:,.0f} ر.س**")

                                ota_c1, ota_c2 = st.columns(2)
                                with ota_c1:
                                    if h.booking_url:
                                        st.link_button("🏨 صفحة الفندق على بوكينج", h.booking_url, use_container_width=True)
                                with ota_c2:
                                    if h.google_maps_url:
                                        st.link_button("📍 خرائط Google", h.google_maps_url, use_container_width=True)

        with st.expander("🌐 استعراض شيت ودليل HTML التفاعلي مباشرة (فلترة فورية، فرز أعمدة، وتصدير)", expanded=False):
            html_p = EXPORTS_DIR / "hotels_catalog.html"
            if html_p.exists():
                with open(html_p, "r", encoding="utf-8") as hf:
                    st.components.v1.html(hf.read(), height=800, scrolling=True)

# -------------------------------------------------------------
# التبويب 5: إضافة وتعديل فندق وتعاقد يدوياً
# -------------------------------------------------------------
with tab_add:
    st.subheader("➕ إضافة فندق جديد وتعاقد إلى منظومة العمليات")
    with st.form("manual_add_proc_form"):
        col1, col2 = st.columns(2)
        with col1:
            m_code = st.text_input("كود الفندق:", value=f"MAK-HOTEL-{len(st.session_state.hotels)+1:03d}")
            m_name_ar = st.text_input("اسم الفندق بالعربي:", placeholder="فندق درة أجياد مكة")
            m_name_en = st.text_input("اسم الفندق بالإنجليزي:", placeholder="Durrat Ajyad Hotel")
            m_city = st.selectbox("المدينة:", ["مكة المكرمة", "المدينة المنورة"])
            m_neighborhood = st.text_input("الحي الفندقي:", value="أجياد")
            m_stars = st.slider("تصنيف النجوم:", 1, 5, 4)
            m_status = st.selectbox("حالة التعاقد والتغطية:", ["contracted", "negotiating", "open_lead"],
                                    format_func=lambda x: {"contracted": "✅ تم التعاقد وتثبيت السعر", "negotiating": "⏳ قيد التفاوض", "open_lead": "🎯 فرصة غير مغطاة"}.get(x))

        with col2:
            m_lat = st.number_input("خط العرض (Latitude):", value=21.419200, format="%.6f")
            m_lng = st.number_input("خط الطول (Longitude):", value=39.825500, format="%.6f")
            
            c_code = "makkah" if m_city == "مكة المكرمة" else "madinah"
            calc_dist = calculate_distance_to_haram(m_lat, m_lng, c_code)
            _, c_zone_label, _ = determine_hotel_zone(calc_dist)
            is_cent = (calc_dist <= 1200)
            st.info(f"المسافة المحسوبة تلقائياً: **{calc_dist} متر** عن الحرم ({c_zone_label}) - {'🟢 فندق مركزي' if is_cent else '🟣 غير مركزي'}")

            m_phone = st.text_input("هاتف التواصل:", value="+966 12 000 0000")
            m_cost = st.number_input("سعر الشراء الفعلي B2B (التكلفة) ر.س:", value=450.0, step=25.0)
            m_market = st.number_input("سعر السوق على بوكينج ر.س:", value=650.0, step=25.0)
            m_b2c = st.number_input("سعر البيع المعتمد B2C ر.س:", value=550.0, step=25.0)
            m_allotment = st.number_input("الغرف المخصصة (Allotment):", value=20, step=5)

        m_submit = st.form_submit_button("💾 حفظ الفندق والتعاقد في قاعدة البيانات", use_container_width=True)
        if m_submit:
            if not m_name_ar:
                st.error("يرجى إدخال اسم الفندق بالعربي.")
            else:
                new_h = Hotel(
                    hotel_code=m_code,
                    name_ar=m_name_ar,
                    name_en=m_name_en or m_name_ar,
                    city=c_code,
                    neighborhood_ar=m_neighborhood,
                    latitude=m_lat,
                    longitude=m_lng,
                    star_rating=m_stars,
                    contact_phone=m_phone,
                    is_central=is_cent,
                    contract_status=m_status,
                    procurement_cost_b2b=m_cost,
                    ota_market_price=m_market,
                    allotment_total_rooms=m_allotment,
                    contract_notes=f"تعاقد حي {m_neighborhood}",
                    rooms=[
                        RoomType(
                            room_code=f"{m_code}-STD-1",
                            room_category="quad",
                            title_ar="غرفة قياسية",
                            bed_count=4,
                            price_full_room_b2c=m_b2c,
                            price_full_room_b2b=m_cost,
                            allow_bed_booking=True
                        )
                    ]
                )
                st.session_state.hotels.append(new_h)
                save_current_state()
                st.success(f"تمت إضافة فندق '{m_name_ar}' بنجاح!")
                st.rerun()

# -------------------------------------------------------------
# التبويب 6: فحص واستيراد إكسيل أو HTML التفاعلي
# -------------------------------------------------------------
with tab_excel:
    st.subheader("📊 فحص واستيراد شيت إكسيل أو ملف HTML تفاعلي")
    st.caption("يمكنك استيراد ملف إكسيل (.xlsx) أو ملف دليل HTML تفاعلي (.html) لتحديث قاعدة البيانات بنظام تراكمي متقدم.")
    up_file = st.file_uploader("اختر ملف إكسيل (.xlsx) أو ملف HTML (.html) لفحصه:", type=["xlsx", "html"])
    if up_file:
        is_html = up_file.name.endswith(".html")
        if is_html:
            t_path = DATA_DIR / "temp_inspect.html"
            with open(t_path, "wb") as f:
                f.write(up_file.getbuffer())
            parsed_hotels, errs, warns = parse_html_file(t_path)
        else:
            t_path = DATA_DIR / "temp_inspect.xlsx"
            with open(t_path, "wb") as f:
                f.write(up_file.getbuffer())
            parsed_hotels, errs, warns = parse_excel_file(t_path)

        if errs:
            st.error("❌ أخطاء تمنع الاستيراد:")
            for e in errs:
                st.write(f"- {e}")
        else:
            st.success(f"✅ تم فحص الملف بنجاح! تم العثور على **{len(parsed_hotels)}** فندق.")
            if warns:
                st.warning(f"تنبيهات تلقائية: {len(warns)}")
                for w in warns[:3]:
                    st.caption(f"- {w}")

            if st.button("📥 دمج وتحديث هذه الفنادق مع قاعدة البيانات الحالية (تراكمي)", type="primary"):
                merged, added_c, upd_c = merge_and_update_hotels(st.session_state.hotels, parsed_hotels)
                st.session_state.hotels = merged
                save_current_state()
                st.success(f"🎉 تم دمج البيانات بنجاح! (+{added_c} فندق جديد، 🔄 {upd_c} فندق محدث)")
                st.rerun()

# -------------------------------------------------------------
# التبويب 7: تصدير تقارير التشغيل والبيانات (Reports & Exports)
# -------------------------------------------------------------
with tab_export:
    st.subheader("📥 تصدير وتنزيل تقارير التشغيل والتعاقدات وقاعدة البيانات")
    st.caption("تنزيل تقرير التعاقدات والأسعار وهوامش الربح، الكتالوج الميداني 26 عاموداً، شيت HTML التفاعلي، وكود SQL Seeder.")
    
    col_x1, col_x2 = st.columns(2)
    with col_x1:
        with st.container(border=True):
            st.markdown("### 💼 تقرير التعاقدات والأسعار وهوامش الربح (.xlsx)")
            st.caption("شيت إكسيل تنفيذي (23 عاموداً) يوضح سعر الشراء الفعلي، سعر بوكينج، سعر البيع B2C، صافي الربح، وفر العميل، والكوتات وتصنيف الأحياء والمركزية.")
            if st.session_state.hotels:
                proc_file = EXPORTS_DIR / "hotel_procurement_and_coverage_report.xlsx"
                export_procurement_and_coverage_excel(st.session_state.hotels, proc_file)
                with open(proc_file, "rb") as pf:
                    st.download_button(
                        "⬇️ تحميل شيت تقرير التعاقدات والأسعار (.xlsx)",
                        data=pf.read(),
                        file_name="hotel_procurement_and_coverage_report.xlsx",
                        mime="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                        use_container_width=True,
                        type="primary"
                    )
            else:
                st.info("قاعدة البيانات فارغة حالياً.")

        with st.container(border=True):
            st.markdown("### 🌐 دليل وشيت HTML التفاعلي المستقل (.html)")
            st.caption("ملف ويب تفاعلي مستقل يعمل كشيت إكسيل حي مع فرز الأعمدة، فلاتر البحث، والنسخ وعرض البطاقات بدون الحاجة لإنترنت.")
            if st.session_state.hotels:
                html_file = EXPORTS_DIR / "hotels_catalog.html"
                export_hotels_to_html(st.session_state.hotels, html_file)
                with open(html_file, "rb") as f:
                    st.download_button(
                        "⬇️ تحميل شيت ودليل HTML التفاعلي (.html)",
                        data=f.read(),
                        file_name="hotels_catalog.html",
                        mime="text/html",
                        use_container_width=True
                    )
            else:
                st.info("قاعدة البيانات فارغة حالياً.")

        with st.container(border=True):
            st.markdown("### 📊 شيت إكسيل الكتالوج الميداني (26 عاموداً)")
            if st.session_state.hotels:
                cat_file = EXPORTS_DIR / "makkah_madinah_hotels_catalog.xlsx"
                export_hotels_to_excel(st.session_state.hotels, cat_file)
                with open(cat_file, "rb") as f:
                    st.download_button(
                        "⬇️ تحميل كتالوج الفنادق الشامل (.xlsx)",
                        data=f.read(),
                        file_name="makkah_madinah_hotels_catalog.xlsx",
                        mime="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                        use_container_width=True
                    )
            else:
                st.info("قاعدة البيانات فارغة حالياً.")

    with col_x2:
        with st.container(border=True):
            st.markdown("### 🗄️ استعلامات بذر قاعدة البيانات (SQL Seeder)")
            st.caption("ملف SQL جاهز لبذر وتغذية قاعدة بيانات PostgreSQL 16 (23 جدولاً رسمياً).")
            if st.session_state.hotels:
                sql_file = EXPORTS_DIR / "seed_hotels.sql"
                export_hotels_to_sql(st.session_state.hotels, sql_file)
                with open(sql_file, "rb") as f:
                    st.download_button(
                        "⬇️ تحميل كود SQL لـ 23 جدولاً (.sql)",
                        data=f.read(),
                        file_name="seed_hotels.sql",
                        mime="text/plain",
                        use_container_width=True
                    )
            else:
                st.info("قاعدة البيانات فارغة حالياً.")

        with st.container(border=True):
            st.markdown("### ⚡ قاعدة البيانات بصيغة JSON الموحدة")
            json_dump = json.dumps([h.to_dict() for h in st.session_state.hotels], ensure_ascii=False, indent=2)
            st.download_button(
                "⬇️ تحميل ملف JSON الموحد (.json)",
                data=json_dump.encode("utf-8"),
                file_name="hotels_database.json",
                mime="application/json",
                use_container_width=True
            )

        with st.container(border=True):
            st.markdown("### 📗 قالب الإكسيل الفارغ المعتمد (26 عاموداً)")
            with open(template_file, "rb") as f:
                st.download_button(
                    "⬇️ تحميل القالب الفارغ (.xlsx)",
                    data=f.read(),
                    file_name="makkah_madinah_hotels_master_template.xlsx",
                    mime="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                    use_container_width=True
                )
