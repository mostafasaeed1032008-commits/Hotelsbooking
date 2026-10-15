"""
مدير شيتات الإكسيل (توليد القالب المعتمد ذو الـ 26 عاموداً، الفحص والاستيراد، والتصدير)
================================================================================
"""

from pathlib import Path
from typing import List, Dict, Tuple, Any
import openpyxl
from openpyxl.styles import Font, PatternFill, Alignment, Border, Side
from openpyxl.worksheet.datavalidation import DataValidation
from openpyxl.utils import get_column_letter

try:
    from ..config.settings import EXCEL_COLUMNS_SPEC, TEMPLATES_DIR, EXPORTS_DIR
    from ..models.hotel import Hotel, RoomType
    from .haram_geocoder import calculate_distance_to_haram, determine_hotel_zone, generate_google_maps_url
except (ImportError, ValueError):
    from config.settings import EXCEL_COLUMNS_SPEC, TEMPLATES_DIR, EXPORTS_DIR
    from models.hotel import Hotel, RoomType
    from services.haram_geocoder import calculate_distance_to_haram, determine_hotel_zone, generate_google_maps_url


def generate_master_template(output_path: Path = None) -> Path:
    """
    توليد شيت إكسيل رسمي احترافي مكون من 26 عاموداً
    مع تنسيقات ملكية وقوائم منسدلة وصفحة إرشادات.
    """
    if output_path is None:
        output_path = TEMPLATES_DIR / "makkah_madinah_hotels_master_template.xlsx"

    wb = openpyxl.Workbook()
    
    # ---------------------------------------------------------
    # 1. ورقة البيانات الرئيسية (Hotels Catalog)
    # ---------------------------------------------------------
    ws = wb.active
    ws.title = "دليل الفنادق والغرف المعتمد"
    ws.sheet_view.rightToLeft = True

    # الأنماط والتنسيقات
    header_font = Font(name="Segoe UI", size=11, bold=True, color="FFFFFF")
    header_fill = PatternFill(start_color="0F172A", end_color="0F172A", fill_type="solid") # كحلي ملكي
    gold_fill = PatternFill(start_color="92400E", end_color="92400E", fill_type="solid")   # ذهبي للعناوين المهمة
    
    thin_border = Border(
        left=Side(style='thin', color='CBD5E1'),
        right=Side(style='thin', color='CBD5E1'),
        top=Side(style='thin', color='CBD5E1'),
        bottom=Side(style='thin', color='CBD5E1')
    )
    align_center = Alignment(horizontal="center", vertical="center", wrap_text=True)
    align_right = Alignment(horizontal="right", vertical="center")

    # كتابة رؤوس الأعمدة الـ 26
    for col_idx, col_spec in enumerate(EXCEL_COLUMNS_SPEC, start=1):
        cell = ws.cell(row=1, column=col_idx, value=col_spec["label"])
        cell.font = header_font
        cell.fill = gold_fill if col_spec.get("required") else header_fill
        cell.alignment = align_center
        cell.border = thin_border
        
        # ضبط عرض العمود
        col_letter = get_column_letter(col_idx)
        ws.column_dimensions[col_letter].width = col_spec["width"]

    ws.row_dimensions[1].height = 36

    # ---------------------------------------------------------
    # 2. القوائم المنسدلة (Data Validations)
    # ---------------------------------------------------------
    # التحقق من المدينة
    dv_city = DataValidation(type="list", formula1='"مكة المكرمة,المدينة المنورة"', allow_blank=True)
    ws.add_data_validation(dv_city)
    dv_city.add("D2:D1000")

    # التحقق من النطاق
    dv_zone = DataValidation(type="list", formula1='"الصف الأول (مباشر على الساحات),المركزية (مشياً على الأقدام),مركزية متوسطة,باصات شاتل مجانية (24 ساعة)"', allow_blank=True)
    ws.add_data_validation(dv_zone)
    dv_zone.add("K2:K1000")

    # التحقق من النجوم
    dv_stars = DataValidation(type="list", formula1='"1,2,3,4,5"', allow_blank=True)
    ws.add_data_validation(dv_stars)
    dv_stars.add("L2:L1000")

    # التحقق من فئة الغرفة
    dv_room = DataValidation(type="list", formula1='"ثنائية (Double),ثلاثية (Triple),رباعية (Quad),خماسية (Quint),سداسية (Sext),جناح (Suite)"', allow_blank=True)
    ws.add_data_validation(dv_room)
    dv_room.add("Q2:Q1000")

    # التحقق من متاح بيع بالسرير
    dv_bed_sale = DataValidation(type="list", formula1='"نعم,لا"', allow_blank=True)
    ws.add_data_validation(dv_bed_sale)
    dv_bed_sale.add("T2:T1000")

    # التحقق من الإطلالة
    dv_view = DataValidation(type="list", formula1='"إطلالة كعبة,إطلالة حرم,إطلالة مدينة,داخلية"', allow_blank=True)
    ws.add_data_validation(dv_view)
    dv_view.add("U2:U1000")

    # التحقق من الوجبات
    dv_meal = DataValidation(type="list", formula1='"إقامة فقط (بدون وجبات),شامل إفطار بوفيه,نصف إقامة (إفطار + عشاء),إقامة كاملة (3 وجبات),شامل سحور رمضان المبارك"', allow_blank=True)
    ws.add_data_validation(dv_meal)
    dv_meal.add("V2:V1000")

    # ---------------------------------------------------------
    # 3. إدراج صفوف نموذجية وتوضيحية (Examples)
    # ---------------------------------------------------------
    sample_rows = [
        [
            "MAK-RAF-001", "فندق قصر رافلز مكة", "Raffles Makkah Palace", "مكة المكرمة", "أجياد",
            "أبراج البيت، وقف الملك عبد العزيز", 21.419262, 39.825838,
            "https://www.google.com/maps/search/?api=1&query=21.419262,39.825838",
            50, "الصف الأول (مباشر على الساحات)", 5, "+966 12 571 7888", "+966 50 123 4567",
            "https://images.unsplash.com/photo-1566073771259-6a8506099945", "https://images.unsplash.com/photo-1582719508461-905c673771fd",
            "جناح (Suite)", "جناح سيغنتشر إطلالة كعبة", 2, "لا", "إطلالة كعبة",
            "شامل إفطار بوفيه", 2800.0, 2350.0, None, None
        ],
        [
            "MAK-RAF-001", "فندق قصر رافلز مكة", "Raffles Makkah Palace", "مكة المكرمة", "أجياد",
            "أبراج البيت، وقف الملك عبد العزيز", 21.419262, 39.825838,
            "https://www.google.com/maps/search/?api=1&query=21.419262,39.825838",
            50, "الصف الأول (مباشر على الساحات)", 5, "+966 12 571 7888", "+966 50 123 4567",
            "https://images.unsplash.com/photo-1566073771259-6a8506099945", "",
            "رباعية (Quad)", "غرفة عائلية رباعية إطلالة حرم", 4, "نعم", "إطلالة حرم",
            "نصف إقامة (إفطار + عشاء)", 3600.0, 3000.0, 950.0, 780.0
        ],
        [
            "MED-OBR-001", "فندق أوبروي المدينة", "The Oberoi Madina", "المدينة المنورة", "المنطقة المركزية الشمالية",
            "قبالة ساحات الحرم النبوي الشريف", 24.471100, 39.610500,
            "https://www.google.com/maps/search/?api=1&query=24.4711,39.6105",
            30, "الصف الأول (مباشر على الساحات)", 5, "+966 14 828 2222", "+966 50 901 2345",
            "https://images.unsplash.com/photo-1571896349842-33c89424de2d", "",
            "ثنائية (Double)", "غرفة جونيور إطلالة مباشرة للحرم النبوي", 2, "لا", "إطلالة حرم",
            "شامل إفطار بوفيه", 2100.0, 1750.0, None, None
        ]
    ]

    sample_font = Font(name="Segoe UI", size=10)
    for row_idx, row_data in enumerate(sample_rows, start=2):
        ws.row_dimensions[row_idx].height = 24
        for col_idx, val in enumerate(row_data, start=1):
            cell = ws.cell(row=row_idx, column=col_idx, value=val)
            cell.font = sample_font
            cell.border = thin_border
            cell.alignment = align_center if col_idx in [1, 4, 11, 12, 17, 19, 20, 21] else align_right

    # تثبيت الصف الأول
    ws.freeze_panes = "A2"

    # ---------------------------------------------------------
    # 4. ورقة تعليمات الاستخدام (Instructions Sheet)
    # ---------------------------------------------------------
    ws_guide = wb.create_sheet(title="إرشادات ملء الشيت")
    ws_guide.sheet_view.rightToLeft = True

    instructions = [
        ("مرحباً بك في قالب حصر وتغذية بيانات فنادق مكة والمدينة المعتمد", True, 14, "0F172A", "FFFFFF"),
        ("", False, 10, None, None),
        ("شروط وقواعد إدخال البيانات:", True, 12, "F1F5F9", "0F172A"),
        ("1. كود الفندق (Hotel Code): يجب أن يكون فريداً لكل فندق (مثال: MAK-RAF-001)، ويتكرر نفس الكود إذا كان للفندق عدة غرف.", False, 11, None, None),
        ("2. إحداثيات الموقع (Lat / Lng): أدخل خط العرض وخط الطول من خرائط جوجل بدقة 6 أرقام عشرية.", False, 11, None, None),
        ("3. المسافة عن الحرم والنطاق: يمكن تركها فارغة وسيقوم النظام بحسابها تلقائياً بالمعادلات الجغرافية.", False, 11, None, None),
        ("4. فئات الغرف (ثنائي، ثلاثي، رباعي، خماسي، سداسي): لكل غرفة صف منفصل في الشيت يحمل كود الفندق نفسه.", False, 11, None, None),
        ("5. متاح بيع بالسرير الفردي: اختر 'نعم' للغرف المشتركة التي يسمح فيها النظام بتسكين الأفراد ومنع الاختلاط.", False, 11, None, None),
        ("6. التسعير (B2C و B2B): سعر B2C هو سعر البيع للجمهور، وسعر B2B هو سعر الجملة المخفض لوكالات السياحة.", False, 11, None, None),
        ("7. روابط الصور: ضع روابط مباشرة عالية الدقة للواجهة والغرف واللوبي لتظهر في واجهة المنصة.", False, 11, None, None),
    ]

    for r_idx, (text, is_bold, sz, bg, fg) in enumerate(instructions, start=1):
        cell = ws_guide.cell(row=r_idx, column=1, value=text)
        cell.font = Font(name="Segoe UI", size=sz, bold=is_bold, color=fg or "000000")
        if bg:
            cell.fill = PatternFill(start_color=bg, end_color=bg, fill_type="solid")
        ws_guide.row_dimensions[r_idx].height = 26

    ws_guide.column_dimensions["A"].width = 110

    wb.save(output_path)
    return output_path


