"""
إعدادات وثوابت أداة جمع وإدارة قاعدة بيانات فنادق مكة والمدينة
==============================================================
"""

import os
from pathlib import Path

# المسارات الأساسية
BASE_DIR = Path(__file__).resolve().parent.parent
DATA_DIR = BASE_DIR / "data"
TEMPLATES_DIR = DATA_DIR / "templates"
EXPORTS_DIR = DATA_DIR / "exports"
SEED_DATA_DIR = DATA_DIR / "seed_data"

# التأكد من وجود المجلدات
for folder in [DATA_DIR, TEMPLATES_DIR, EXPORTS_DIR, SEED_DATA_DIR]:
    folder.mkdir(parents=True, exist_ok=True)

# الإحداثيات المرجعية لساحات الحرمين الشريفين
# مركز الكعبة المشرفة وساحات المسجد الحرام بمكة المكرمة
MAKKAH_HARAM_LAT = 21.422487
MAKKAH_HARAM_LNG = 39.826206

# مركز القبة الخضراء والروضة الشريفة بالمسجد النبوي بالمدينة المنورة
MADINAH_HARAM_LAT = 24.467210
MADINAH_HARAM_LNG = 39.610860

# حدود المسافات بالمتر لتحديد تصنيف النطاق الفندقي (Zone Classification)
ZONE_LIMITS = {
    "first_row_max": 150,     # الصف الأول المباشر على الساحات (أقل من أو يساوي 150 متر)
    "walking_max": 500,       # المنطقة المركزية مشياً مريحاً (151 - 500 متر)
    "outer_max": 1200,        # مركزية خارجية (501 - 1200 متر)
    # أكثر من 1200 متر يعتبر شاتل باص (العزيزية، محبس الجن، النسيم...)
}

ZONES_META = {
    "central_first_row": {
        "name_ar": "الصف الأول (مباشر على الساحات)",
        "badge_color": "#10b981", # أخضر زمردي
        "max_distance_m": 150,
        "description": "إطلالة مباشرة أو ملاصق لساحات الحرم الشريف"
    },
    "central_walking": {
        "name_ar": "المركزية (مشياً على الأقدام)",
        "badge_color": "#0284c7", # أزرق بحري
        "max_distance_m": 500,
        "description": "على بعد 2 إلى 5 دقائق مشياً من الساحات"
    },
    "central_outer": {
        "name_ar": "مركزية متوسطة",
        "badge_color": "#f59e0b", # كهرماني
        "max_distance_m": 1200,
        "description": "مشياً 10 - 15 دقيقة أو سيارة سريعة"
    },
    "shuttle_bus": {
        "name_ar": "باصات شاتل مجانية (24 ساعة)",
        "badge_color": "#8b5cf6", # بنفسجي
        "max_distance_m": 99999,
        "description": "مناطق محبس الجن، العزيزية، والنسيم مع حافلات ترددية"
    }
}

# قائمة المدن المعتمدة
CITIES_MAP = {
    "makkah": "مكة المكرمة",
    "madinah": "المدينة المنورة"
}

# أحياء مكة المكرمة المعتمدة
MAKKAH_NEIGHBORHOODS = [
    "أجياد", "إبراهيم الخليل", "الهجلة", "الشبيكة", "جرول", "الغزة", 
    "المسيال", "جبل عمر", "ريع بخش", "محبس الجن", "العزيزية الجنوبية", 
    "العزيزية الشمالية", "النسيم", "النزهة", "الشامية", "كدي"
]

# أحياء المدينة المنورة المعتمدة
MADINAH_NEIGHBORHOODS = [
    "المنطقة المركزية الشمالية", "المنطقة المركزية الجنوبية", 
    "المنطقة المركزية الغربية", "المنطقة المركزية الشرقية", 
    "العوالي", "قباء", "سيد الشهداء", "بني معاوية", "سلطانة"
]

# فئات الغرف القياسية
ROOM_CATEGORIES = {
    "double": {"name_ar": "ثنائية (Double)", "beds": 2},
    "triple": {"name_ar": "ثلاثية (Triple)", "beds": 3},
    "quad": {"name_ar": "رباعية (Quad)", "beds": 4},
    "quint": {"name_ar": "خماسية (Quint)", "beds": 5},
    "sext": {"name_ar": "سداسية (Sext)", "beds": 6},
    "suite": {"name_ar": "جناح عائلي / ملكي (Suite)", "beds": 4}
}

