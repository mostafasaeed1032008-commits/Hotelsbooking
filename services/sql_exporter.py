"""
مصدّر كود SQL لقاعدة بيانات PostgreSQL
=====================================
يولد استعلامات SQL Seeder رسمية متوافقة 100% مع المخطط المعتمد للمنظومة (23 جدولاً).
"""

from pathlib import Path
from typing import List
import json

try:
    from ..config.settings import EXPORTS_DIR
    from ..models.hotel import Hotel
except (ImportError, ValueError):
    from config.settings import EXPORTS_DIR
    from models.hotel import Hotel


def export_hotels_to_sql(hotels: List[Hotel], output_path: Path = None) -> Path:
    """
    توليد ملف seed_hotels.sql متوافق مع جداول hotels, hotel_images, hotel_room_types, room_rate_plans
    """
    if output_path is None:
        output_path = EXPORTS_DIR / "seed_hotels.sql"

    sql_lines = [
        "-- ====================================================================",
        "-- بيانات البذر الأولية لفنادق مكة والمدينة (Hotels & Rooms Database Seed)",
        "-- المنظومة الرقمية للحج والعمرة - متوافق مع PostgreSQL 16",
        "-- ====================================================================",
        "",
        "BEGIN;",
        ""
    ]

    for h in hotels:
        # تجهيز القيم وتأمين علامات الاقتباس الفردية
        name_ar_esc = h.name_ar.replace("'", "''")
        name_en_esc = h.name_en.replace("'", "''")
        city_esc = h.city.lower()
        neighborhood_esc = h.neighborhood_ar.replace("'", "''")
        address_esc = h.detailed_address_ar.replace("'", "''")
        maps_url_esc = h.google_maps_url.replace("'", "''")
        cover_esc = h.cover_image_url.replace("'", "''")
        desc_esc = h.description_ar.replace("'", "''")
        amenities_json = json.dumps(h.amenities, ensure_ascii=False).replace("'", "''")
        is_central_str = "TRUE" if getattr(h, 'is_central', True) else "FALSE"

        hotel_sql = f"""-- --------------------------------------------------------------------
-- فندق: {name_ar_esc} ({h.hotel_code})
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '{h.id}', '{h.hotel_code}', '{name_ar_esc}', '{name_en_esc}', '{city_esc}', '{neighborhood_esc}', '{address_esc}',
    {h.latitude}, {h.longitude}, '{maps_url_esc}', {h.distance_to_haram_m}, '{h.zone_type}', {is_central_str},
    {h.star_rating}, '{h.contact_phone}', '{h.contact_whatsapp}', '{cover_esc}',
    '{desc_esc}', '{amenities_json}'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();
"""
        sql_lines.append(hotel_sql)

        # صور المعرض
        for idx, img_url in enumerate(h.gallery_images, start=1):
            img_esc = img_url.replace("'", "''")
            img_sql = f"""INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('{h.id}', '{img_esc}', 'room', FALSE, {idx});"""
            sql_lines.append(img_sql)

        # الغرف وخطط الأسعار
        for r in h.rooms:
            room_title_esc = r.title_ar.replace("'", "''")
            allow_bed_str = "TRUE" if r.allow_bed_booking else "FALSE"
            bed_b2c_val = str(r.price_per_bed_b2c) if r.price_per_bed_b2c else "NULL"
            bed_b2b_val = str(r.price_per_bed_b2b) if r.price_per_bed_b2b else "NULL"

            room_sql = f"""
INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '{r.id}', '{h.id}', '{r.room_category}', '{room_title_esc}', {r.bed_count}, {allow_bed_str}, '{r.room_view}'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '{r.id}', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', '{r.meal_plan}',
    {r.price_full_room_b2c}, {r.price_full_room_b2b}, {bed_b2c_val}, {bed_b2b_val}
);
"""
            sql_lines.append(room_sql)

        sql_lines.append("")

    sql_lines.append("COMMIT;")
    sql_lines.append("")

    output_path.write_text("\n".join(sql_lines), encoding="utf-8")
    return output_path
