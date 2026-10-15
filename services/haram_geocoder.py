"""
محرك الحسابات الجغرافية وتحديد النطاقات لساحات الحرمين الشريفين
==============================================================
"""

import math
from typing import Tuple, Dict, Any, Optional
import httpx

try:
    from ..config.settings import (
        MAKKAH_HARAM_LAT, MAKKAH_HARAM_LNG,
        MADINAH_HARAM_LAT, MADINAH_HARAM_LNG,
        ZONE_LIMITS, ZONES_META,
        MAKKAH_NEIGHBORHOODS, MADINAH_NEIGHBORHOODS
    )
except (ImportError, ValueError):
    from config.settings import (
        MAKKAH_HARAM_LAT, MAKKAH_HARAM_LNG,
        MADINAH_HARAM_LAT, MADINAH_HARAM_LNG,
        ZONE_LIMITS, ZONES_META,
        MAKKAH_NEIGHBORHOODS, MADINAH_NEIGHBORHOODS
    )


def calculate_distance_to_haram(latitude: float, longitude: float, city: str) -> int:
    """
    حساب المسافة المقدرة بالمتر إلى ساحات الحرم (مكة أو المدينة)
    مع احتساب معامل المشي الحضري عبر الشوارع.
    """
    city_clean = city.lower().strip()
    if city_clean in ["makkah", "مكة", "مكة المكرمة"]:
        target_lat, target_lng = MAKKAH_HARAM_LAT, MAKKAH_HARAM_LNG
    else:
        target_lat, target_lng = MADINAH_HARAM_LAT, MADINAH_HARAM_LNG

    R = 6371000  # نصف قطر الأرض بالمتر
    phi1 = math.radians(latitude)
    phi2 = math.radians(target_lat)
    delta_phi = math.radians(target_lat - latitude)
    delta_lambda = math.radians(target_lng - longitude)

    a = (math.sin(delta_phi / 2.0) ** 2 +
         math.cos(phi1) * math.cos(phi2) * (math.sin(delta_lambda / 2.0) ** 2))
    c = 2.0 * math.atan2(math.sqrt(a), math.sqrt(1.0 - a))
    
    # معامل المشي الفعلي في الشوارع الحضرية (1.18x)
    return int(round(R * c * 1.18))


def calculate_distance_coords(lat1: float, lon1: float, lat2: float, lon2: float) -> int:
    """حساب المسافة المقدرة بالمتر بين نقطتي إحداثيات جغرافية"""
    R = 6371000
    phi1 = math.radians(lat1)
    phi2 = math.radians(lat2)
    delta_phi = math.radians(lat2 - lat1)
    delta_lambda = math.radians(lon2 - lon1)
    a = (math.sin(delta_phi / 2.0) ** 2 +
         math.cos(phi1) * math.cos(phi2) * (math.sin(delta_lambda / 2.0) ** 2))
    c = 2.0 * math.atan2(math.sqrt(a), math.sqrt(1.0 - a))
    return int(round(R * c))



def determine_hotel_zone(distance_m: int) -> Tuple[str, str, str]:
    """
    تحديد النطاق الفندقي والاسم العربي ولون الشارة بناء على المسافة بالمتر
    Returns: (zone_key, zone_label_ar, badge_color)
    """
    if distance_m <= ZONE_LIMITS["first_row_max"]:
        key = "central_first_row"
    elif distance_m <= ZONE_LIMITS["walking_max"]:
        key = "central_walking"
    elif distance_m <= ZONE_LIMITS["outer_max"]:
        key = "central_outer"
    else:
        key = "shuttle_bus"

    meta = ZONES_META.get(key, {})
    return key, meta.get("name_ar", "المركزية"), meta.get("badge_color", "#0284c7")


def generate_google_maps_url(latitude: float, longitude: float, hotel_name: str = "") -> str:
    """توليد رابط رسمي مباشر لخرائط جوجل"""
    if hotel_name:
        query = f"{hotel_name} {latitude},{longitude}"
        return f"https://www.google.com/maps/search/?api=1&query={query.replace(' ', '+')}"
    return f"https://www.google.com/maps/search/?api=1&query={latitude},{longitude}"


def geocode_hotel_online(query: str, city: str = "مكة المكرمة") -> Optional[Dict[str, Any]]:
    """
    البحث السريع عن إحداثيات فندق في مكة أو المدينة عبر OpenStreetMap Nominatim
    (لا يتطلب مفتاح API مدفوع، مع مراعاة سياسة الاستخدام)
    """
    full_query = f"{query}, {city}, Saudi Arabia"
    url = "https://nominatim.openstreetmap.org/search"
    headers = {
        "User-Agent": "UmrahHotelDataCollector/1.0 (contact: info@umrah-platform.com)"
    }
    params = {
        "q": full_query,
        "format": "json",
        "limit": 1,
        "addressdetails": 1
    }

    try:
        with httpx.Client(timeout=8.0) as client:
            resp = client.get(url, params=params, headers=headers)
            if resp.status_code == 200:
                results = resp.json()
                if results:
                    first = results[0]
                    lat = float(first.get("lat"))
                    lon = float(first.get("lon"))
                    dist = calculate_distance_to_haram(lat, lon, city)
                    zone_key, zone_label, color = determine_hotel_zone(dist)
                    
                    return {
                        "name": first.get("display_name"),
                        "latitude": lat,
                        "longitude": lon,
                        "distance_m": dist,
                        "zone_key": zone_key,
                        "zone_label": zone_label,
                        "google_maps_url": generate_google_maps_url(lat, lon, query)
                    }
    except Exception:
        pass
    return None