# خطط الوجبات
MEAL_PLANS = {
    "room_only": "إقامة فقط (بدون وجبات)",
    "bed_breakfast": "شامل إفطار بوفيه",
    "half_board": "نصف إقامة (إفطار + عشاء)",
    "full_board": "إقامة كاملة (3 وجبات)",
    "suhur_ramadan": "شامل سحور رمضان المبارك"
}

# مواصفات أعمدة شيت الإكسيل الـ 26 المعتمد
EXCEL_COLUMNS_SPEC = [
    {"key": "hotel_code", "label": "كود الفندق", "width": 16, "required": True},
    {"key": "name_ar", "label": "اسم الفندق بالعربي", "width": 30, "required": True},
    {"key": "name_en", "label": "اسم الفندق بالإنجليزي", "width": 30, "required": False},
    {"key": "city", "label": "المدينة", "width": 16, "required": True, "dropdown": ["مكة المكرمة", "المدينة المنورة"]},
    {"key": "neighborhood", "label": "الحي", "width": 22, "required": True},
    {"key": "detailed_address", "label": "العنوان التفصيلي", "width": 35, "required": False},
    {"key": "latitude", "label": "خط العرض (Lat)", "width": 18, "required": True},
    {"key": "longitude", "label": "خط الطول (Lng)", "width": 18, "required": True},
    {"key": "google_maps_url", "label": "رابط خرائط جوجل", "width": 40, "required": False},
    {"key": "distance_to_haram_m", "label": "المسافة عن الحرم (متر)", "width": 22, "required": False},
    {"key": "zone_type", "label": "تصنيف النطاق", "width": 25, "required": False, "dropdown": [
        "الصف الأول (مباشر على الساحات)", 
        "المركزية (مشياً على الأقدام)", 
        "مركزية متوسطة", 
        "باصات شاتل مجانية (24 ساعة)"
    ]},
    {"key": "star_rating", "label": "النجوم (1-5)", "width": 15, "required": True, "dropdown": ["1", "2", "3", "4", "5"]},
    {"key": "contact_phone", "label": "هاتف الفندق", "width": 20, "required": False},
    {"key": "contact_whatsapp", "label": "واتساب الحجوزات", "width": 20, "required": False},
    {"key": "cover_image_url", "label": "رابط الصورة الرئيسية", "width": 35, "required": False},
    {"key": "gallery_images", "label": "روابط صور إضافية (مفصولة بفاصلة)", "width": 40, "required": False},
    {"key": "room_category", "label": "فئة الغرفة", "width": 20, "required": True, "dropdown": [
        "ثنائية (Double)", "ثلاثية (Triple)", "رباعية (Quad)", "خماسية (Quint)", "سداسية (Sext)", "جناح (Suite)"
    ]},
    {"key": "room_title_ar", "label": "مسمى الغرفة بالعربي", "width": 28, "required": True},
    {"key": "bed_count", "label": "عدد الأسرة", "width": 14, "required": True},
    {"key": "allow_bed_booking", "label": "متاح بيع بالسرير الفردي؟", "width": 24, "required": True, "dropdown": ["نعم", "لا"]},
    {"key": "room_view", "label": "الإطلالة", "width": 20, "required": False, "dropdown": ["إطلالة كعبة", "إطلالة حرم", "إطلالة مدينة", "داخلية"]},
    {"key": "meal_plan", "label": "خطة الوجبات", "width": 25, "required": True, "dropdown": [
        "إقامة فقط (بدون وجبات)", "شامل إفطار بوفيه", "نصف إقامة (إفطار + عشاء)", "إقامة كاملة (3 وجبات)", "شامل سحور رمضان المبارك"
    ]},
    {"key": "price_full_room_b2c", "label": "سعر الغرفة للأفراد B2C (ر.س)", "width": 26, "required": True},
    {"key": "price_full_room_b2b", "label": "سعر الغرفة للشركات B2B (ر.س)", "width": 26, "required": True},
    {"key": "price_bed_b2c", "label": "سعر السرير B2C (ر.س)", "width": 22, "required": False},
    {"key": "price_bed_b2b", "label": "سعر السرير B2B (ر.س)", "width": 22, "required": False}
]
