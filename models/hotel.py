"""
نماذج البيانات للفنادق، فئات الغرف، وخطط الأسعار
===============================================
"""

from dataclasses import dataclass, field, asdict
from typing import List, Optional, Dict, Any
import math
import uuid

try:
    from ..config.settings import (
        MAKKAH_HARAM_LAT, MAKKAH_HARAM_LNG,
        MADINAH_HARAM_LAT, MADINAH_HARAM_LNG,
        ZONE_LIMITS, ZONES_META, CITIES_MAP, ROOM_CATEGORIES, MEAL_PLANS
    )
except (ImportError, ValueError):
    from config.settings import (
        MAKKAH_HARAM_LAT, MAKKAH_HARAM_LNG,
        MADINAH_HARAM_LAT, MADINAH_HARAM_LNG,
        ZONE_LIMITS, ZONES_META, CITIES_MAP, ROOM_CATEGORIES, MEAL_PLANS
    )


def calculate_haversine_distance(lat1: float, lon1: float, lat2: float, lon2: float) -> int:
    """حساب المسافة الجغرافية السطحية بين نقطتين بالمتر باستخدام معادلة Haversine"""
    R = 6371000  # نصف قطر الأرض بالمتر
    phi1 = math.radians(lat1)
    phi2 = math.radians(lat2)
    delta_phi = math.radians(lat2 - lat1)
    delta_lambda = math.radians(lon2 - lon1)

    a = (math.sin(delta_phi / 2.0) ** 2 +
         math.cos(phi1) * math.cos(phi2) * (math.sin(delta_lambda / 2.0) ** 2))
    c = 2.0 * math.atan2(math.sqrt(a), math.sqrt(1.0 - a))
    
    # معامل المشي الواقعي في الشوارع الحضرية (Walking factor ~ 1.18)
    straight_line_dist = R * c
    return int(round(straight_line_dist * 1.18))


@dataclass
class RoomType:
    """نموذج فئة الغرفة وخطة التسعير"""
    room_code: str
    room_category: str  # double, triple, quad, quint, sext, suite
    title_ar: str
    bed_count: int
    price_full_room_b2c: float
    price_full_room_b2b: float
    meal_plan: str = "bed_breakfast"
    allow_bed_booking: bool = False
    price_per_bed_b2c: Optional[float] = None
    price_per_bed_b2b: Optional[float] = None
    room_view: str = "city_view"  # kaaba_view, haram_view, city_view, internal
    id: str = field(default_factory=lambda: str(uuid.uuid4()))

    def __post_init__(self):
        # حساب سعر السرير التلقائي إن لم يُحدد وكان بيع السرير مفعلاً
        if self.allow_bed_booking and self.bed_count > 0:
            if not self.price_per_bed_b2c:
                self.price_per_bed_b2c = round(self.price_full_room_b2c / self.bed_count * 1.05, 2)
            if not self.price_per_bed_b2b:
                self.price_per_bed_b2b = round(self.price_full_room_b2b / self.bed_count, 2)