def parse_excel_file(file_path: Path) -> Tuple[List[Hotel], List[str], List[str]]:
    """
    قراءة وفحص شيت إكسيل والتأكد من مطابقة الـ 26 عاموداً
    Returns: (hotels, errors, warnings)
    """
    errors = []
    warnings = []
    hotels_dict: Dict[str, Hotel] = {}

    try:
        wb = openpyxl.load_workbook(file_path, data_only=True)
    except Exception as e:
        return [], [f"فشل فتح ملف الإكسيل: {str(e)}"], []

    ws = wb.active
    rows = list(ws.iter_rows(values_only=True))
    if not rows:
        return [], ["ملف الإكسيل فارغ تماماً."], []

    headers = [str(c).strip() if c is not None else "" for c in rows[0]]
    if len(headers) < 15:
        return [], ["عدد الأعمدة في الملف أقل من المطلوب (الحد الأدنى 15 عاموداً)."], []

    # قراءة الصفوف
    for row_idx, row in enumerate(rows[1:], start=2):
        if not any(row):  # صف فارغ
            continue

        hotel_code = str(row[0]).strip() if row[0] else ""
        name_ar = str(row[1]).strip() if len(row) > 1 and row[1] else ""
        
        if not hotel_code or not name_ar:
            warnings.append(f"الصف {row_idx}: تم تجاهله لعدم توفر كود الفندق أو الاسم العربي.")
            continue

        name_en = str(row[2]).strip() if len(row) > 2 and row[2] else name_ar
        city_raw = str(row[3]).strip() if len(row) > 3 and row[3] else "مكة المكرمة"
        city = "makkah" if "مكة" in city_raw or "mak" in city_raw.lower() else "madinah"
        neighborhood = str(row[4]).strip() if len(row) > 4 and row[4] else "المركزية"
        address = str(row[5]).strip() if len(row) > 5 and row[5] else ""
        
        # خط العرض والطول
        try:
            lat = float(row[6]) if len(row) > 6 and row[6] is not None else 0.0
            lng = float(row[7]) if len(row) > 7 and row[7] is not None else 0.0
        except ValueError:
            lat, lng = 0.0, 0.0
            warnings.append(f"الصف {row_idx}: خطأ في تنسيق الإحداثيات للفندق {hotel_code}.")

        maps_url = str(row[8]).strip() if len(row) > 8 and row[8] else ""
        
        # المسافة والنطاق (تحسب إن لم تكن متوفرة)
        dist_m = 0
        if len(row) > 9 and row[9] is not None:
            try:
                dist_m = int(float(row[9]))
            except ValueError:
                dist_m = 0

        zone_raw = str(row[10]).strip() if len(row) > 10 and row[10] else ""

        # النجوم
        star_rating = 5
        if len(row) > 11 and row[11] is not None:
            try:
                star_rating = max(1, min(5, int(float(row[11]))))
            except ValueError:
                star_rating = 5

        phone = str(row[12]).strip() if len(row) > 12 and row[12] else ""
        whatsapp = str(row[13]).strip() if len(row) > 13 and row[13] else ""
        cover_url = str(row[14]).strip() if len(row) > 14 and row[14] else ""
        
        gallery_raw = str(row[15]).strip() if len(row) > 15 and row[15] else ""
        gallery = [img.strip() for img in gallery_raw.split(",") if img.strip()]

        # بيانات الغرفة
        room_category_raw = str(row[16]).strip() if len(row) > 16 and row[16] else "quad"
        # تعيين فئة الغرفة القياسية
        room_cat = "quad"
        if "ثنائي" in room_category_raw or "double" in room_category_raw.lower():
            room_cat = "double"
        elif "ثلاثي" in room_category_raw or "triple" in room_category_raw.lower():
            room_cat = "triple"
        elif "خماس" in room_category_raw or "quint" in room_category_raw.lower():
            room_cat = "quint"
        elif "سداس" in room_category_raw or "sext" in room_category_raw.lower():
            room_cat = "sext"
        elif "جناح" in room_category_raw or "suite" in room_category_raw.lower():
            room_cat = "suite"

        room_title = str(row[17]).strip() if len(row) > 17 and row[17] else f"غرفة {room_category_raw}"
        
        bed_count = 4
        if len(row) > 18 and row[18] is not None:
            try:
                bed_count = int(float(row[18]))
            except ValueError:
                bed_count = 4

        allow_bed = False
        if len(row) > 19 and row[19]:
            allow_bed = "نعم" in str(row[19]) or "true" in str(row[19]).lower() or "yes" in str(row[19]).lower()

        view = str(row[20]).strip() if len(row) > 20 and row[20] else "city_view"
        meal = str(row[21]).strip() if len(row) > 21 and row[21] else "bed_breakfast"

        # الأسعار
        try:
            p_b2c = float(row[22]) if len(row) > 22 and row[22] is not None else 1000.0
            p_b2b = float(row[23]) if len(row) > 23 and row[23] is not None else 850.0
        except ValueError:
            p_b2c, p_b2b = 1000.0, 850.0
            warnings.append(f"الصف {row_idx}: خطأ في تنسيق أسعار الغرفة للفندق {hotel_code}، تم تعيين قيم افتراضية.")

        p_bed_b2c = None
        if len(row) > 24 and row[24] is not None:
            try:
                p_bed_b2c = float(row[24])
            except ValueError:
                pass

        p_bed_b2b = None
        if len(row) > 25 and row[25] is not None:
            try:
                p_bed_b2b = float(row[25])
            except ValueError:
                pass

        # إنشاء أو تحديث كائن الفندق
        if hotel_code not in hotels_dict:
            hotel = Hotel(
                hotel_code=hotel_code,
                name_ar=name_ar,
                name_en=name_en,
                city=city,
                neighborhood_ar=neighborhood,
                detailed_address_ar=address,
                latitude=lat,
                longitude=lng,
                google_maps_url=maps_url,
                distance_to_haram_m=dist_m,
                star_rating=star_rating,
                contact_phone=phone,
                contact_whatsapp=whatsapp,
                cover_image_url=cover_url,
                gallery_images=gallery,
                rooms=[]
            )
            # فحص وحساب المسافة تلقائياً إن كانت الإحداثيات متوفرة
            if lat and lng and dist_m == 0:
                hotel.update_location_and_zone()

            hotels_dict[hotel_code] = hotel

        # إنشاء كائن الغرفة وإضافته للفندق
        room = RoomType(
            room_code=f"{hotel_code}-{room_cat.upper()}-{len(hotels_dict[hotel_code].rooms)+1}",
            room_category=room_cat,
            title_ar=room_title,
            bed_count=bed_count,
            allow_bed_booking=allow_bed,
            room_view=view,
            meal_plan=meal,
            price_full_room_b2c=p_b2c,
            price_full_room_b2b=p_b2b,
            price_per_bed_b2c=p_bed_b2c,
            price_per_bed_b2b=p_bed_b2b
        )
        hotels_dict[hotel_code].rooms.append(room)

    return list(hotels_dict.values()), errors, warnings


def export_hotels_to_excel(hotels: List[Hotel], output_path: Path = None) -> Path:
    """تصدير قائمة الفنادق والغرف بالكامل إلى شيت إكسيل احترافي منسق"""
    if output_path is None:
        output_path = EXPORTS_DIR / "makkah_madinah_hotels_catalog.xlsx"

    wb = openpyxl.Workbook()
    ws = wb.active
    ws.title = "دليل فنادق مكة والمدينة"
    ws.sheet_view.rightToLeft = True

    header_font = Font(name="Segoe UI", size=11, bold=True, color="FFFFFF")
    header_fill = PatternFill(start_color="0F172A", end_color="0F172A", fill_type="solid")
    gold_fill = PatternFill(start_color="92400E", end_color="92400E", fill_type="solid")
    thin_border = Border(
        left=Side(style='thin', color='CBD5E1'),
        right=Side(style='thin', color='CBD5E1'),
        top=Side(style='thin', color='CBD5E1'),
        bottom=Side(style='thin', color='CBD5E1')
    )
    align_center = Alignment(horizontal="center", vertical="center")
    align_right = Alignment(horizontal="right", vertical="center")

    # كتابة الرؤوس
    for col_idx, col_spec in enumerate(EXCEL_COLUMNS_SPEC, start=1):
        cell = ws.cell(row=1, column=col_idx, value=col_spec["label"])
        cell.font = header_font
        cell.fill = gold_fill if col_spec.get("required") else header_fill
        cell.alignment = align_center
        cell.border = thin_border
        col_letter = get_column_letter(col_idx)
        ws.column_dimensions[col_letter].width = col_spec["width"]

    ws.row_dimensions[1].height = 36

    # كتابة البيانات
    current_row = 2
    cell_font = Font(name="Segoe UI", size=10)

    for h in hotels:
        rooms_to_export = h.rooms if h.rooms else [
            RoomType(
                room_code=f"{h.hotel_code}-QUAD-1",
                room_category="quad",
                title_ar="غرفة رباعية قياسية",
                bed_count=4,
                price_full_room_b2c=1000.0,
                price_full_room_b2b=850.0
            )
        ]

        for r in rooms_to_export:
            row_vals = [
                h.hotel_code,
                h.name_ar,
                h.name_en,
                h.city_label_ar,
                h.neighborhood_ar,
                h.detailed_address_ar,
                h.latitude,
                h.longitude,
                h.google_maps_url,
                h.distance_to_haram_m,
                h.zone_label_ar,
                h.star_rating,
                h.contact_phone,
                h.contact_whatsapp,
                h.cover_image_url,
                ", ".join(h.gallery_images),
                r.room_category,
                r.title_ar,
                r.bed_count,
                "نعم" if r.allow_bed_booking else "لا",
                r.room_view,
                r.meal_plan,
                r.price_full_room_b2c,
                r.price_full_room_b2b,
                r.price_per_bed_b2c,
                r.price_per_bed_b2b
            ]

            ws.row_dimensions[current_row].height = 24
            for c_idx, val in enumerate(row_vals, start=1):
                cell = ws.cell(row=current_row, column=c_idx, value=val)
                cell.font = cell_font
                cell.border = thin_border
                cell.alignment = align_center if c_idx in [1, 4, 11, 12, 17, 19, 20, 21] else align_right

            current_row += 1

    ws.freeze_panes = "A2"
    wb.save(output_path)
    return output_path