@dataclass
class Hotel:
    """نموذج الفندق المكتمل"""
    hotel_code: str
    name_ar: str
    name_en: str
    city: str  # makkah or madinah
    neighborhood_ar: str
    latitude: float
    longitude: float
    star_rating: int = 5
    detailed_address_ar: str = ""
    google_maps_url: str = ""
    distance_to_haram_m: int = 0
    zone_type: str = "central_walking"
    contact_phone: str = ""
    contact_whatsapp: str = ""
    cover_image_url: str = ""
    gallery_images: List[str] = field(default_factory=list)
    description_ar: str = ""
    amenities: List[str] = field(default_factory=list)
    booking_url: str = ""
    trivago_url: str = ""
    expedia_url: str = ""
    agoda_url: str = ""
    ota_rating_booking: float = 8.5
    ota_reviews_count: int = 1200
    is_central: bool = True
    ota_source: str = "Booking.com & Global OTAs"
    contract_status: str = "contracted"  # contracted (تم التعاقد), negotiating (قيد التفاوض), lead (فرصة غير مغطاة)
    procurement_cost_b2b: float = 0.0    # سعر الشراء الفعلي / التكلفة المتعاقد عليها
    ota_market_price: float = 0.0        # متوسط سعر السوق المقارن على بوكينج
    allotment_total_rooms: int = 15      # عدد الغرف المخصصة للمنظومة
    contract_notes: str = ""             # ملاحظات المندوب والتعاقد وشروط الإلغاء
    sales_manager: str = ""              # مسؤول مبيعات الفندق
    rooms: List[RoomType] = field(default_factory=list)
    id: str = field(default_factory=lambda: str(uuid.uuid4()))

    def __post_init__(self):
        self.update_location_and_zone()

    def update_location_and_zone(self):
        """تحديث المسافة عن الحرم والنطاق ورابط جوجل ماب تلقائياً بناء على الإحداثيات"""
        if self.latitude and self.longitude:
            # توليد رابط خرائط جوجل إن لم يكن موجوداً
            if not self.google_maps_url:
                self.google_maps_url = f"https://www.google.com/maps/search/?api=1&query={self.latitude},{self.longitude}"

            # اختيار الحرم المستهدف حسب المدينة
            if self.city.lower() in ["makkah", "مكة", "مكة المكرمة"]:
                self.distance_to_haram_m = calculate_haversine_distance(
                    self.latitude, self.longitude, MAKKAH_HARAM_LAT, MAKKAH_HARAM_LNG
                )
            else:
                self.distance_to_haram_m = calculate_haversine_distance(
                    self.latitude, self.longitude, MADINAH_HARAM_LAT, MADINAH_HARAM_LNG
                )

            # تحديد النطاق والمركزية بناء على المسافة والحي
            if self.distance_to_haram_m <= ZONE_LIMITS["first_row_max"]:
                self.zone_type = "central_first_row"
                self.is_central = True
            elif self.distance_to_haram_m <= ZONE_LIMITS["walking_max"]:
                self.zone_type = "central_walking"
                self.is_central = True
            elif self.distance_to_haram_m <= ZONE_LIMITS["outer_max"]:
                self.zone_type = "central_outer"
                self.is_central = True
            else:
                self.zone_type = "shuttle_bus"
                self.is_central = False

    @property
    def centrality_status_ar(self) -> str:
        return "فندق مركزي (مشياً للحرم)" if self.is_central else "فندق غير مركزي (حافلات شاتل)"

    @property
    def city_label_ar(self) -> str:
        return "مكة المكرمة" if self.city.lower() in ["makkah", "مكة"] else "المدينة المنورة"

    @property
    def zone_label_ar(self) -> str:
        return ZONES_META.get(self.zone_type, {}).get("name_ar", "المركزية")

    @property
    def zone_badge_color(self) -> str:
        return ZONES_META.get(self.zone_type, {}).get("badge_color", "#0284c7")

    @property
    def min_b2c_price(self) -> float:
        if not self.rooms:
            return 0.0
        return min(r.price_full_room_b2c for r in self.rooms)

    @property
    def min_b2b_price(self) -> float:
        if not self.rooms:
            return 0.0
        return min(r.price_full_room_b2b for r in self.rooms)

    # --- مؤشرات التسعير وهوامش الربح التشغيلية ---
    @property
    def procurement_price_effective(self) -> float:
        """سعر التكلفة / الشراء الفعلي المعتمد للغرفة"""
        if self.procurement_cost_b2b > 0:
            return self.procurement_cost_b2b
        if self.min_b2b_price > 0:
            return self.min_b2b_price
        if self.min_b2c_price > 0:
            return round(self.min_b2c_price * 0.80, 0)
        return 450.0

    @property
    def market_price_effective(self) -> float:
        """سعر السوق المقارن على بوكينج للمنشأة"""
        if self.ota_market_price > 0:
            return self.ota_market_price
        if self.min_b2c_price > 0:
            return round(self.min_b2c_price * 1.15, 0)
        return round(self.procurement_price_effective * 1.40, 0)

    @property
    def selling_price_effective(self) -> float:
        """سعر البيع المعتمد B2C للجمهور"""
        if self.min_b2c_price > 0:
            return self.min_b2c_price
        return round(self.procurement_price_effective * 1.25, 0)

    @property
    def profit_per_room_sar(self) -> float:
        """صافي هامش ربح الغرفة في الليلة الواحدة (ر.س)"""
        return max(0.0, round(self.selling_price_effective - self.procurement_price_effective, 2))

    @property
    def profit_margin_percent(self) -> float:
        """نسبة هامش الربح التشغيلي %"""
        cost = self.procurement_price_effective
        return round((self.profit_per_room_sar / cost) * 100, 1) if cost > 0 else 0.0

    @property
    def customer_savings_sar(self) -> float:
        """وفر العميل بالريال مقارنة بسعر بوكينج والمنصات"""
        return max(0.0, round(self.market_price_effective - self.selling_price_effective, 2))

    @property
    def customer_savings_percent(self) -> float:
        """نسبة التوفير التنافسية للعميل مقارنة ببوكينج %"""
        mkt = self.market_price_effective
        return round((self.customer_savings_sar / mkt) * 100, 1) if mkt > 0 else 0.0

    @property
    def total_allotment_potential_profit(self) -> float:
        """إجمالي العائد الربحي المتوقع من الغرف المخصصة لليلة"""
        rooms_cnt = self.allotment_total_rooms if self.allotment_total_rooms > 0 else 15
        return round(self.profit_per_room_sar * rooms_cnt, 2)

    @property
    def contract_status_label_ar(self) -> str:
        if self.contract_status == "contracted":
            return "✅ تم التعاقد وتأكيد الحصة"
        elif self.contract_status == "negotiating":
            return "⏳ قيد التفاوض والمطابقة"
        else:
            return "🎯 فرصة غير مغطاة (مطلوب تعاقدها)"

    @property
    def contract_status_color(self) -> str:
        if self.contract_status == "contracted":
            return "#10b981"  # أخضر زمردي
        elif self.contract_status == "negotiating":
            return "#f59e0b"  # كهرماني
        else:
            return "#64748b"  # رمادي

    def to_dict(self) -> Dict[str, Any]:
        """تحويل الفندق إلى قاموس بيانات قابل للحفظ بتنسيق JSON"""
        data = asdict(self)
        data["city_label_ar"] = self.city_label_ar
        data["zone_label_ar"] = self.zone_label_ar
        data["centrality_status_ar"] = self.centrality_status_ar
        data["contract_status_label_ar"] = self.contract_status_label_ar
        data["contract_status_color"] = self.contract_status_color
        data["min_b2c_price"] = self.min_b2c_price
        data["min_b2b_price"] = self.min_b2b_price
        data["procurement_price_effective"] = self.procurement_price_effective
        data["market_price_effective"] = self.market_price_effective
        data["selling_price_effective"] = self.selling_price_effective
        data["profit_per_room_sar"] = self.profit_per_room_sar
        data["profit_margin_percent"] = self.profit_margin_percent
        data["customer_savings_sar"] = self.customer_savings_sar
        data["customer_savings_percent"] = self.customer_savings_percent
        data["total_allotment_potential_profit"] = self.total_allotment_potential_profit
        return data

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "Hotel":
        """إنشاء فندق من قاموس بيانات"""
        rooms_data = data.pop("rooms", [])
        # إزالة الحقول المحسوبة ديناميكياً إن وجدت
        for computed in [
            "city_label_ar", "zone_label_ar", "centrality_status_ar", "min_b2c_price", "min_b2b_price",
            "zone_badge_color", "contract_status_label_ar", "contract_status_color",
            "procurement_price_effective", "market_price_effective", "selling_price_effective",
            "profit_per_room_sar", "profit_margin_percent", "customer_savings_sar",
            "customer_savings_percent", "total_allotment_potential_profit"
        ]:
            data.pop(computed, None)

        rooms = [RoomType(**r) if isinstance(r, dict) else r for r in rooms_data]
        import dataclasses
        valid_fields = {f.name for f in dataclasses.fields(cls)}
        cleaned_data = {k: v for k, v in data.items() if k in valid_fields}
        hotel = cls(**cleaned_data)
        hotel.rooms = rooms
        return hotel