def export_procurement_and_coverage_excel(hotels: List[Hotel], output_path: Path = None) -> Path:
    """
    توليد التقرير التنفيذي الشامل للتعاقدات وهوامش الأسعار وتغطية الأحياء
    (Executive Hotel Procurement, Margins & Neighborhood Coverage Sheet)
    """
    if output_path is None:
        output_path = EXPORTS_DIR / "hotel_procurement_and_coverage_report.xlsx"

    wb = openpyxl.Workbook()
    ws = wb.active
    ws.title = "شيت التغطية وهوامش الأسعار"
    ws.sheet_view.rightToLeft = True

    header_font = Font(name="Segoe UI", size=11, bold=True, color="FFFFFF")
    navy_fill = PatternFill(start_color="0F172A", end_color="0F172A", fill_type="solid")
    gold_fill = PatternFill(start_color="B45309", end_color="B45309", fill_type="solid")
    green_fill = PatternFill(start_color="047857", end_color="047857", fill_type="solid")

    thin_border = Border(
        left=Side(style='thin', color='CBD5E1'),
        right=Side(style='thin', color='CBD5E1'),
        top=Side(style='thin', color='CBD5E1'),
        bottom=Side(style='thin', color='CBD5E1')
    )
    align_center = Alignment(horizontal="center", vertical="center", wrap_text=True)
    align_right = Alignment(horizontal="right", vertical="center")

    cols = [
        ("كود الفندق", 14, navy_fill),
        ("اسم الفندق", 30, navy_fill),
        ("المدينة", 14, navy_fill),
        ("الحي", 22, navy_fill),
        ("تصنيف المركزية", 20, navy_fill),
        ("النطاق عن الحرم", 24, navy_fill),
        ("حالة التعاقد والتغطية", 22, gold_fill),
        ("سعر الشراء الفعلي B2B (التكلفة)", 22, gold_fill),
        ("سعر السوق على بوكينج", 22, navy_fill),
        ("سعر البيع المعتمد B2C", 22, green_fill),
        ("صافي الربح للغرفة (ر.س)", 20, green_fill),
        ("نسبة هامش الربح %", 18, green_fill),
        ("وفر العميل عن بوكينج (ر.س)", 22, gold_fill),
        ("نسبة التوفير %", 16, gold_fill),
        ("الغرف المخصصة", 15, navy_fill),
        ("إجمالي الربح المتوقع (ر.س)", 22, green_fill),
        ("النجوم", 12, navy_fill),
        ("تقييم النزلاء", 14, navy_fill),
        ("المراجعات", 14, navy_fill),
        ("هاتف التواصل", 18, navy_fill),
        ("رابط بوكينج", 30, navy_fill),
        ("خرائط جوجل", 30, navy_fill),
        ("ملاحظات التعاقد", 35, navy_fill)
    ]

    for c_idx, (label, width, fill_color) in enumerate(cols, start=1):
        cell = ws.cell(row=1, column=c_idx, value=label)
        cell.font = header_font
        cell.fill = fill_color
        cell.alignment = align_center
        cell.border = thin_border
        col_letter = get_column_letter(c_idx)
        ws.column_dimensions[col_letter].width = width

    ws.row_dimensions[1].height = 36
    cell_font = Font(name="Segoe UI", size=10)
    current_row = 2

    for h in hotels:
        cent_text = "مركزي (مشياً)" if getattr(h, 'is_central', True) else "غير مركزي (شاتل)"
        status_text = getattr(h, 'contract_status_label_ar', '✅ تم التعاقد')
        cost_val = getattr(h, 'procurement_price_effective', 450.0)
        mkt_val = getattr(h, 'market_price_effective', 600.0)
        sell_val = getattr(h, 'selling_price_effective', 550.0)
        profit_val = getattr(h, 'profit_per_room_sar', 100.0)
        profit_pct = getattr(h, 'profit_margin_percent', 20.0)
        savings_val = getattr(h, 'customer_savings_sar', 50.0)
        savings_pct = getattr(h, 'customer_savings_percent', 8.0)
        allotment = getattr(h, 'allotment_total_rooms', 15) or 15
        total_profit = getattr(h, 'total_allotment_potential_profit', profit_val * allotment)
        notes = getattr(h, 'contract_notes', '') or f"تعاقد بحي {h.neighborhood_ar}"

        vals = [
            h.hotel_code,
            h.name_ar,
            h.city_label_ar,
            h.neighborhood_ar,
            cent_text,
            h.zone_label_ar,
            status_text,
            cost_val,
            mkt_val,
            sell_val,
            profit_val,
            f"{profit_pct:.1f}%",
            savings_val,
            f"{savings_pct:.1f}%",
            allotment,
            total_profit,
            f"{h.star_rating}★",
            f"{getattr(h, 'ota_rating_booking', 8.5):.1f}/10",
            getattr(h, 'ota_reviews_count', 1200),
            h.contact_phone,
            h.booking_url or "-",
            h.google_maps_url or "-",
            notes
        ]

        ws.row_dimensions[current_row].height = 24
        for c_idx, val in enumerate(vals, start=1):
            cell = ws.cell(row=current_row, column=c_idx, value=val)
            cell.font = cell_font
            cell.border = thin_border
            cell.alignment = align_center if c_idx in [1, 3, 4, 5, 6, 7, 12, 14, 15, 17, 18, 19] else align_right

        current_row += 1

    ws.freeze_panes = "B2"
    wb.save(output_path)
    return output_path

