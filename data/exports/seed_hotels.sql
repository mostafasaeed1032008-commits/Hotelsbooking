-- ====================================================================
-- بيانات البذر الأولية لفنادق مكة والمدينة (Hotels & Rooms Database Seed)
-- المنظومة الرقمية للحج والعمرة - متوافق مع PostgreSQL 16
-- ====================================================================

BEGIN;

-- --------------------------------------------------------------------
-- فندق: Rowaa Lindy Hotel Makkah (MAK-ROW-0001)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '2074c358-82ca-4dfe-ba37-9101f7c1836e', 'MAK-ROW-0001', 'Rowaa Lindy Hotel Makkah', 'Rowaa Lindy Hotel Makkah', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.420887, 39.825406, 'https://www.google.com/maps/search/?api=1&query=21.420887,39.825406', 232, 'central_walking', TRUE,
    4, '+966 12 5117 1031', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/825494409.webp?k=a5d27bc7ddf298c2ffac3983ede687fe0d28137db2850e2bafde172bd23f8509&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 5.3 كلم من المركز وبتقييم نزلاء حقيقي 7.8/10 بناء على 108 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2074c358-82ca-4dfe-ba37-9101f7c1836e', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/825494409.webp?k=a5d27bc7ddf298c2ffac3983ede687fe0d28137db2850e2bafde172bd23f8509&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2074c358-82ca-4dfe-ba37-9101f7c1836e', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2074c358-82ca-4dfe-ba37-9101f7c1836e', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '2dd328d8-8e25-426b-b6cc-ba23bd7854ea', '2074c358-82ca-4dfe-ba37-9101f7c1836e', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '2dd328d8-8e25-426b-b6cc-ba23bd7854ea', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    450.0, 369.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'e4782a29-42d5-4f13-89c5-93d0a3910548', '2074c358-82ca-4dfe-ba37-9101f7c1836e', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'e4782a29-42d5-4f13-89c5-93d0a3910548', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    562.0, 461.0, 197.0, 154.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '92ac89b9-22c1-4453-9392-ff8fc7e8e36c', '2074c358-82ca-4dfe-ba37-9101f7c1836e', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '92ac89b9-22c1-4453-9392-ff8fc7e8e36c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    675.0, 554.0, 177.0, 138.0
);


-- --------------------------------------------------------------------
-- فندق: voco Makkah by IHG (MAK-VOC-0002)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '67da80c3-8f86-444e-b000-156eaea51942', 'MAK-VOC-0002', 'voco Makkah by IHG', 'voco Makkah by IHG', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.421687, 39.826206, 'https://www.google.com/maps/search/?api=1&query=21.421687,39.826206', 105, 'central_first_row', TRUE,
    5, '+966 12 5134 1062', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/427975173.webp?k=c085e75bd694945f26e0dfb54b13550a0342915f82e7e7ae6f599cbed9f0a68e&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 1.8 كلم من المركز وبتقييم نزلاء حقيقي 8.7/10 بناء على 16,923 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('67da80c3-8f86-444e-b000-156eaea51942', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/427975173.webp?k=c085e75bd694945f26e0dfb54b13550a0342915f82e7e7ae6f599cbed9f0a68e&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('67da80c3-8f86-444e-b000-156eaea51942', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('67da80c3-8f86-444e-b000-156eaea51942', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'bf229e3f-8d67-4108-9f4e-e2e6dddbe998', '67da80c3-8f86-444e-b000-156eaea51942', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'bf229e3f-8d67-4108-9f4e-e2e6dddbe998', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    394.0, 323.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '246d0042-4ad3-4204-87cf-5f1d0cdc9434', '67da80c3-8f86-444e-b000-156eaea51942', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '246d0042-4ad3-4204-87cf-5f1d0cdc9434', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    492.0, 404.0, 172.0, 135.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'f1c6d8b7-d221-408e-977e-d608ec533fd8', '67da80c3-8f86-444e-b000-156eaea51942', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'f1c6d8b7-d221-408e-977e-d608ec533fd8', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    591.0, 484.0, 155.0, 121.0
);


-- --------------------------------------------------------------------
-- فندق: العنوان جبل عمر مكة (MAK-HTL-0003)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '56b2fbaa-a707-445e-a772-81eeab63bf74', 'MAK-HTL-0003', 'العنوان جبل عمر مكة', 'العنوان جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.4215, 39.821799999999996, 'https://www.google.com/maps/search/?api=1&query=21.4215,39.821799999999996', 554, 'central_outer', TRUE,
    5, '+966 12 5151 1093', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/536428550.webp?k=b67de61b70a83bd973e267adc7689cbf26b9abfc16bc5f11c933d65a21c38d19&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.7 كلم من المركز وبتقييم نزلاء حقيقي 8.6/10 بناء على 20,424 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('56b2fbaa-a707-445e-a772-81eeab63bf74', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/536428550.webp?k=b67de61b70a83bd973e267adc7689cbf26b9abfc16bc5f11c933d65a21c38d19&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('56b2fbaa-a707-445e-a772-81eeab63bf74', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('56b2fbaa-a707-445e-a772-81eeab63bf74', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '825688ab-d53a-4468-a67e-2e4fe42eccef', '56b2fbaa-a707-445e-a772-81eeab63bf74', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '825688ab-d53a-4468-a67e-2e4fe42eccef', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1538.0, 1261.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '3cfde363-23fb-4fd4-be19-f31f91248adf', '56b2fbaa-a707-445e-a772-81eeab63bf74', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '3cfde363-23fb-4fd4-be19-f31f91248adf', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1922.0, 1576.0, 673.0, 525.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '798343ec-a4ed-4d2f-97fc-1e0cb2cb175c', '56b2fbaa-a707-445e-a772-81eeab63bf74', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '798343ec-a4ed-4d2f-97fc-1e0cb2cb175c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2307.0, 1892.0, 606.0, 473.0
);


-- --------------------------------------------------------------------
-- فندق: جبل عمر حياة ريجنسي مكة (MAK-HTL-0004)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '33fcd37d-574a-4205-8049-be4605f8e727', 'MAK-HTL-0004', 'جبل عمر حياة ريجنسي مكة', 'جبل عمر حياة ريجنسي مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.422300000000003, 39.8226, 'https://www.google.com/maps/search/?api=1&query=21.422300000000003,39.8226', 441, 'central_walking', TRUE,
    5, '+966 12 5168 1124', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/892021583.webp?k=b8a646d0005d0b6e6ae136c9e7375eb36b562ff5bef3f71f8ce123fab67690df&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 450 متر من المركز وبتقييم نزلاء حقيقي 8.8/10 بناء على 21,384 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('33fcd37d-574a-4205-8049-be4605f8e727', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/892021583.webp?k=b8a646d0005d0b6e6ae136c9e7375eb36b562ff5bef3f71f8ce123fab67690df&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('33fcd37d-574a-4205-8049-be4605f8e727', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('33fcd37d-574a-4205-8049-be4605f8e727', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '028b031a-e0f8-48d1-bea8-fcab6d946522', '33fcd37d-574a-4205-8049-be4605f8e727', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '028b031a-e0f8-48d1-bea8-fcab6d946522', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1743.0, 1429.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '6dd7730a-478c-43d5-82e5-b5c14bf7b1eb', '33fcd37d-574a-4205-8049-be4605f8e727', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '6dd7730a-478c-43d5-82e5-b5c14bf7b1eb', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2179.0, 1786.0, 763.0, 595.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'bea39d84-879b-4422-8642-1eefa8f67fc7', '33fcd37d-574a-4205-8049-be4605f8e727', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'bea39d84-879b-4422-8642-1eefa8f67fc7', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2614.0, 2144.0, 686.0, 536.0
);


-- --------------------------------------------------------------------
-- فندق: Rotana Jabal Omar Makkah (MAK-ROT-0005)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'd02a649c-b6aa-4788-a8bb-fd057d6ed562', 'MAK-ROT-0005', 'Rotana Jabal Omar Makkah', 'Rotana Jabal Omar Makkah', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.424087, 39.824605999999996, 'https://www.google.com/maps/search/?api=1&query=21.424087,39.824605999999996', 287, 'central_walking', TRUE,
    5, '+966 12 5185 1155', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/903317076.webp?k=3dd89e628101487c91c960f31d01deecefabc1b37653a481a61c9a8c89a7b36f&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 9.2/10 بناء على 1,725 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('d02a649c-b6aa-4788-a8bb-fd057d6ed562', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/903317076.webp?k=3dd89e628101487c91c960f31d01deecefabc1b37653a481a61c9a8c89a7b36f&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('d02a649c-b6aa-4788-a8bb-fd057d6ed562', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('d02a649c-b6aa-4788-a8bb-fd057d6ed562', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '8042a261-77a8-4206-b5ea-630ebfa7ae8c', 'd02a649c-b6aa-4788-a8bb-fd057d6ed562', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '8042a261-77a8-4206-b5ea-630ebfa7ae8c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1509.0, 1237.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '6d2b4ad5-dfee-4bf7-bda1-4288162c4a19', 'd02a649c-b6aa-4788-a8bb-fd057d6ed562', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '6d2b4ad5-dfee-4bf7-bda1-4288162c4a19', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1886.0, 1546.0, 660.0, 515.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '4afecce2-8670-452a-98aa-c9f7accbdb2a', 'd02a649c-b6aa-4788-a8bb-fd057d6ed562', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '4afecce2-8670-452a-98aa-c9f7accbdb2a', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2264.0, 1856.0, 594.0, 464.0
);


-- --------------------------------------------------------------------
-- فندق: دبل تري باي هيلتون جبل عمر مكة (MAK-HTL-0006)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '93372365-1e86-4906-a20b-4333dd2c5c06', 'MAK-HTL-0006', 'دبل تري باي هيلتون جبل عمر مكة', 'دبل تري باي هيلتون جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.423900000000003, 39.8202, 'https://www.google.com/maps/search/?api=1&query=21.423900000000003,39.8202', 757, 'central_outer', TRUE,
    5, '+966 12 5202 1186', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742076.webp?k=5a39fcf0033115dd3a6f6750403fee0e744c9ade0fa968c27b698cb343f49658&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.8 كلم من المركز وبتقييم نزلاء حقيقي 8.5/10 بناء على 9,257 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('93372365-1e86-4906-a20b-4333dd2c5c06', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742076.webp?k=5a39fcf0033115dd3a6f6750403fee0e744c9ade0fa968c27b698cb343f49658&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('93372365-1e86-4906-a20b-4333dd2c5c06', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('93372365-1e86-4906-a20b-4333dd2c5c06', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '6a3f0ebf-5050-42f9-8b03-dc69b98af537', '93372365-1e86-4906-a20b-4333dd2c5c06', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '6a3f0ebf-5050-42f9-8b03-dc69b98af537', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1411.0, 1157.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '8d0d108c-0d24-4458-a200-4a66d7941723', '93372365-1e86-4906-a20b-4333dd2c5c06', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '8d0d108c-0d24-4458-a200-4a66d7941723', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1764.0, 1446.0, 617.0, 482.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '2abf57d2-e8dc-4ead-a800-89bbf1d2dccc', '93372365-1e86-4906-a20b-4333dd2c5c06', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '2abf57d2-e8dc-4ead-a800-89bbf1d2dccc', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2116.0, 1736.0, 556.0, 434.0
);


-- --------------------------------------------------------------------
-- فندق: InterContinental Dar Al Tawhid Makkah by IHG (MAK-INT-0007)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '17f6de8d-4bf3-4593-808a-ac483ad2e6e0', 'MAK-INT-0007', 'InterContinental Dar Al Tawhid Makkah by IHG', 'InterContinental Dar Al Tawhid Makkah by IHG', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.420087, 39.826206, 'https://www.google.com/maps/search/?api=1&query=21.420087,39.826206', 315, 'central_walking', TRUE,
    5, '+966 12 5219 1217', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/245762423.webp?k=e03c2a2dba939986cb7fb7b56f203353672fe39c2ae3b5446d7e52dade455506&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 450 متر من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 3,707 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('17f6de8d-4bf3-4593-808a-ac483ad2e6e0', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/245762423.webp?k=e03c2a2dba939986cb7fb7b56f203353672fe39c2ae3b5446d7e52dade455506&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('17f6de8d-4bf3-4593-808a-ac483ad2e6e0', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('17f6de8d-4bf3-4593-808a-ac483ad2e6e0', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '3a42633b-82d3-4b98-9aa1-e70807d8b3f7', '17f6de8d-4bf3-4593-808a-ac483ad2e6e0', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '3a42633b-82d3-4b98-9aa1-e70807d8b3f7', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2512.0, 2060.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'd7128650-d2fc-4742-9c0b-977b7787b97d', '17f6de8d-4bf3-4593-808a-ac483ad2e6e0', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'd7128650-d2fc-4742-9c0b-977b7787b97d', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3140.0, 2575.0, 1099.0, 858.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'fd2d55f2-1ea0-466a-85eb-9208e6e64e8f', '17f6de8d-4bf3-4593-808a-ac483ad2e6e0', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'fd2d55f2-1ea0-466a-85eb-9208e6e64e8f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3768.0, 3090.0, 989.0, 772.0
);


-- --------------------------------------------------------------------
-- فندق: جميرا جبل عمر مكة (MAK-HTL-0008)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'a4b09b9a-bb52-4fd0-be19-0843d2050caf', 'MAK-HTL-0008', 'جميرا جبل عمر مكة', 'جميرا جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.419900000000002, 39.821799999999996, 'https://www.google.com/maps/search/?api=1&query=21.419900000000002,39.821799999999996', 636, 'central_outer', TRUE,
    5, '+966 12 5236 1248', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/511152045.webp?k=c9a5c94d0d7feae42e51b09d09dc6d71535f8c4f58caa462cbf1ea08060eb9d6&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 15,103 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a4b09b9a-bb52-4fd0-be19-0843d2050caf', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/511152045.webp?k=c9a5c94d0d7feae42e51b09d09dc6d71535f8c4f58caa462cbf1ea08060eb9d6&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a4b09b9a-bb52-4fd0-be19-0843d2050caf', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a4b09b9a-bb52-4fd0-be19-0843d2050caf', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '87b1d562-c7f7-4eec-a665-f689695595bc', 'a4b09b9a-bb52-4fd0-be19-0843d2050caf', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '87b1d562-c7f7-4eec-a665-f689695595bc', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1936.0, 1588.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'b9aa47c7-e6b8-44f3-98ad-db8ede417b2f', 'a4b09b9a-bb52-4fd0-be19-0843d2050caf', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'b9aa47c7-e6b8-44f3-98ad-db8ede417b2f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2420.0, 1985.0, 847.0, 662.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'ae5a99f2-bb6d-4104-9e8c-c3bbea07fcb0', 'a4b09b9a-bb52-4fd0-be19-0843d2050caf', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'ae5a99f2-bb6d-4104-9e8c-c3bbea07fcb0', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2904.0, 2382.0, 762.0, 596.0
);


-- --------------------------------------------------------------------
-- فندق: فندق أبراج لو ميريديان مكة المكرمة (MAK-HTL-0009)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '538c304f-f446-4780-aedd-96ef36de05c1', 'MAK-HTL-0009', 'فندق أبراج لو ميريديان مكة المكرمة', 'فندق أبراج لو ميريديان مكة المكرمة', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.421687, 39.827806, 'https://www.google.com/maps/search/?api=1&query=21.421687,39.827806', 222, 'central_walking', TRUE,
    5, '+966 12 5253 1279', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/630021253.webp?k=c30cafa770dc1a22153c3169726ae4bfc40feaae3388b61be5c441a6ef09a2be&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 2.2 كلم من المركز وبتقييم نزلاء حقيقي 8.5/10 بناء على 4,966 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('538c304f-f446-4780-aedd-96ef36de05c1', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/630021253.webp?k=c30cafa770dc1a22153c3169726ae4bfc40feaae3388b61be5c441a6ef09a2be&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('538c304f-f446-4780-aedd-96ef36de05c1', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('538c304f-f446-4780-aedd-96ef36de05c1', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'dde34379-1571-41fa-bdbf-0a39348ea4b7', '538c304f-f446-4780-aedd-96ef36de05c1', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'dde34379-1571-41fa-bdbf-0a39348ea4b7', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    506.0, 415.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '8d5b6bd2-fdc4-4623-9351-8c2fabca2d1c', '538c304f-f446-4780-aedd-96ef36de05c1', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '8d5b6bd2-fdc4-4623-9351-8c2fabca2d1c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    632.0, 519.0, 221.0, 173.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '98e32912-91d3-4d5b-b08d-508f4e01b976', '538c304f-f446-4780-aedd-96ef36de05c1', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '98e32912-91d3-4d5b-b08d-508f4e01b976', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    759.0, 622.0, 199.0, 156.0
);


-- --------------------------------------------------------------------
-- فندق: فندق هيلتون المؤتمرات جبل عمر مكة (MAK-HTL-0010)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '223cb52b-9b76-492f-b5fd-be587af23f03', 'MAK-HTL-0010', 'فندق هيلتون المؤتمرات جبل عمر مكة', 'فندق هيلتون المؤتمرات جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.4215, 39.819399999999995, 'https://www.google.com/maps/search/?api=1&query=21.4215,39.819399999999995', 841, 'central_outer', TRUE,
    5, '+966 12 5270 1310', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742485.webp?k=78647839b7455b7b317018115ad1eceb41e258da1f5c79fc26fb91dc036fa13e&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 8.5/10 بناء على 12,478 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('223cb52b-9b76-492f-b5fd-be587af23f03', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742485.webp?k=78647839b7455b7b317018115ad1eceb41e258da1f5c79fc26fb91dc036fa13e&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('223cb52b-9b76-492f-b5fd-be587af23f03', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('223cb52b-9b76-492f-b5fd-be587af23f03', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'ac680f7d-f16f-44b5-9570-8c9e7488941e', '223cb52b-9b76-492f-b5fd-be587af23f03', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'ac680f7d-f16f-44b5-9570-8c9e7488941e', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1602.0, 1314.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '930f718c-bb70-4e72-adc0-7f173d2a2b4a', '223cb52b-9b76-492f-b5fd-be587af23f03', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '930f718c-bb70-4e72-adc0-7f173d2a2b4a', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2002.0, 1642.0, 701.0, 548.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '94b5cbf8-605e-412e-ae70-038f04a5c9ca', '223cb52b-9b76-492f-b5fd-be587af23f03', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '94b5cbf8-605e-412e-ae70-038f04a5c9ca', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2403.0, 1971.0, 631.0, 493.0
);


-- --------------------------------------------------------------------
-- فندق: فندق لو مريديان مكة المكرمة (MAK-HTL-0011)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '7ad831a4-30d8-4562-8aea-ca4a168bfde9', 'MAK-HTL-0011', 'فندق لو مريديان مكة المكرمة', 'فندق لو مريديان مكة المكرمة', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.423287000000002, 39.825406, 'https://www.google.com/maps/search/?api=1&query=21.423287000000002,39.825406', 143, 'central_first_row', TRUE,
    5, '+966 12 5287 1341', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/630017052.webp?k=00a2d4d80f8cfe5e7401db1ad6ff023682aec0656542960bb1f3c98a68a4e8b9&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 400 متر من المركز وبتقييم نزلاء حقيقي 8.6/10 بناء على 3,545 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('7ad831a4-30d8-4562-8aea-ca4a168bfde9', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/630017052.webp?k=00a2d4d80f8cfe5e7401db1ad6ff023682aec0656542960bb1f3c98a68a4e8b9&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('7ad831a4-30d8-4562-8aea-ca4a168bfde9', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('7ad831a4-30d8-4562-8aea-ca4a168bfde9', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '64c9b2c4-f46f-43eb-a8e5-3d85929103ed', '7ad831a4-30d8-4562-8aea-ca4a168bfde9', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '64c9b2c4-f46f-43eb-a8e5-3d85929103ed', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1497.0, 1228.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '39f026be-4e8d-4e5a-8179-e6da4e2d25c1', '7ad831a4-30d8-4562-8aea-ca4a168bfde9', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '39f026be-4e8d-4e5a-8179-e6da4e2d25c1', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1871.0, 1535.0, 655.0, 512.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'f47e5b82-bf2b-4a57-82c9-18ed451b53f9', '7ad831a4-30d8-4562-8aea-ca4a168bfde9', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'f47e5b82-bf2b-4a57-82c9-18ed451b53f9', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2246.0, 1842.0, 589.0, 460.0
);


-- --------------------------------------------------------------------
-- فندق: هيلتون الأجنحة جبل عمر مكة (MAK-HTL-0012)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'aed125a4-a47d-491e-83f2-3911fe9d7d42', 'MAK-HTL-0012', 'هيلتون الأجنحة جبل عمر مكة', 'هيلتون الأجنحة جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.4231, 39.821, 'https://www.google.com/maps/search/?api=1&query=21.4231,39.821', 641, 'central_outer', TRUE,
    5, '+966 12 5304 1372', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742572.webp?k=26cc8aca851cb6d20e4b055d189f063473ae9bdf00334a4ad31bdf89fab12102&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 500 متر من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 6,689 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('aed125a4-a47d-491e-83f2-3911fe9d7d42', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742572.webp?k=26cc8aca851cb6d20e4b055d189f063473ae9bdf00334a4ad31bdf89fab12102&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('aed125a4-a47d-491e-83f2-3911fe9d7d42', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('aed125a4-a47d-491e-83f2-3911fe9d7d42', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'bd41be34-80f3-4370-b637-7b816211c6ec', 'aed125a4-a47d-491e-83f2-3911fe9d7d42', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'bd41be34-80f3-4370-b637-7b816211c6ec', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2009.0, 1647.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'e9978838-86ba-4549-8061-d1613f30f3a5', 'aed125a4-a47d-491e-83f2-3911fe9d7d42', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'e9978838-86ba-4549-8061-d1613f30f3a5', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2511.0, 2059.0, 879.0, 686.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'c56e8b10-82e1-4b69-a60f-31f0fdd913e8', 'aed125a4-a47d-491e-83f2-3911fe9d7d42', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'c56e8b10-82e1-4b69-a60f-31f0fdd913e8', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3014.0, 2470.0, 791.0, 618.0
);


-- --------------------------------------------------------------------
-- فندق: Emaar Elite Makkah Hotel (MAK-EMA-0013)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '69103d1b-e9dd-4950-acc4-8d65b39014bb', 'MAK-EMA-0013', 'Emaar Elite Makkah Hotel', 'Emaar Elite Makkah Hotel', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.424887000000002, 39.827006, 'https://www.google.com/maps/search/?api=1&query=21.424887000000002,39.827006', 330, 'central_walking', TRUE,
    5, '+966 12 5321 1403', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/573196335.webp?k=ebde2e2888246bb1fb2d0e10969f10f8a4ee36bdb6ab0463d1e146caf08e6e48&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 1.5 كلم من المركز وبتقييم نزلاء حقيقي 8.2/10 بناء على 3,552 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('69103d1b-e9dd-4950-acc4-8d65b39014bb', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/573196335.webp?k=ebde2e2888246bb1fb2d0e10969f10f8a4ee36bdb6ab0463d1e146caf08e6e48&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('69103d1b-e9dd-4950-acc4-8d65b39014bb', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('69103d1b-e9dd-4950-acc4-8d65b39014bb', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'fdaf1112-4252-498c-8fa8-1a750c46369e', '69103d1b-e9dd-4950-acc4-8d65b39014bb', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'fdaf1112-4252-498c-8fa8-1a750c46369e', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    363.0, 298.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'f6342fdb-dccc-4c1b-b714-de6679796463', '69103d1b-e9dd-4950-acc4-8d65b39014bb', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'f6342fdb-dccc-4c1b-b714-de6679796463', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    454.0, 372.0, 159.0, 124.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '1ed61220-5415-496b-a858-0eed72f6ace9', '69103d1b-e9dd-4950-acc4-8d65b39014bb', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '1ed61220-5415-496b-a858-0eed72f6ace9', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    544.0, 447.0, 143.0, 112.0
);


-- --------------------------------------------------------------------
-- فندق: Royal Almashaer (MAK-ROY-0014)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '1c5064f7-96c1-4e15-9842-4115519cb84e', 'MAK-ROY-0014', 'Royal Almashaer', 'Royal Almashaer', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.420087, 39.827806, 'https://www.google.com/maps/search/?api=1&query=21.420087,39.827806', 371, 'central_walking', TRUE,
    4, '+966 12 5338 1434', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/480645771.webp?k=6e048995b17939ebba5584554389e8ee09ca20a280c575e40736d8d872b1815a&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 6.3 كلم من المركز وبتقييم نزلاء حقيقي 7.3/10 بناء على 97 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('1c5064f7-96c1-4e15-9842-4115519cb84e', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/480645771.webp?k=6e048995b17939ebba5584554389e8ee09ca20a280c575e40736d8d872b1815a&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('1c5064f7-96c1-4e15-9842-4115519cb84e', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('1c5064f7-96c1-4e15-9842-4115519cb84e', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '27756588-f321-4ec3-a9d7-4719be38fdff', '1c5064f7-96c1-4e15-9842-4115519cb84e', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '27756588-f321-4ec3-a9d7-4719be38fdff', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    450.0, 369.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '057cf287-e5b0-401c-8729-527683f0f6da', '1c5064f7-96c1-4e15-9842-4115519cb84e', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '057cf287-e5b0-401c-8729-527683f0f6da', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    562.0, 461.0, 197.0, 154.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '94516c96-bd34-462e-9b50-e8e03049cd8f', '1c5064f7-96c1-4e15-9842-4115519cb84e', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '94516c96-bd34-462e-9b50-e8e03049cd8f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    675.0, 554.0, 177.0, 138.0
);


-- --------------------------------------------------------------------
-- فندق: فور بوينتس باي شيراتون مكة المكرمة النسيم (MAK-HTL-0015)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '614a2252-b9b5-4930-9428-2e4952f83e7a', 'MAK-HTL-0015', 'فور بوينتس باي شيراتون مكة المكرمة النسيم', 'فور بوينتس باي شيراتون مكة المكرمة النسيم', 'makkah', 'النسيم', 'حي النسيم، مكة المكرمة',
    21.3904, 39.880399999999995, 'https://www.google.com/maps/search/?api=1&query=21.3904,39.880399999999995', 7846, 'shuttle_bus', FALSE,
    5, '+966 12 5355 1465', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/628113158.webp?k=441a72d2d5f85751aff1932efe4940478614101ca3d745272c82647400a15a53&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي النسيم. يتميز بـ 6.8 كلم من المركز وبتقييم نزلاء حقيقي 8.1/10 بناء على 10,188 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('614a2252-b9b5-4930-9428-2e4952f83e7a', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/628113158.webp?k=441a72d2d5f85751aff1932efe4940478614101ca3d745272c82647400a15a53&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('614a2252-b9b5-4930-9428-2e4952f83e7a', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('614a2252-b9b5-4930-9428-2e4952f83e7a', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '4cc330b6-2b8b-478e-9506-b78915fc368a', '614a2252-b9b5-4930-9428-2e4952f83e7a', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '4cc330b6-2b8b-478e-9506-b78915fc368a', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    371.0, 304.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'fda7ece2-921d-4154-9195-1868751618be', '614a2252-b9b5-4930-9428-2e4952f83e7a', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'fda7ece2-921d-4154-9195-1868751618be', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    464.0, 380.0, 162.0, 127.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '9a2d09e2-825e-4e99-aa7b-b1c378275416', '614a2252-b9b5-4930-9428-2e4952f83e7a', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '9a2d09e2-825e-4e99-aa7b-b1c378275416', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    556.0, 456.0, 146.0, 114.0
);


-- --------------------------------------------------------------------
-- فندق: Al Shohada by Palm Rich Makkah (MAK-SHO-0016)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '4adee08d-16fb-43fd-90b9-3a7e15fd8e41', 'MAK-SHO-0016', 'Al Shohada by Palm Rich Makkah', 'Al Shohada by Palm Rich Makkah', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.421687, 39.825406, 'https://www.google.com/maps/search/?api=1&query=21.421687,39.825406', 143, 'central_first_row', TRUE,
    5, '+966 12 5372 1496', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/889507953.webp?k=6aa43f8715e9e1aeb1a4315988d49279e061e4b6b36115d973d333bfbf6d24fd&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 0.9 كلم من المركز وبتقييم نزلاء حقيقي 8.6/10 بناء على 4,073 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('4adee08d-16fb-43fd-90b9-3a7e15fd8e41', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/889507953.webp?k=6aa43f8715e9e1aeb1a4315988d49279e061e4b6b36115d973d333bfbf6d24fd&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('4adee08d-16fb-43fd-90b9-3a7e15fd8e41', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('4adee08d-16fb-43fd-90b9-3a7e15fd8e41', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '97b242d2-9414-4562-9745-eac63cd562d0', '4adee08d-16fb-43fd-90b9-3a7e15fd8e41', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '97b242d2-9414-4562-9745-eac63cd562d0', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1338.0, 1097.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'ea083209-7d49-4eba-92c2-bbd42fd0de22', '4adee08d-16fb-43fd-90b9-3a7e15fd8e41', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'ea083209-7d49-4eba-92c2-bbd42fd0de22', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1672.0, 1371.0, 585.0, 457.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '0c1c0f26-c261-48d5-8bb5-5f5873b23d3d', '4adee08d-16fb-43fd-90b9-3a7e15fd8e41', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '0c1c0f26-c261-48d5-8bb5-5f5873b23d3d', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2007.0, 1646.0, 527.0, 411.0
);


-- --------------------------------------------------------------------
-- فندق: فندق مكارم أم القرى (MAK-HTL-0017)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'f3e29b5a-9d77-4f33-8c8d-ffb07643528f', 'MAK-HTL-0017', 'فندق مكارم أم القرى', 'فندق مكارم أم القرى', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.422487, 39.826206, 'https://www.google.com/maps/search/?api=1&query=21.422487,39.826206', 0, 'central_first_row', TRUE,
    5, '+966 12 5389 1527', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/882263912.webp?k=920909d9256ccbb5badc3142c46c54634263573451a5d8fe45bd09bb366e766a&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 2.2 كلم من المركز وبتقييم نزلاء حقيقي 8.1/10 بناء على 6,914 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f3e29b5a-9d77-4f33-8c8d-ffb07643528f', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/882263912.webp?k=920909d9256ccbb5badc3142c46c54634263573451a5d8fe45bd09bb366e766a&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f3e29b5a-9d77-4f33-8c8d-ffb07643528f', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f3e29b5a-9d77-4f33-8c8d-ffb07643528f', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '70c752ec-02fb-4293-bd28-5a0740a107bc', 'f3e29b5a-9d77-4f33-8c8d-ffb07643528f', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '70c752ec-02fb-4293-bd28-5a0740a107bc', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    324.0, 266.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'ad14a3f9-6a55-464e-a764-b5b348b86d23', 'f3e29b5a-9d77-4f33-8c8d-ffb07643528f', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'ad14a3f9-6a55-464e-a764-b5b348b86d23', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    405.0, 332.0, 142.0, 111.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '3fa352eb-7474-4491-a068-cfb9792c6ab0', 'f3e29b5a-9d77-4f33-8c8d-ffb07643528f', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '3fa352eb-7474-4491-a068-cfb9792c6ab0', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    486.0, 399.0, 128.0, 100.0
);


-- --------------------------------------------------------------------
-- فندق: فندق بونسيانا مكة - Poinciana Hotel Makkah (MAK-POI-0018)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '5de7ced7-bd93-4056-97b4-0eb43cee4a43', 'MAK-POI-0018', 'فندق بونسيانا مكة - Poinciana Hotel Makkah', 'فندق بونسيانا مكة - Poinciana Hotel Makkah', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.423287000000002, 39.827006, 'https://www.google.com/maps/search/?api=1&query=21.423287000000002,39.827006', 143, 'central_first_row', TRUE,
    4, '+966 12 5406 1558', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/804023844.webp?k=afee15ba294117b83fb779cf1dafaac1a1b498a9a3a646a783629bbc1e1607ba&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 1.3 كلم من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 614 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5de7ced7-bd93-4056-97b4-0eb43cee4a43', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/804023844.webp?k=afee15ba294117b83fb779cf1dafaac1a1b498a9a3a646a783629bbc1e1607ba&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5de7ced7-bd93-4056-97b4-0eb43cee4a43', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5de7ced7-bd93-4056-97b4-0eb43cee4a43', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '174ca4c4-8e0f-4f76-8d3f-837f7f166f09', '5de7ced7-bd93-4056-97b4-0eb43cee4a43', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '174ca4c4-8e0f-4f76-8d3f-837f7f166f09', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    634.0, 520.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'bc60f018-7670-41cb-8f6e-858244e8e2e7', '5de7ced7-bd93-4056-97b4-0eb43cee4a43', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'bc60f018-7670-41cb-8f6e-858244e8e2e7', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    792.0, 650.0, 277.0, 217.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'ad4a5066-d987-4558-8f1f-10466c6645ef', '5de7ced7-bd93-4056-97b4-0eb43cee4a43', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'ad4a5066-d987-4558-8f1f-10466c6645ef', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    951.0, 780.0, 250.0, 195.0
);


-- --------------------------------------------------------------------
-- فندق: فندق ضيوف المقام واحد توصيل مجاني للحرم - Douof Al Maqam One Hotel Free Shuttle Service (MAK-DOU-0019)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '2e8b9fe4-4a4c-4326-b9b3-71f865c80847', 'MAK-DOU-0019', 'فندق ضيوف المقام واحد توصيل مجاني للحرم - Douof Al Maqam One Hotel Free Shuttle Service', 'فندق ضيوف المقام واحد توصيل مجاني للحرم - Douof Al Maqam One Hotel Free Shuttle Service', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.424087, 39.827806, 'https://www.google.com/maps/search/?api=1&query=21.424087,39.827806', 287, 'central_walking', TRUE,
    4, '+966 12 5423 1589', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/674225991.webp?k=799e1aa8ec893a17904d011499c1bf24e0f2978529f894d1364cdf5a346ed4b8&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 2.4 كلم من المركز وبتقييم نزلاء حقيقي 7.8/10 بناء على 1,307 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2e8b9fe4-4a4c-4326-b9b3-71f865c80847', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/674225991.webp?k=799e1aa8ec893a17904d011499c1bf24e0f2978529f894d1364cdf5a346ed4b8&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2e8b9fe4-4a4c-4326-b9b3-71f865c80847', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2e8b9fe4-4a4c-4326-b9b3-71f865c80847', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '720f0fce-a8f7-45ee-a2e0-fcf88c49f964', '2e8b9fe4-4a4c-4326-b9b3-71f865c80847', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '720f0fce-a8f7-45ee-a2e0-fcf88c49f964', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    450.0, 369.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '3da38e73-ac1e-47c5-91c4-214d3ef85438', '2e8b9fe4-4a4c-4326-b9b3-71f865c80847', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '3da38e73-ac1e-47c5-91c4-214d3ef85438', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    562.0, 461.0, 197.0, 154.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '24ce5969-9203-4ab4-abc6-16828c0d4771', '2e8b9fe4-4a4c-4326-b9b3-71f865c80847', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '24ce5969-9203-4ab4-abc6-16828c0d4771', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    675.0, 554.0, 177.0, 138.0
);


-- --------------------------------------------------------------------
-- فندق: فندق مكارم أجياد مكة (MAK-HTL-0020)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '6449d6a5-a3f0-4810-8236-2b0d188a6a48', 'MAK-HTL-0020', 'فندق مكارم أجياد مكة', 'Makarem Ajyad Makkah Hotel', 'makkah', 'أجياد', 'شارع أجياد العام، على بعد 300 متر من الحرم، مكة المكرمة',
    21.4172, 39.8285, 'https://www.google.com/maps/search/?api=1&query=21.4172,39.8285', 748, 'central_outer', TRUE,
    5, '+966 12 5440 1620', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/921116724.webp?k=cb9b93c1a93c82b012bf527894eb376262b03252d5c1179b5fbefb83d2dd17e2&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي أجياد. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 8.5/10 بناء على 7,408 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('6449d6a5-a3f0-4810-8236-2b0d188a6a48', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/921116724.webp?k=cb9b93c1a93c82b012bf527894eb376262b03252d5c1179b5fbefb83d2dd17e2&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('6449d6a5-a3f0-4810-8236-2b0d188a6a48', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('6449d6a5-a3f0-4810-8236-2b0d188a6a48', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '35cea790-ee53-463e-a6cb-e0f15d3004fc', '6449d6a5-a3f0-4810-8236-2b0d188a6a48', 'quad', 'غرفة رباعية عائلية مريحة', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '35cea790-ee53-463e-a6cb-e0f15d3004fc', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    890.0, 740.0, 240.0, 198.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'c598c3e0-7b20-4a33-a0c6-78d5b255e34b', '6449d6a5-a3f0-4810-8236-2b0d188a6a48', 'triple', 'غرفة ثلاثية بريميوم', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'c598c3e0-7b20-4a33-a0c6-78d5b255e34b', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    790.0, 650.0, 280.0, 230.0
);


-- --------------------------------------------------------------------
-- فندق: فندق سويس أوتيل مكة (MAK-HTL-0021)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '2f638974-b420-49ed-9dd3-abcb85cc2a63', 'MAK-HTL-0021', 'فندق سويس أوتيل مكة', 'إيبيس ستايلز مكة', 'makkah', 'أجياد', 'مجمع أبراج البيت، تقاطع شارع إبراهيم الخليل وأجياد',
    21.4198, 39.8252, 'https://www.google.com/maps/search/?api=1&query=21.4198,39.8252', 373, 'central_walking', TRUE,
    5, '+966 12 5457 1651', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/914585345.webp?k=4c1b793cd32e333df43ecccafd43425fa9a792acae475fbe3d080e694f06145c&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 3 كلم من المركز وبتقييم نزلاء حقيقي 8.0/10 بناء على 9,180 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2f638974-b420-49ed-9dd3-abcb85cc2a63', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/914585345.webp?k=4c1b793cd32e333df43ecccafd43425fa9a792acae475fbe3d080e694f06145c&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2f638974-b420-49ed-9dd3-abcb85cc2a63', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2f638974-b420-49ed-9dd3-abcb85cc2a63', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '51d21df6-f5ba-4075-a965-768569c8a5e5', '2f638974-b420-49ed-9dd3-abcb85cc2a63', 'double', 'غرفة كلاسيكية كينج / توأم', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '51d21df6-f5ba-4075-a965-768569c8a5e5', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    1150.0, 950.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'fe805fb1-ba4b-44b7-9b51-1ff9a125489b', '2f638974-b420-49ed-9dd3-abcb85cc2a63', 'quad', 'غرفة رباعية بريميوم إطلالة حرم', 4, TRUE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'fe805fb1-ba4b-44b7-9b51-1ff9a125489b', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1650.0, 1360.0, 440.0, 360.0
);


-- --------------------------------------------------------------------
-- فندق: كونراد جبل عمر مكة (MAK-HTL-0022)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'a51ca56f-5887-47db-bca4-3a1aec795eb1', 'MAK-HTL-0022', 'كونراد جبل عمر مكة', 'كونراد جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.419900000000002, 39.821, 'https://www.google.com/maps/search/?api=1&query=21.419900000000002,39.821', 721, 'central_outer', TRUE,
    5, '+966 12 5474 1682', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/928063101.webp?k=4e2b273352bbc2f7827c409b9abff6b3efb8ed788d804955e3ae1bae2d7320e5&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 5,711 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a51ca56f-5887-47db-bca4-3a1aec795eb1', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/928063101.webp?k=4e2b273352bbc2f7827c409b9abff6b3efb8ed788d804955e3ae1bae2d7320e5&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a51ca56f-5887-47db-bca4-3a1aec795eb1', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a51ca56f-5887-47db-bca4-3a1aec795eb1', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '16b21f29-97f3-4ada-a218-150e19fde23f', 'a51ca56f-5887-47db-bca4-3a1aec795eb1', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '16b21f29-97f3-4ada-a218-150e19fde23f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2104.0, 1725.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'bab0ebbe-40a8-4c38-bc0d-2d7378a5f23e', 'a51ca56f-5887-47db-bca4-3a1aec795eb1', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'bab0ebbe-40a8-4c38-bc0d-2d7378a5f23e', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2630.0, 2156.0, 920.0, 719.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '938185d3-d4bc-4860-b998-3030a59c4995', 'a51ca56f-5887-47db-bca4-3a1aec795eb1', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '938185d3-d4bc-4860-b998-3030a59c4995', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3156.0, 2588.0, 828.0, 647.0
);


-- --------------------------------------------------------------------
-- فندق: سويس أوتيل مكة (MAK-HTL-0023)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '810bb2ef-2fa1-4b94-9a22-cdaf55517ad4', 'MAK-HTL-0023', 'سويس أوتيل مكة', 'سويس أوتيل مكة', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.421687, 39.827006, 'https://www.google.com/maps/search/?api=1&query=21.421687,39.827006', 143, 'central_first_row', TRUE,
    5, '+966 12 5491 1713', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/820913168.webp?k=25998b04cf075df87e042db5fd946c142647b13b6abb6ab39c4982f21da74843&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 300 متر من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 22,719 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('810bb2ef-2fa1-4b94-9a22-cdaf55517ad4', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/820913168.webp?k=25998b04cf075df87e042db5fd946c142647b13b6abb6ab39c4982f21da74843&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('810bb2ef-2fa1-4b94-9a22-cdaf55517ad4', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('810bb2ef-2fa1-4b94-9a22-cdaf55517ad4', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '6468e06a-3b20-4331-b96b-1695b3e524a7', '810bb2ef-2fa1-4b94-9a22-cdaf55517ad4', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '6468e06a-3b20-4331-b96b-1695b3e524a7', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2102.0, 1724.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'eafa5b8d-d90b-40e3-aca4-f2e4f4580e38', '810bb2ef-2fa1-4b94-9a22-cdaf55517ad4', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'eafa5b8d-d90b-40e3-aca4-f2e4f4580e38', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2628.0, 2155.0, 920.0, 718.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '6724ce3e-fab0-43c5-9524-2161a1e1b20d', '810bb2ef-2fa1-4b94-9a22-cdaf55517ad4', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '6724ce3e-fab0-43c5-9524-2161a1e1b20d', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3153.0, 2586.0, 828.0, 646.0
);


-- --------------------------------------------------------------------
-- فندق: فندق إعمار جراند (MAK-HTL-0024)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'f3c97ff2-3477-49e3-9731-edd9b0288dde', 'MAK-HTL-0024', 'فندق إعمار جراند', 'فندق إعمار جراند', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.422487, 39.827806, 'https://www.google.com/maps/search/?api=1&query=21.422487,39.827806', 195, 'central_walking', TRUE,
    5, '+966 12 5508 1744', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/520998885.webp?k=a14b6a46aa2d9fd1ccaf612dcbfdc81a53a4c388a91bb51882df23abc73ea40f&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 1.1 كلم من المركز وبتقييم نزلاء حقيقي 8.0/10 بناء على 5,098 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f3c97ff2-3477-49e3-9731-edd9b0288dde', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/520998885.webp?k=a14b6a46aa2d9fd1ccaf612dcbfdc81a53a4c388a91bb51882df23abc73ea40f&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f3c97ff2-3477-49e3-9731-edd9b0288dde', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f3c97ff2-3477-49e3-9731-edd9b0288dde', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'd6c866ec-b294-4f0b-b77d-841ea7f88c96', 'f3c97ff2-3477-49e3-9731-edd9b0288dde', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'd6c866ec-b294-4f0b-b77d-841ea7f88c96', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    909.0, 745.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '3d63b005-edb2-445f-b43a-1ba2f6b1c138', 'f3c97ff2-3477-49e3-9731-edd9b0288dde', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '3d63b005-edb2-445f-b43a-1ba2f6b1c138', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1136.0, 931.0, 398.0, 310.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '02ac8de2-e208-40d2-a146-4ea817997ab4', 'f3c97ff2-3477-49e3-9731-edd9b0288dde', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '02ac8de2-e208-40d2-a146-4ea817997ab4', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1364.0, 1118.0, 358.0, 279.0
);


-- --------------------------------------------------------------------
-- فندق: DoubleTree by Hilton Makkah Aziziyah (MAK-DOU-0025)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '71a87099-9604-4206-87aa-bc66e753be6e', 'MAK-DOU-0025', 'DoubleTree by Hilton Makkah Aziziyah', 'DoubleTree by Hilton Makkah Aziziyah', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.423287000000002, 39.824605999999996, 'https://www.google.com/maps/search/?api=1&query=21.423287000000002,39.824605999999996', 222, 'central_walking', TRUE,
    5, '+966 12 5525 1775', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/830088943.webp?k=e6b81acf6adb2ca6a1d4a0617f857d693a79eb21e4f3d7d11fd49f36e4115ed7&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 5.4 كلم من المركز وبتقييم نزلاء حقيقي 8.7/10 بناء على 5,775 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('71a87099-9604-4206-87aa-bc66e753be6e', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/830088943.webp?k=e6b81acf6adb2ca6a1d4a0617f857d693a79eb21e4f3d7d11fd49f36e4115ed7&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('71a87099-9604-4206-87aa-bc66e753be6e', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('71a87099-9604-4206-87aa-bc66e753be6e', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'dfa5453e-fda5-4ff2-9d24-5afdd4aa9afa', '71a87099-9604-4206-87aa-bc66e753be6e', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'dfa5453e-fda5-4ff2-9d24-5afdd4aa9afa', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    364.0, 298.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'a0062fe3-c7f4-4369-8f90-2bca576ead7e', '71a87099-9604-4206-87aa-bc66e753be6e', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'a0062fe3-c7f4-4369-8f90-2bca576ead7e', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    455.0, 372.0, 159.0, 124.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '7f274604-7d6e-4321-abc5-2378dcd4285d', '71a87099-9604-4206-87aa-bc66e753be6e', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '7f274604-7d6e-4321-abc5-2378dcd4285d', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    546.0, 447.0, 143.0, 112.0
);


-- --------------------------------------------------------------------
-- فندق: Rowaa Lindy Hotel Makkah (MAK-ROW-0026)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'e8306b97-a967-4448-b337-c72eb9d662d2', 'MAK-ROW-0026', 'Rowaa Lindy Hotel Makkah', 'Rowaa Lindy Hotel Makkah', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.424087, 39.825406, 'https://www.google.com/maps/search/?api=1&query=21.424087,39.825406', 232, 'central_walking', TRUE,
    4, '+966 12 5542 1806', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/825494409.webp?k=a5d27bc7ddf298c2ffac3983ede687fe0d28137db2850e2bafde172bd23f8509&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 5.3 كلم من المركز وبتقييم نزلاء حقيقي 7.8/10 بناء على 108 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e8306b97-a967-4448-b337-c72eb9d662d2', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/825494409.webp?k=a5d27bc7ddf298c2ffac3983ede687fe0d28137db2850e2bafde172bd23f8509&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e8306b97-a967-4448-b337-c72eb9d662d2', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e8306b97-a967-4448-b337-c72eb9d662d2', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'd71af8a2-0d86-4de4-ac8d-add3be3e7fcc', 'e8306b97-a967-4448-b337-c72eb9d662d2', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'd71af8a2-0d86-4de4-ac8d-add3be3e7fcc', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    450.0, 369.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '5d074733-52b5-44c4-b369-c6b1a67d4703', 'e8306b97-a967-4448-b337-c72eb9d662d2', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '5d074733-52b5-44c4-b369-c6b1a67d4703', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    562.0, 461.0, 197.0, 154.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'efcc629f-343d-4014-86c7-deebf99da954', 'e8306b97-a967-4448-b337-c72eb9d662d2', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'efcc629f-343d-4014-86c7-deebf99da954', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    675.0, 554.0, 177.0, 138.0
);


-- --------------------------------------------------------------------
-- فندق: voco Makkah by IHG (MAK-VOC-0027)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '5e4353b6-5f61-4e3d-be12-70932103ccb3', 'MAK-VOC-0027', 'voco Makkah by IHG', 'voco Makkah by IHG', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.424887000000002, 39.826206, 'https://www.google.com/maps/search/?api=1&query=21.424887000000002,39.826206', 315, 'central_walking', TRUE,
    5, '+966 12 5559 1837', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/427975173.webp?k=c085e75bd694945f26e0dfb54b13550a0342915f82e7e7ae6f599cbed9f0a68e&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 1.8 كلم من المركز وبتقييم نزلاء حقيقي 8.7/10 بناء على 16,923 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5e4353b6-5f61-4e3d-be12-70932103ccb3', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/427975173.webp?k=c085e75bd694945f26e0dfb54b13550a0342915f82e7e7ae6f599cbed9f0a68e&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5e4353b6-5f61-4e3d-be12-70932103ccb3', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5e4353b6-5f61-4e3d-be12-70932103ccb3', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '6da5b896-6e03-4acb-8c03-4914682880e0', '5e4353b6-5f61-4e3d-be12-70932103ccb3', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '6da5b896-6e03-4acb-8c03-4914682880e0', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    394.0, 323.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '84fc5371-c648-451d-a0ab-b32b043b0b13', '5e4353b6-5f61-4e3d-be12-70932103ccb3', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '84fc5371-c648-451d-a0ab-b32b043b0b13', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    492.0, 404.0, 172.0, 135.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'e156af97-adcc-4d0c-bbfb-7ac7bfe3f0ee', '5e4353b6-5f61-4e3d-be12-70932103ccb3', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'e156af97-adcc-4d0c-bbfb-7ac7bfe3f0ee', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    591.0, 484.0, 155.0, 121.0
);


-- --------------------------------------------------------------------
-- فندق: العنوان جبل عمر مكة (MAK-HTL-0028)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '3d1e6ad5-e580-4251-a0ff-3bde4d4c8631', 'MAK-HTL-0028', 'العنوان جبل عمر مكة', 'العنوان جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.4191, 39.821799999999996, 'https://www.google.com/maps/search/?api=1&query=21.4191,39.821799999999996', 698, 'central_outer', TRUE,
    5, '+966 12 5576 1868', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/536428550.webp?k=b67de61b70a83bd973e267adc7689cbf26b9abfc16bc5f11c933d65a21c38d19&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.7 كلم من المركز وبتقييم نزلاء حقيقي 8.6/10 بناء على 20,424 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('3d1e6ad5-e580-4251-a0ff-3bde4d4c8631', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/536428550.webp?k=b67de61b70a83bd973e267adc7689cbf26b9abfc16bc5f11c933d65a21c38d19&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('3d1e6ad5-e580-4251-a0ff-3bde4d4c8631', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('3d1e6ad5-e580-4251-a0ff-3bde4d4c8631', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '2c7cf526-1915-457c-9b19-397f9063bcc7', '3d1e6ad5-e580-4251-a0ff-3bde4d4c8631', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '2c7cf526-1915-457c-9b19-397f9063bcc7', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1538.0, 1261.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '0b4fde6e-73a1-413a-94ae-c0b0e5a03365', '3d1e6ad5-e580-4251-a0ff-3bde4d4c8631', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '0b4fde6e-73a1-413a-94ae-c0b0e5a03365', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1922.0, 1576.0, 673.0, 525.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'e61d39c7-42f0-4137-b784-b8dc5e6274b3', '3d1e6ad5-e580-4251-a0ff-3bde4d4c8631', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'e61d39c7-42f0-4137-b784-b8dc5e6274b3', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2307.0, 1892.0, 606.0, 473.0
);


-- --------------------------------------------------------------------
-- فندق: جبل عمر حياة ريجنسي مكة (MAK-HTL-0029)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'f033f62a-1627-43db-8e06-28d51ccf0f4e', 'MAK-HTL-0029', 'جبل عمر حياة ريجنسي مكة', 'جبل عمر حياة ريجنسي مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.419900000000002, 39.8226, 'https://www.google.com/maps/search/?api=1&query=21.419900000000002,39.8226', 556, 'central_outer', TRUE,
    5, '+966 12 5593 1899', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/892021583.webp?k=b8a646d0005d0b6e6ae136c9e7375eb36b562ff5bef3f71f8ce123fab67690df&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 450 متر من المركز وبتقييم نزلاء حقيقي 8.8/10 بناء على 21,384 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f033f62a-1627-43db-8e06-28d51ccf0f4e', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/892021583.webp?k=b8a646d0005d0b6e6ae136c9e7375eb36b562ff5bef3f71f8ce123fab67690df&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f033f62a-1627-43db-8e06-28d51ccf0f4e', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f033f62a-1627-43db-8e06-28d51ccf0f4e', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '71055f4d-752c-4d61-9e00-92fbf53c8091', 'f033f62a-1627-43db-8e06-28d51ccf0f4e', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '71055f4d-752c-4d61-9e00-92fbf53c8091', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1743.0, 1429.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'f7814584-8470-4865-9cdf-4d632657c416', 'f033f62a-1627-43db-8e06-28d51ccf0f4e', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'f7814584-8470-4865-9cdf-4d632657c416', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2179.0, 1786.0, 763.0, 595.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'b7bea9bb-a104-4e09-8197-a9b821fcb7fd', 'f033f62a-1627-43db-8e06-28d51ccf0f4e', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'b7bea9bb-a104-4e09-8197-a9b821fcb7fd', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2614.0, 2144.0, 686.0, 536.0
);


-- --------------------------------------------------------------------
-- فندق: Rotana Jabal Omar Makkah (MAK-ROT-0030)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'd26bb49f-220c-47a4-8425-643d9693d8e9', 'MAK-ROT-0030', 'Rotana Jabal Omar Makkah', 'Rotana Jabal Omar Makkah', 'makkah', 'الشبيكة', 'حي المنطقة المركزية، مكة المكرمة',
    21.421687, 39.824605999999996, 'https://www.google.com/maps/search/?api=1&query=21.421687,39.824605999999996', 222, 'central_walking', TRUE,
    5, '+966 12 5610 1930', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/903317076.webp?k=3dd89e628101487c91c960f31d01deecefabc1b37653a481a61c9a8c89a7b36f&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 9.2/10 بناء على 1,725 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('d26bb49f-220c-47a4-8425-643d9693d8e9', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/903317076.webp?k=3dd89e628101487c91c960f31d01deecefabc1b37653a481a61c9a8c89a7b36f&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('d26bb49f-220c-47a4-8425-643d9693d8e9', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('d26bb49f-220c-47a4-8425-643d9693d8e9', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '9da406be-a49f-4ba3-b065-143790bc4f49', 'd26bb49f-220c-47a4-8425-643d9693d8e9', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '9da406be-a49f-4ba3-b065-143790bc4f49', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1509.0, 1237.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '403c04c0-3b85-471d-a11b-fca7c3b42773', 'd26bb49f-220c-47a4-8425-643d9693d8e9', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '403c04c0-3b85-471d-a11b-fca7c3b42773', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1886.0, 1546.0, 660.0, 515.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'cecbe08b-ed9c-48eb-ae34-d98e6523ff61', 'd26bb49f-220c-47a4-8425-643d9693d8e9', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'cecbe08b-ed9c-48eb-ae34-d98e6523ff61', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2264.0, 1856.0, 594.0, 464.0
);


-- --------------------------------------------------------------------
-- فندق: دبل تري باي هيلتون جبل عمر مكة (MAK-HTL-0031)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'acc25f23-176e-44b2-ba29-f5cc446e97ac', 'MAK-HTL-0031', 'دبل تري باي هيلتون جبل عمر مكة', 'دبل تري باي هيلتون جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.4215, 39.8202, 'https://www.google.com/maps/search/?api=1&query=21.4215,39.8202', 745, 'central_outer', TRUE,
    5, '+966 12 5627 1961', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742076.webp?k=5a39fcf0033115dd3a6f6750403fee0e744c9ade0fa968c27b698cb343f49658&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.8 كلم من المركز وبتقييم نزلاء حقيقي 8.5/10 بناء على 9,257 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('acc25f23-176e-44b2-ba29-f5cc446e97ac', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742076.webp?k=5a39fcf0033115dd3a6f6750403fee0e744c9ade0fa968c27b698cb343f49658&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('acc25f23-176e-44b2-ba29-f5cc446e97ac', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('acc25f23-176e-44b2-ba29-f5cc446e97ac', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '7741d738-20da-403f-a3e9-106097bcb9e5', 'acc25f23-176e-44b2-ba29-f5cc446e97ac', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '7741d738-20da-403f-a3e9-106097bcb9e5', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1411.0, 1157.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '5d4b2e79-74a9-406c-b1aa-952ba64c9177', 'acc25f23-176e-44b2-ba29-f5cc446e97ac', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '5d4b2e79-74a9-406c-b1aa-952ba64c9177', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1764.0, 1446.0, 617.0, 482.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'b03a756f-a0b2-4c63-ad6a-f1697cb15e76', 'acc25f23-176e-44b2-ba29-f5cc446e97ac', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'b03a756f-a0b2-4c63-ad6a-f1697cb15e76', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2116.0, 1736.0, 556.0, 434.0
);


-- --------------------------------------------------------------------
-- فندق: InterContinental Dar Al Tawhid Makkah by IHG (MAK-INT-0032)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'd073c175-287e-4acd-bd03-52abcd2b3f82', 'MAK-INT-0032', 'InterContinental Dar Al Tawhid Makkah by IHG', 'InterContinental Dar Al Tawhid Makkah by IHG', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.423287000000002, 39.826206, 'https://www.google.com/maps/search/?api=1&query=21.423287000000002,39.826206', 105, 'central_first_row', TRUE,
    5, '+966 12 5644 1992', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/245762423.webp?k=e03c2a2dba939986cb7fb7b56f203353672fe39c2ae3b5446d7e52dade455506&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 450 متر من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 3,707 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('d073c175-287e-4acd-bd03-52abcd2b3f82', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/245762423.webp?k=e03c2a2dba939986cb7fb7b56f203353672fe39c2ae3b5446d7e52dade455506&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('d073c175-287e-4acd-bd03-52abcd2b3f82', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('d073c175-287e-4acd-bd03-52abcd2b3f82', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '94472da8-7bae-45fd-9e62-11329261deb4', 'd073c175-287e-4acd-bd03-52abcd2b3f82', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '94472da8-7bae-45fd-9e62-11329261deb4', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2512.0, 2060.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '6d781404-e823-4c18-b3d9-aa0d89d15dcd', 'd073c175-287e-4acd-bd03-52abcd2b3f82', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '6d781404-e823-4c18-b3d9-aa0d89d15dcd', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3140.0, 2575.0, 1099.0, 858.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '115cf123-3b5b-4f4a-afe2-46505f8eb6b8', 'd073c175-287e-4acd-bd03-52abcd2b3f82', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '115cf123-3b5b-4f4a-afe2-46505f8eb6b8', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3768.0, 3090.0, 989.0, 772.0
);


-- --------------------------------------------------------------------
-- فندق: جميرا جبل عمر مكة (MAK-HTL-0033)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'a704fc4c-b4c1-461d-912b-e6e30d777605', 'MAK-HTL-0033', 'جميرا جبل عمر مكة', 'جميرا جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.4231, 39.821799999999996, 'https://www.google.com/maps/search/?api=1&query=21.4231,39.821799999999996', 544, 'central_outer', TRUE,
    5, '+966 12 5661 2023', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/511152045.webp?k=c9a5c94d0d7feae42e51b09d09dc6d71535f8c4f58caa462cbf1ea08060eb9d6&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 15,103 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a704fc4c-b4c1-461d-912b-e6e30d777605', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/511152045.webp?k=c9a5c94d0d7feae42e51b09d09dc6d71535f8c4f58caa462cbf1ea08060eb9d6&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a704fc4c-b4c1-461d-912b-e6e30d777605', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a704fc4c-b4c1-461d-912b-e6e30d777605', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '525e9e21-9be7-455c-9d8f-44d27d6d8f85', 'a704fc4c-b4c1-461d-912b-e6e30d777605', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '525e9e21-9be7-455c-9d8f-44d27d6d8f85', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1936.0, 1588.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '6705f477-b22e-40ee-88cf-1e154cfc3c2b', 'a704fc4c-b4c1-461d-912b-e6e30d777605', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '6705f477-b22e-40ee-88cf-1e154cfc3c2b', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2420.0, 1985.0, 847.0, 662.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'c4e6c0eb-4ff4-499f-a14e-be0a6c4e1b81', 'a704fc4c-b4c1-461d-912b-e6e30d777605', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'c4e6c0eb-4ff4-499f-a14e-be0a6c4e1b81', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2904.0, 2382.0, 762.0, 596.0
);


-- --------------------------------------------------------------------
-- فندق: فندق أبراج لو ميريديان مكة المكرمة (MAK-HTL-0034)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '83453a65-e6c3-4c50-aa94-f6f79246e182', 'MAK-HTL-0034', 'فندق أبراج لو ميريديان مكة المكرمة', 'فندق أبراج لو ميريديان مكة المكرمة', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.424887000000002, 39.827806, 'https://www.google.com/maps/search/?api=1&query=21.424887000000002,39.827806', 371, 'central_walking', TRUE,
    5, '+966 12 5678 2054', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/630021253.webp?k=c30cafa770dc1a22153c3169726ae4bfc40feaae3388b61be5c441a6ef09a2be&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 2.2 كلم من المركز وبتقييم نزلاء حقيقي 8.5/10 بناء على 4,966 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('83453a65-e6c3-4c50-aa94-f6f79246e182', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/630021253.webp?k=c30cafa770dc1a22153c3169726ae4bfc40feaae3388b61be5c441a6ef09a2be&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('83453a65-e6c3-4c50-aa94-f6f79246e182', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('83453a65-e6c3-4c50-aa94-f6f79246e182', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'f75806de-9e2d-47e2-bb1e-f434ed5b0ebb', '83453a65-e6c3-4c50-aa94-f6f79246e182', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'f75806de-9e2d-47e2-bb1e-f434ed5b0ebb', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    506.0, 415.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '1eaea24f-7d65-4fb0-a107-6d69b39df2f9', '83453a65-e6c3-4c50-aa94-f6f79246e182', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '1eaea24f-7d65-4fb0-a107-6d69b39df2f9', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    632.0, 519.0, 221.0, 173.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '39fbef8e-6a75-4ca4-9f85-fe53b9e161f5', '83453a65-e6c3-4c50-aa94-f6f79246e182', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '39fbef8e-6a75-4ca4-9f85-fe53b9e161f5', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    759.0, 622.0, 199.0, 156.0
);


-- --------------------------------------------------------------------
-- فندق: فندق هيلتون المؤتمرات جبل عمر مكة (MAK-HTL-0035)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'ead114e8-6151-4f79-8245-865553269bda', 'MAK-HTL-0035', 'فندق هيلتون المؤتمرات جبل عمر مكة', 'فندق هيلتون المؤتمرات جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.4191, 39.819399999999995, 'https://www.google.com/maps/search/?api=1&query=21.4191,39.819399999999995', 943, 'central_outer', TRUE,
    5, '+966 12 5695 2085', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742485.webp?k=78647839b7455b7b317018115ad1eceb41e258da1f5c79fc26fb91dc036fa13e&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 8.5/10 بناء على 12,478 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('ead114e8-6151-4f79-8245-865553269bda', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742485.webp?k=78647839b7455b7b317018115ad1eceb41e258da1f5c79fc26fb91dc036fa13e&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('ead114e8-6151-4f79-8245-865553269bda', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('ead114e8-6151-4f79-8245-865553269bda', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'e19d22bc-f292-4c68-adec-3b929c9555e4', 'ead114e8-6151-4f79-8245-865553269bda', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'e19d22bc-f292-4c68-adec-3b929c9555e4', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1602.0, 1314.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'cbc49d55-2727-4d50-909b-d3f05a515667', 'ead114e8-6151-4f79-8245-865553269bda', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'cbc49d55-2727-4d50-909b-d3f05a515667', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2002.0, 1642.0, 701.0, 548.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '5a2df766-689b-4e56-9f3c-88d5c30ca33e', 'ead114e8-6151-4f79-8245-865553269bda', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '5a2df766-689b-4e56-9f3c-88d5c30ca33e', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2403.0, 1971.0, 631.0, 493.0
);


-- --------------------------------------------------------------------
-- فندق: فندق لو مريديان مكة المكرمة (MAK-HTL-0036)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '0c2d1683-bdb9-43a2-9909-002b9bf898d4', 'MAK-HTL-0036', 'فندق لو مريديان مكة المكرمة', 'فندق لو مريديان مكة المكرمة', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.420887, 39.825406, 'https://www.google.com/maps/search/?api=1&query=21.420887,39.825406', 232, 'central_walking', TRUE,
    5, '+966 12 5712 2116', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/630017052.webp?k=00a2d4d80f8cfe5e7401db1ad6ff023682aec0656542960bb1f3c98a68a4e8b9&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 400 متر من المركز وبتقييم نزلاء حقيقي 8.6/10 بناء على 3,545 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('0c2d1683-bdb9-43a2-9909-002b9bf898d4', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/630017052.webp?k=00a2d4d80f8cfe5e7401db1ad6ff023682aec0656542960bb1f3c98a68a4e8b9&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('0c2d1683-bdb9-43a2-9909-002b9bf898d4', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('0c2d1683-bdb9-43a2-9909-002b9bf898d4', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '5c8090c1-f661-42cb-9252-2a46255f05a7', '0c2d1683-bdb9-43a2-9909-002b9bf898d4', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '5c8090c1-f661-42cb-9252-2a46255f05a7', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1497.0, 1228.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '30404af4-6896-403c-9a5c-b2f75fa97f50', '0c2d1683-bdb9-43a2-9909-002b9bf898d4', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '30404af4-6896-403c-9a5c-b2f75fa97f50', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1871.0, 1535.0, 655.0, 512.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'd05b4195-8ec7-46e1-9683-647db69bb6a3', '0c2d1683-bdb9-43a2-9909-002b9bf898d4', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'd05b4195-8ec7-46e1-9683-647db69bb6a3', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2246.0, 1842.0, 589.0, 460.0
);


-- --------------------------------------------------------------------
-- فندق: هيلتون الأجنحة جبل عمر مكة (MAK-HTL-0037)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '0f5c130a-c4b7-4fcc-994b-6db5434eb271', 'MAK-HTL-0037', 'هيلتون الأجنحة جبل عمر مكة', 'هيلتون الأجنحة جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.4207, 39.821, 'https://www.google.com/maps/search/?api=1&query=21.4207,39.821', 678, 'central_outer', TRUE,
    5, '+966 12 5729 2147', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742572.webp?k=26cc8aca851cb6d20e4b055d189f063473ae9bdf00334a4ad31bdf89fab12102&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 500 متر من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 6,689 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('0f5c130a-c4b7-4fcc-994b-6db5434eb271', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742572.webp?k=26cc8aca851cb6d20e4b055d189f063473ae9bdf00334a4ad31bdf89fab12102&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('0f5c130a-c4b7-4fcc-994b-6db5434eb271', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('0f5c130a-c4b7-4fcc-994b-6db5434eb271', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '73dbb6fa-bf7b-4368-97f3-2d08772d453a', '0f5c130a-c4b7-4fcc-994b-6db5434eb271', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '73dbb6fa-bf7b-4368-97f3-2d08772d453a', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2009.0, 1647.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '0dc10ba1-888a-4dc6-b939-cec2f11d0c5d', '0f5c130a-c4b7-4fcc-994b-6db5434eb271', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '0dc10ba1-888a-4dc6-b939-cec2f11d0c5d', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2511.0, 2059.0, 879.0, 686.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '80275eab-c041-455e-b23b-2d74be5987e5', '0f5c130a-c4b7-4fcc-994b-6db5434eb271', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '80275eab-c041-455e-b23b-2d74be5987e5', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3014.0, 2470.0, 791.0, 618.0
);


-- --------------------------------------------------------------------
-- فندق: Emaar Elite Makkah Hotel (MAK-EMA-0038)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '7e4059ae-d6ea-4869-95c6-a758cc207b3f', 'MAK-EMA-0038', 'Emaar Elite Makkah Hotel', 'Emaar Elite Makkah Hotel', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.422487, 39.827006, 'https://www.google.com/maps/search/?api=1&query=21.422487,39.827006', 98, 'central_first_row', TRUE,
    5, '+966 12 5746 2178', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/573196335.webp?k=ebde2e2888246bb1fb2d0e10969f10f8a4ee36bdb6ab0463d1e146caf08e6e48&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 1.5 كلم من المركز وبتقييم نزلاء حقيقي 8.2/10 بناء على 3,552 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('7e4059ae-d6ea-4869-95c6-a758cc207b3f', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/573196335.webp?k=ebde2e2888246bb1fb2d0e10969f10f8a4ee36bdb6ab0463d1e146caf08e6e48&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('7e4059ae-d6ea-4869-95c6-a758cc207b3f', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('7e4059ae-d6ea-4869-95c6-a758cc207b3f', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'aed5900d-54cb-4aca-b0dd-e4837d0534cf', '7e4059ae-d6ea-4869-95c6-a758cc207b3f', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'aed5900d-54cb-4aca-b0dd-e4837d0534cf', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    363.0, 298.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'beb5cd69-737d-48f1-a5cf-e04ada93dada', '7e4059ae-d6ea-4869-95c6-a758cc207b3f', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'beb5cd69-737d-48f1-a5cf-e04ada93dada', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    454.0, 372.0, 159.0, 124.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '55e2ca51-8d2c-40c3-91e9-24e0c8453211', '7e4059ae-d6ea-4869-95c6-a758cc207b3f', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '55e2ca51-8d2c-40c3-91e9-24e0c8453211', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    544.0, 447.0, 143.0, 112.0
);


-- --------------------------------------------------------------------
-- فندق: Royal Almashaer (MAK-ROY-0039)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '0ab307b2-e49b-4669-ab29-3b099a680afc', 'MAK-ROY-0039', 'Royal Almashaer', 'Royal Almashaer', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.423287000000002, 39.827806, 'https://www.google.com/maps/search/?api=1&query=21.423287000000002,39.827806', 222, 'central_walking', TRUE,
    4, '+966 12 5763 2209', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/480645771.webp?k=6e048995b17939ebba5584554389e8ee09ca20a280c575e40736d8d872b1815a&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 6.3 كلم من المركز وبتقييم نزلاء حقيقي 7.3/10 بناء على 97 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('0ab307b2-e49b-4669-ab29-3b099a680afc', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/480645771.webp?k=6e048995b17939ebba5584554389e8ee09ca20a280c575e40736d8d872b1815a&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('0ab307b2-e49b-4669-ab29-3b099a680afc', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('0ab307b2-e49b-4669-ab29-3b099a680afc', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'cf955762-d484-4469-8c42-931a30e74324', '0ab307b2-e49b-4669-ab29-3b099a680afc', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'cf955762-d484-4469-8c42-931a30e74324', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    450.0, 369.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '9b8e6b09-18bb-4f28-bccf-dd4bbfefd40e', '0ab307b2-e49b-4669-ab29-3b099a680afc', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '9b8e6b09-18bb-4f28-bccf-dd4bbfefd40e', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    562.0, 461.0, 197.0, 154.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '51c7b0c4-1d56-4cd0-b3a0-031b88283450', '0ab307b2-e49b-4669-ab29-3b099a680afc', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '51c7b0c4-1d56-4cd0-b3a0-031b88283450', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    675.0, 554.0, 177.0, 138.0
);


-- --------------------------------------------------------------------
-- فندق: فور بوينتس باي شيراتون مكة المكرمة النسيم (MAK-HTL-0040)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '66d10903-8440-4aa4-9469-f0ca83992370', 'MAK-HTL-0040', 'فور بوينتس باي شيراتون مكة المكرمة النسيم', 'فور بوينتس باي شيراتون مكة المكرمة النسيم', 'makkah', 'النسيم', 'حي النسيم، مكة المكرمة',
    21.3936, 39.880399999999995, 'https://www.google.com/maps/search/?api=1&query=21.3936,39.880399999999995', 7628, 'shuttle_bus', FALSE,
    5, '+966 12 5780 2240', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/628113158.webp?k=441a72d2d5f85751aff1932efe4940478614101ca3d745272c82647400a15a53&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي النسيم. يتميز بـ 6.8 كلم من المركز وبتقييم نزلاء حقيقي 8.1/10 بناء على 10,188 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('66d10903-8440-4aa4-9469-f0ca83992370', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/628113158.webp?k=441a72d2d5f85751aff1932efe4940478614101ca3d745272c82647400a15a53&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('66d10903-8440-4aa4-9469-f0ca83992370', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('66d10903-8440-4aa4-9469-f0ca83992370', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'c754cb0e-a1c8-4319-9e0f-dc774c148eb9', '66d10903-8440-4aa4-9469-f0ca83992370', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'c754cb0e-a1c8-4319-9e0f-dc774c148eb9', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    371.0, 304.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '73b39a47-a3c7-4697-a323-1dd79606ec85', '66d10903-8440-4aa4-9469-f0ca83992370', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '73b39a47-a3c7-4697-a323-1dd79606ec85', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    464.0, 380.0, 162.0, 127.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'fe842834-1b1c-444f-a3fe-3b2099fb3f3f', '66d10903-8440-4aa4-9469-f0ca83992370', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'fe842834-1b1c-444f-a3fe-3b2099fb3f3f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    556.0, 456.0, 146.0, 114.0
);


-- --------------------------------------------------------------------
-- فندق: Al Shohada by Palm Rich Makkah (MAK-SHO-0041)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '2385bfd2-08c3-4420-a70c-67dd045ebf23', 'MAK-SHO-0041', 'Al Shohada by Palm Rich Makkah', 'Al Shohada by Palm Rich Makkah', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.424887000000002, 39.825406, 'https://www.google.com/maps/search/?api=1&query=21.424887000000002,39.825406', 330, 'central_walking', TRUE,
    5, '+966 12 5797 2271', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/889507953.webp?k=6aa43f8715e9e1aeb1a4315988d49279e061e4b6b36115d973d333bfbf6d24fd&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 0.9 كلم من المركز وبتقييم نزلاء حقيقي 8.6/10 بناء على 4,073 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2385bfd2-08c3-4420-a70c-67dd045ebf23', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/889507953.webp?k=6aa43f8715e9e1aeb1a4315988d49279e061e4b6b36115d973d333bfbf6d24fd&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2385bfd2-08c3-4420-a70c-67dd045ebf23', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2385bfd2-08c3-4420-a70c-67dd045ebf23', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '6f09cfd8-ad77-406f-b8b1-f5cb87ae046f', '2385bfd2-08c3-4420-a70c-67dd045ebf23', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '6f09cfd8-ad77-406f-b8b1-f5cb87ae046f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1338.0, 1097.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'b21c52d5-c106-467e-8480-387bd793bd25', '2385bfd2-08c3-4420-a70c-67dd045ebf23', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'b21c52d5-c106-467e-8480-387bd793bd25', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1672.0, 1371.0, 585.0, 457.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '58cf5f9b-9b14-414e-a8b6-9c8f08eae4ae', '2385bfd2-08c3-4420-a70c-67dd045ebf23', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '58cf5f9b-9b14-414e-a8b6-9c8f08eae4ae', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2007.0, 1646.0, 527.0, 411.0
);


-- --------------------------------------------------------------------
-- فندق: فندق مكارم أم القرى (MAK-HTL-0042)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'ce077ef9-005f-46e0-bf7c-3070b5ef4f8b', 'MAK-HTL-0042', 'فندق مكارم أم القرى', 'فندق مكارم أم القرى', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.420087, 39.826206, 'https://www.google.com/maps/search/?api=1&query=21.420087,39.826206', 315, 'central_walking', TRUE,
    5, '+966 12 5814 2302', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/882263912.webp?k=920909d9256ccbb5badc3142c46c54634263573451a5d8fe45bd09bb366e766a&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 2.2 كلم من المركز وبتقييم نزلاء حقيقي 8.1/10 بناء على 6,914 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('ce077ef9-005f-46e0-bf7c-3070b5ef4f8b', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/882263912.webp?k=920909d9256ccbb5badc3142c46c54634263573451a5d8fe45bd09bb366e766a&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('ce077ef9-005f-46e0-bf7c-3070b5ef4f8b', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('ce077ef9-005f-46e0-bf7c-3070b5ef4f8b', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'dcff0ae1-d2fd-4e60-bdb0-6cd8b6ce9a23', 'ce077ef9-005f-46e0-bf7c-3070b5ef4f8b', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'dcff0ae1-d2fd-4e60-bdb0-6cd8b6ce9a23', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    324.0, 266.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'cccc4b30-8ae4-46ec-b2f1-ccf304965ddb', 'ce077ef9-005f-46e0-bf7c-3070b5ef4f8b', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'cccc4b30-8ae4-46ec-b2f1-ccf304965ddb', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    405.0, 332.0, 142.0, 111.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'e12348d4-94d7-4965-8f72-b30160a691bd', 'ce077ef9-005f-46e0-bf7c-3070b5ef4f8b', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'e12348d4-94d7-4965-8f72-b30160a691bd', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    486.0, 399.0, 128.0, 100.0
);


-- --------------------------------------------------------------------
-- فندق: فندق بونسيانا مكة - Poinciana Hotel Makkah (MAK-POI-0043)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '4dd1d6a3-6599-48f1-968b-225c75f4090e', 'MAK-POI-0043', 'فندق بونسيانا مكة - Poinciana Hotel Makkah', 'فندق بونسيانا مكة - Poinciana Hotel Makkah', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.420887, 39.827006, 'https://www.google.com/maps/search/?api=1&query=21.420887,39.827006', 232, 'central_walking', TRUE,
    4, '+966 12 5831 2333', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/804023844.webp?k=afee15ba294117b83fb779cf1dafaac1a1b498a9a3a646a783629bbc1e1607ba&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 1.3 كلم من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 614 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('4dd1d6a3-6599-48f1-968b-225c75f4090e', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/804023844.webp?k=afee15ba294117b83fb779cf1dafaac1a1b498a9a3a646a783629bbc1e1607ba&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('4dd1d6a3-6599-48f1-968b-225c75f4090e', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('4dd1d6a3-6599-48f1-968b-225c75f4090e', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '3f45f8fb-492c-4dc7-81ff-05f721e2ff75', '4dd1d6a3-6599-48f1-968b-225c75f4090e', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '3f45f8fb-492c-4dc7-81ff-05f721e2ff75', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    634.0, 520.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '52cb6d53-ee70-4178-a292-a2b494147d14', '4dd1d6a3-6599-48f1-968b-225c75f4090e', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '52cb6d53-ee70-4178-a292-a2b494147d14', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    792.0, 650.0, 277.0, 217.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'ae536930-dd7f-4d2d-b1d1-0be72cc14f54', '4dd1d6a3-6599-48f1-968b-225c75f4090e', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'ae536930-dd7f-4d2d-b1d1-0be72cc14f54', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    951.0, 780.0, 250.0, 195.0
);


-- --------------------------------------------------------------------
-- فندق: فندق ضيوف المقام واحد توصيل مجاني للحرم - Douof Al Maqam One Hotel Free Shuttle Service (MAK-DOU-0044)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'f282497f-429c-4f69-859a-111097341e73', 'MAK-DOU-0044', 'فندق ضيوف المقام واحد توصيل مجاني للحرم - Douof Al Maqam One Hotel Free Shuttle Service', 'فندق ضيوف المقام واحد توصيل مجاني للحرم - Douof Al Maqam One Hotel Free Shuttle Service', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.421687, 39.827806, 'https://www.google.com/maps/search/?api=1&query=21.421687,39.827806', 222, 'central_walking', TRUE,
    4, '+966 12 5848 2364', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/674225991.webp?k=799e1aa8ec893a17904d011499c1bf24e0f2978529f894d1364cdf5a346ed4b8&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 2.4 كلم من المركز وبتقييم نزلاء حقيقي 7.8/10 بناء على 1,307 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f282497f-429c-4f69-859a-111097341e73', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/674225991.webp?k=799e1aa8ec893a17904d011499c1bf24e0f2978529f894d1364cdf5a346ed4b8&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f282497f-429c-4f69-859a-111097341e73', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f282497f-429c-4f69-859a-111097341e73', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '503b1fdd-c919-4688-a7e6-7e8ee72e490b', 'f282497f-429c-4f69-859a-111097341e73', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '503b1fdd-c919-4688-a7e6-7e8ee72e490b', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    450.0, 369.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '1b94c442-a59c-435e-9f4d-26d741fc701d', 'f282497f-429c-4f69-859a-111097341e73', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '1b94c442-a59c-435e-9f4d-26d741fc701d', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    562.0, 461.0, 197.0, 154.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '3968d3bb-5c8f-4129-b4eb-49c64d80c540', 'f282497f-429c-4f69-859a-111097341e73', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '3968d3bb-5c8f-4129-b4eb-49c64d80c540', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    675.0, 554.0, 177.0, 138.0
);


-- --------------------------------------------------------------------
-- فندق: فندق مكارم أجياد مكة (MAK-HTL-0045)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '0d14cb36-0ffa-4fa7-ade5-149c73fec783', 'MAK-HTL-0045', 'فندق مكارم أجياد مكة', 'فندق مكارم أجياد مكة', 'makkah', 'أجياد', 'حي أجياد، مكة المكرمة',
    21.4185, 39.825399999999995, 'https://www.google.com/maps/search/?api=1&query=21.4185,39.825399999999995', 532, 'central_outer', TRUE,
    5, '+966 12 5865 2395', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/921116724.webp?k=cb9b93c1a93c82b012bf527894eb376262b03252d5c1179b5fbefb83d2dd17e2&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي أجياد. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 8.5/10 بناء على 7,408 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('0d14cb36-0ffa-4fa7-ade5-149c73fec783', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/921116724.webp?k=cb9b93c1a93c82b012bf527894eb376262b03252d5c1179b5fbefb83d2dd17e2&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('0d14cb36-0ffa-4fa7-ade5-149c73fec783', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('0d14cb36-0ffa-4fa7-ade5-149c73fec783', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'c86b7926-cbe0-44d6-acae-7f1133a9d130', '0d14cb36-0ffa-4fa7-ade5-149c73fec783', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'c86b7926-cbe0-44d6-acae-7f1133a9d130', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1627.0, 1334.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '8c814e74-6f1f-42f6-8f9e-3af9c580823b', '0d14cb36-0ffa-4fa7-ade5-149c73fec783', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '8c814e74-6f1f-42f6-8f9e-3af9c580823b', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2034.0, 1668.0, 712.0, 556.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'c71168ea-6bfd-4140-9569-d0fa3b29374c', '0d14cb36-0ffa-4fa7-ade5-149c73fec783', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'c71168ea-6bfd-4140-9569-d0fa3b29374c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2440.0, 2001.0, 641.0, 500.0
);


-- --------------------------------------------------------------------
-- فندق: إيبيس ستايلز مكة (MAK-HTL-0046)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '0d19223c-26ce-484d-ae74-f9aa646dbb8f', 'MAK-HTL-0046', 'إيبيس ستايلز مكة', 'إيبيس ستايلز مكة', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.423287000000002, 39.825406, 'https://www.google.com/maps/search/?api=1&query=21.423287000000002,39.825406', 143, 'central_first_row', TRUE,
    4, '+966 12 5882 2426', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/914585345.webp?k=4c1b793cd32e333df43ecccafd43425fa9a792acae475fbe3d080e694f06145c&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 3 كلم من المركز وبتقييم نزلاء حقيقي 8.0/10 بناء على 9,180 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('0d19223c-26ce-484d-ae74-f9aa646dbb8f', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/914585345.webp?k=4c1b793cd32e333df43ecccafd43425fa9a792acae475fbe3d080e694f06145c&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('0d19223c-26ce-484d-ae74-f9aa646dbb8f', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('0d19223c-26ce-484d-ae74-f9aa646dbb8f', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'd81a59e7-08f4-4341-8bba-4581e2b8de0d', '0d19223c-26ce-484d-ae74-f9aa646dbb8f', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'd81a59e7-08f4-4341-8bba-4581e2b8de0d', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    450.0, 369.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '9dc0ad9e-7460-4dae-b654-26f48a9a29b9', '0d19223c-26ce-484d-ae74-f9aa646dbb8f', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '9dc0ad9e-7460-4dae-b654-26f48a9a29b9', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    562.0, 461.0, 197.0, 154.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '73b6ebc5-d1b9-43e0-a612-bb5d7421d651', '0d19223c-26ce-484d-ae74-f9aa646dbb8f', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '73b6ebc5-d1b9-43e0-a612-bb5d7421d651', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    675.0, 554.0, 177.0, 138.0
);


-- --------------------------------------------------------------------
-- فندق: كونراد جبل عمر مكة (MAK-HTL-0047)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '02ada23e-49b9-480a-bf36-d91ccc172a20', 'MAK-HTL-0047', 'كونراد جبل عمر مكة', 'كونراد جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.4231, 39.821, 'https://www.google.com/maps/search/?api=1&query=21.4231,39.821', 641, 'central_outer', TRUE,
    5, '+966 12 5899 2457', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/928063101.webp?k=4e2b273352bbc2f7827c409b9abff6b3efb8ed788d804955e3ae1bae2d7320e5&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 5,711 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('02ada23e-49b9-480a-bf36-d91ccc172a20', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/928063101.webp?k=4e2b273352bbc2f7827c409b9abff6b3efb8ed788d804955e3ae1bae2d7320e5&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('02ada23e-49b9-480a-bf36-d91ccc172a20', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('02ada23e-49b9-480a-bf36-d91ccc172a20', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '0dab2a41-0064-4bb0-8b9b-7495182e5d2c', '02ada23e-49b9-480a-bf36-d91ccc172a20', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '0dab2a41-0064-4bb0-8b9b-7495182e5d2c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2104.0, 1725.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '76f5cfdb-f538-4a01-a7b8-a65c22af6bb2', '02ada23e-49b9-480a-bf36-d91ccc172a20', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '76f5cfdb-f538-4a01-a7b8-a65c22af6bb2', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2630.0, 2156.0, 920.0, 719.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '8eb268ad-7da2-4b93-8c5a-4db87c12d473', '02ada23e-49b9-480a-bf36-d91ccc172a20', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '8eb268ad-7da2-4b93-8c5a-4db87c12d473', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3156.0, 2588.0, 828.0, 647.0
);


-- --------------------------------------------------------------------
-- فندق: سويس أوتيل مكة (MAK-HTL-0048)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '324fa10c-87a1-4bb3-8743-6c2d62814d14', 'MAK-HTL-0048', 'سويس أوتيل مكة', 'سويس أوتيل مكة', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.424887000000002, 39.827006, 'https://www.google.com/maps/search/?api=1&query=21.424887000000002,39.827006', 330, 'central_walking', TRUE,
    5, '+966 12 5916 2488', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/820913168.webp?k=25998b04cf075df87e042db5fd946c142647b13b6abb6ab39c4982f21da74843&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 300 متر من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 22,719 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('324fa10c-87a1-4bb3-8743-6c2d62814d14', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/820913168.webp?k=25998b04cf075df87e042db5fd946c142647b13b6abb6ab39c4982f21da74843&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('324fa10c-87a1-4bb3-8743-6c2d62814d14', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('324fa10c-87a1-4bb3-8743-6c2d62814d14', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'a28545b7-70b7-4f26-b9ff-1395ece376b0', '324fa10c-87a1-4bb3-8743-6c2d62814d14', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'a28545b7-70b7-4f26-b9ff-1395ece376b0', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2102.0, 1724.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'afc19e18-966f-474f-915f-42e1b174cbc7', '324fa10c-87a1-4bb3-8743-6c2d62814d14', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'afc19e18-966f-474f-915f-42e1b174cbc7', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2628.0, 2155.0, 920.0, 718.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '11094b49-b7d5-4151-8d9c-26ba5182a385', '324fa10c-87a1-4bb3-8743-6c2d62814d14', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '11094b49-b7d5-4151-8d9c-26ba5182a385', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3153.0, 2586.0, 828.0, 646.0
);


-- --------------------------------------------------------------------
-- فندق: فندق إعمار جراند (MAK-HTL-0049)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '6e2c344c-c16c-4f4b-834b-8d06ee7269da', 'MAK-HTL-0049', 'فندق إعمار جراند', 'فندق إعمار جراند', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.420087, 39.827806, 'https://www.google.com/maps/search/?api=1&query=21.420087,39.827806', 371, 'central_walking', TRUE,
    5, '+966 12 5933 2519', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/520998885.webp?k=a14b6a46aa2d9fd1ccaf612dcbfdc81a53a4c388a91bb51882df23abc73ea40f&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 1.1 كلم من المركز وبتقييم نزلاء حقيقي 8.0/10 بناء على 5,098 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('6e2c344c-c16c-4f4b-834b-8d06ee7269da', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/520998885.webp?k=a14b6a46aa2d9fd1ccaf612dcbfdc81a53a4c388a91bb51882df23abc73ea40f&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('6e2c344c-c16c-4f4b-834b-8d06ee7269da', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('6e2c344c-c16c-4f4b-834b-8d06ee7269da', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '51957c39-bae3-4df0-9858-f4cad8e91d57', '6e2c344c-c16c-4f4b-834b-8d06ee7269da', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '51957c39-bae3-4df0-9858-f4cad8e91d57', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    909.0, 745.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'c1d56376-9f96-4b52-ae70-f3a991049a6a', '6e2c344c-c16c-4f4b-834b-8d06ee7269da', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'c1d56376-9f96-4b52-ae70-f3a991049a6a', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1136.0, 931.0, 398.0, 310.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '5bd9d2a0-7170-4aea-981c-2b7f30707d16', '6e2c344c-c16c-4f4b-834b-8d06ee7269da', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '5bd9d2a0-7170-4aea-981c-2b7f30707d16', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1364.0, 1118.0, 358.0, 279.0
);


-- --------------------------------------------------------------------
-- فندق: DoubleTree by Hilton Makkah Aziziyah (MAK-DOU-0050)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '04cfff61-dc8f-4c40-bb04-0518e62533e9', 'MAK-DOU-0050', 'DoubleTree by Hilton Makkah Aziziyah', 'DoubleTree by Hilton Makkah Aziziyah', 'makkah', 'الشبيكة', 'حي المنطقة المركزية، مكة المكرمة',
    21.420887, 39.824605999999996, 'https://www.google.com/maps/search/?api=1&query=21.420887,39.824605999999996', 287, 'central_walking', TRUE,
    5, '+966 12 5950 2550', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/830088943.webp?k=e6b81acf6adb2ca6a1d4a0617f857d693a79eb21e4f3d7d11fd49f36e4115ed7&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 5.4 كلم من المركز وبتقييم نزلاء حقيقي 8.7/10 بناء على 5,775 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('04cfff61-dc8f-4c40-bb04-0518e62533e9', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/830088943.webp?k=e6b81acf6adb2ca6a1d4a0617f857d693a79eb21e4f3d7d11fd49f36e4115ed7&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('04cfff61-dc8f-4c40-bb04-0518e62533e9', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('04cfff61-dc8f-4c40-bb04-0518e62533e9', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'cb00848e-e395-45d7-9a93-064164dc0445', '04cfff61-dc8f-4c40-bb04-0518e62533e9', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'cb00848e-e395-45d7-9a93-064164dc0445', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    364.0, 298.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '9d0f4be9-0c72-4a2f-b4c7-2349feb1f00a', '04cfff61-dc8f-4c40-bb04-0518e62533e9', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '9d0f4be9-0c72-4a2f-b4c7-2349feb1f00a', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    455.0, 372.0, 159.0, 124.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '8791d8d6-8664-48f8-b988-73e00bd23c09', '04cfff61-dc8f-4c40-bb04-0518e62533e9', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '8791d8d6-8664-48f8-b988-73e00bd23c09', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    546.0, 447.0, 143.0, 112.0
);


-- --------------------------------------------------------------------
-- فندق: Rowaa Lindy Hotel Makkah (MAK-ROW-0051)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '5408a53b-783b-4232-9f95-8bb85acf75ac', 'MAK-ROW-0051', 'Rowaa Lindy Hotel Makkah', 'Rowaa Lindy Hotel Makkah', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.421687, 39.825406, 'https://www.google.com/maps/search/?api=1&query=21.421687,39.825406', 143, 'central_first_row', TRUE,
    4, '+966 12 5967 2581', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/825494409.webp?k=a5d27bc7ddf298c2ffac3983ede687fe0d28137db2850e2bafde172bd23f8509&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 5.3 كلم من المركز وبتقييم نزلاء حقيقي 7.8/10 بناء على 108 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5408a53b-783b-4232-9f95-8bb85acf75ac', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/825494409.webp?k=a5d27bc7ddf298c2ffac3983ede687fe0d28137db2850e2bafde172bd23f8509&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5408a53b-783b-4232-9f95-8bb85acf75ac', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5408a53b-783b-4232-9f95-8bb85acf75ac', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '9cf3b101-cf1e-4b2b-9d60-72cc1102c19c', '5408a53b-783b-4232-9f95-8bb85acf75ac', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '9cf3b101-cf1e-4b2b-9d60-72cc1102c19c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    450.0, 369.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '89472184-5f88-4eea-aa44-183bcce3a45b', '5408a53b-783b-4232-9f95-8bb85acf75ac', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '89472184-5f88-4eea-aa44-183bcce3a45b', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    562.0, 461.0, 197.0, 154.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '2cd6c87b-5b7b-4467-954f-2f8a25738c99', '5408a53b-783b-4232-9f95-8bb85acf75ac', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '2cd6c87b-5b7b-4467-954f-2f8a25738c99', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    675.0, 554.0, 177.0, 138.0
);


-- --------------------------------------------------------------------
-- فندق: voco Makkah by IHG (MAK-VOC-0052)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'e2af55d2-c3fc-456f-8975-e7be2a40101d', 'MAK-VOC-0052', 'voco Makkah by IHG', 'voco Makkah by IHG', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.422487, 39.826206, 'https://www.google.com/maps/search/?api=1&query=21.422487,39.826206', 0, 'central_first_row', TRUE,
    5, '+966 12 5984 2612', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/427975173.webp?k=c085e75bd694945f26e0dfb54b13550a0342915f82e7e7ae6f599cbed9f0a68e&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 1.8 كلم من المركز وبتقييم نزلاء حقيقي 8.7/10 بناء على 16,923 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e2af55d2-c3fc-456f-8975-e7be2a40101d', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/427975173.webp?k=c085e75bd694945f26e0dfb54b13550a0342915f82e7e7ae6f599cbed9f0a68e&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e2af55d2-c3fc-456f-8975-e7be2a40101d', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e2af55d2-c3fc-456f-8975-e7be2a40101d', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'b465c7f3-983e-40d7-b789-808eb1c18c07', 'e2af55d2-c3fc-456f-8975-e7be2a40101d', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'b465c7f3-983e-40d7-b789-808eb1c18c07', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    394.0, 323.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'd3d918a7-3954-4607-bc75-9480c77f18e6', 'e2af55d2-c3fc-456f-8975-e7be2a40101d', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'd3d918a7-3954-4607-bc75-9480c77f18e6', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    492.0, 404.0, 172.0, 135.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '93f67049-1874-4198-8d54-6882e94c22ef', 'e2af55d2-c3fc-456f-8975-e7be2a40101d', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '93f67049-1874-4198-8d54-6882e94c22ef', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    591.0, 484.0, 155.0, 121.0
);


-- --------------------------------------------------------------------
-- فندق: العنوان جبل عمر مكة (MAK-HTL-0053)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '4b8dfc14-ac4c-4688-8ba5-7c4865c93e4f', 'MAK-HTL-0053', 'العنوان جبل عمر مكة', 'العنوان جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.422300000000003, 39.821799999999996, 'https://www.google.com/maps/search/?api=1&query=21.422300000000003,39.821799999999996', 539, 'central_outer', TRUE,
    5, '+966 12 5102 2643', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/536428550.webp?k=b67de61b70a83bd973e267adc7689cbf26b9abfc16bc5f11c933d65a21c38d19&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.7 كلم من المركز وبتقييم نزلاء حقيقي 8.6/10 بناء على 20,424 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('4b8dfc14-ac4c-4688-8ba5-7c4865c93e4f', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/536428550.webp?k=b67de61b70a83bd973e267adc7689cbf26b9abfc16bc5f11c933d65a21c38d19&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('4b8dfc14-ac4c-4688-8ba5-7c4865c93e4f', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('4b8dfc14-ac4c-4688-8ba5-7c4865c93e4f', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '3e05f939-836e-479e-8b58-4ea1b6bc30ce', '4b8dfc14-ac4c-4688-8ba5-7c4865c93e4f', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '3e05f939-836e-479e-8b58-4ea1b6bc30ce', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1538.0, 1261.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '200d97d6-91f4-4bf1-9634-68ffcb45972f', '4b8dfc14-ac4c-4688-8ba5-7c4865c93e4f', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '200d97d6-91f4-4bf1-9634-68ffcb45972f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1922.0, 1576.0, 673.0, 525.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '172fe488-efad-455d-8aeb-7facf7621f95', '4b8dfc14-ac4c-4688-8ba5-7c4865c93e4f', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '172fe488-efad-455d-8aeb-7facf7621f95', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2307.0, 1892.0, 606.0, 473.0
);


-- --------------------------------------------------------------------
-- فندق: جبل عمر حياة ريجنسي مكة (MAK-HTL-0054)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '749febcb-3b7c-4e74-a93a-c21d4f5a0a83', 'MAK-HTL-0054', 'جبل عمر حياة ريجنسي مكة', 'جبل عمر حياة ريجنسي مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.4231, 39.8226, 'https://www.google.com/maps/search/?api=1&query=21.4231,39.8226', 448, 'central_walking', TRUE,
    5, '+966 12 5119 2674', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/892021583.webp?k=b8a646d0005d0b6e6ae136c9e7375eb36b562ff5bef3f71f8ce123fab67690df&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 450 متر من المركز وبتقييم نزلاء حقيقي 8.8/10 بناء على 21,384 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('749febcb-3b7c-4e74-a93a-c21d4f5a0a83', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/892021583.webp?k=b8a646d0005d0b6e6ae136c9e7375eb36b562ff5bef3f71f8ce123fab67690df&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('749febcb-3b7c-4e74-a93a-c21d4f5a0a83', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('749febcb-3b7c-4e74-a93a-c21d4f5a0a83', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '909c4c5a-853a-40b1-9a18-c0bc66a9ec27', '749febcb-3b7c-4e74-a93a-c21d4f5a0a83', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '909c4c5a-853a-40b1-9a18-c0bc66a9ec27', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1743.0, 1429.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '726bc1b3-a4ff-4c5c-bc34-307071ed6120', '749febcb-3b7c-4e74-a93a-c21d4f5a0a83', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '726bc1b3-a4ff-4c5c-bc34-307071ed6120', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2179.0, 1786.0, 763.0, 595.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '0c06d506-cf0f-4a06-b53e-3293ea9cce43', '749febcb-3b7c-4e74-a93a-c21d4f5a0a83', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '0c06d506-cf0f-4a06-b53e-3293ea9cce43', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2614.0, 2144.0, 686.0, 536.0
);


-- --------------------------------------------------------------------
-- فندق: Rotana Jabal Omar Makkah (MAK-ROT-0055)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'db88e5d7-cee8-4cfa-ba77-68128ff9ef87', 'MAK-ROT-0055', 'Rotana Jabal Omar Makkah', 'Rotana Jabal Omar Makkah', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.424887000000002, 39.824605999999996, 'https://www.google.com/maps/search/?api=1&query=21.424887000000002,39.824605999999996', 371, 'central_walking', TRUE,
    5, '+966 12 5136 2705', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/903317076.webp?k=3dd89e628101487c91c960f31d01deecefabc1b37653a481a61c9a8c89a7b36f&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 9.2/10 بناء على 1,725 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('db88e5d7-cee8-4cfa-ba77-68128ff9ef87', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/903317076.webp?k=3dd89e628101487c91c960f31d01deecefabc1b37653a481a61c9a8c89a7b36f&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('db88e5d7-cee8-4cfa-ba77-68128ff9ef87', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('db88e5d7-cee8-4cfa-ba77-68128ff9ef87', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '9f574b97-784b-4571-91cf-3f7a39df383a', 'db88e5d7-cee8-4cfa-ba77-68128ff9ef87', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '9f574b97-784b-4571-91cf-3f7a39df383a', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1509.0, 1237.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '6c22e55b-28ff-46a8-9fcd-d0636b2a4ba8', 'db88e5d7-cee8-4cfa-ba77-68128ff9ef87', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '6c22e55b-28ff-46a8-9fcd-d0636b2a4ba8', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1886.0, 1546.0, 660.0, 515.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '7708899a-0998-445f-a057-2bb746382bde', 'db88e5d7-cee8-4cfa-ba77-68128ff9ef87', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '7708899a-0998-445f-a057-2bb746382bde', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2264.0, 1856.0, 594.0, 464.0
);


-- --------------------------------------------------------------------
-- فندق: دبل تري باي هيلتون جبل عمر مكة (MAK-HTL-0056)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '52b29851-86fe-43a1-90e5-434557203294', 'MAK-HTL-0056', 'دبل تري باي هيلتون جبل عمر مكة', 'دبل تري باي هيلتون جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.4191, 39.8202, 'https://www.google.com/maps/search/?api=1&query=21.4191,39.8202', 858, 'central_outer', TRUE,
    5, '+966 12 5153 2736', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742076.webp?k=5a39fcf0033115dd3a6f6750403fee0e744c9ade0fa968c27b698cb343f49658&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.8 كلم من المركز وبتقييم نزلاء حقيقي 8.5/10 بناء على 9,257 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('52b29851-86fe-43a1-90e5-434557203294', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742076.webp?k=5a39fcf0033115dd3a6f6750403fee0e744c9ade0fa968c27b698cb343f49658&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('52b29851-86fe-43a1-90e5-434557203294', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('52b29851-86fe-43a1-90e5-434557203294', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'dc5f916c-655b-470f-a31d-93ad60a11e00', '52b29851-86fe-43a1-90e5-434557203294', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'dc5f916c-655b-470f-a31d-93ad60a11e00', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1411.0, 1157.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '5dad2438-c31b-4a65-8321-134865fbfd85', '52b29851-86fe-43a1-90e5-434557203294', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '5dad2438-c31b-4a65-8321-134865fbfd85', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1764.0, 1446.0, 617.0, 482.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '832a6efb-aba0-4e00-915a-57506c5186a8', '52b29851-86fe-43a1-90e5-434557203294', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '832a6efb-aba0-4e00-915a-57506c5186a8', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2116.0, 1736.0, 556.0, 434.0
);


-- --------------------------------------------------------------------
-- فندق: InterContinental Dar Al Tawhid Makkah by IHG (MAK-INT-0057)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '4e80595f-3c43-4b8c-af65-ef44a65d79a9', 'MAK-INT-0057', 'InterContinental Dar Al Tawhid Makkah by IHG', 'InterContinental Dar Al Tawhid Makkah by IHG', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.420887, 39.826206, 'https://www.google.com/maps/search/?api=1&query=21.420887,39.826206', 210, 'central_walking', TRUE,
    5, '+966 12 5170 2767', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/245762423.webp?k=e03c2a2dba939986cb7fb7b56f203353672fe39c2ae3b5446d7e52dade455506&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 450 متر من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 3,707 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('4e80595f-3c43-4b8c-af65-ef44a65d79a9', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/245762423.webp?k=e03c2a2dba939986cb7fb7b56f203353672fe39c2ae3b5446d7e52dade455506&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('4e80595f-3c43-4b8c-af65-ef44a65d79a9', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('4e80595f-3c43-4b8c-af65-ef44a65d79a9', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '9c257054-9142-4224-9f92-5b2398e45e49', '4e80595f-3c43-4b8c-af65-ef44a65d79a9', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '9c257054-9142-4224-9f92-5b2398e45e49', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2512.0, 2060.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '8d8f7b88-92f7-4acc-8e49-5848182964bc', '4e80595f-3c43-4b8c-af65-ef44a65d79a9', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '8d8f7b88-92f7-4acc-8e49-5848182964bc', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3140.0, 2575.0, 1099.0, 858.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '8d9e5d1e-d98a-4166-a08a-ec3888566275', '4e80595f-3c43-4b8c-af65-ef44a65d79a9', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '8d9e5d1e-d98a-4166-a08a-ec3888566275', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3768.0, 3090.0, 989.0, 772.0
);


-- --------------------------------------------------------------------
-- فندق: جميرا جبل عمر مكة (MAK-HTL-0058)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'eac4bfa4-6a55-4874-a824-fc6636324a48', 'MAK-HTL-0058', 'جميرا جبل عمر مكة', 'جميرا جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.4207, 39.821799999999996, 'https://www.google.com/maps/search/?api=1&query=21.4207,39.821799999999996', 587, 'central_outer', TRUE,
    5, '+966 12 5187 2798', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/511152045.webp?k=c9a5c94d0d7feae42e51b09d09dc6d71535f8c4f58caa462cbf1ea08060eb9d6&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 15,103 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('eac4bfa4-6a55-4874-a824-fc6636324a48', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/511152045.webp?k=c9a5c94d0d7feae42e51b09d09dc6d71535f8c4f58caa462cbf1ea08060eb9d6&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('eac4bfa4-6a55-4874-a824-fc6636324a48', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('eac4bfa4-6a55-4874-a824-fc6636324a48', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '0831334d-7acf-4137-90f3-b2c63c80fee5', 'eac4bfa4-6a55-4874-a824-fc6636324a48', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '0831334d-7acf-4137-90f3-b2c63c80fee5', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1936.0, 1588.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '4a509607-fdf5-445f-be16-b7acc6b2af51', 'eac4bfa4-6a55-4874-a824-fc6636324a48', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '4a509607-fdf5-445f-be16-b7acc6b2af51', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2420.0, 1985.0, 847.0, 662.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'a2449d36-7dff-431f-a8c3-1865e7ad2306', 'eac4bfa4-6a55-4874-a824-fc6636324a48', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'a2449d36-7dff-431f-a8c3-1865e7ad2306', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2904.0, 2382.0, 762.0, 596.0
);


-- --------------------------------------------------------------------
-- فندق: فندق أبراج لو ميريديان مكة المكرمة (MAK-HTL-0059)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '83b6d290-1107-4406-9381-78de632c5ffb', 'MAK-HTL-0059', 'فندق أبراج لو ميريديان مكة المكرمة', 'فندق أبراج لو ميريديان مكة المكرمة', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.422487, 39.827806, 'https://www.google.com/maps/search/?api=1&query=21.422487,39.827806', 195, 'central_walking', TRUE,
    5, '+966 12 5204 2829', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/630021253.webp?k=c30cafa770dc1a22153c3169726ae4bfc40feaae3388b61be5c441a6ef09a2be&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 2.2 كلم من المركز وبتقييم نزلاء حقيقي 8.5/10 بناء على 4,966 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('83b6d290-1107-4406-9381-78de632c5ffb', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/630021253.webp?k=c30cafa770dc1a22153c3169726ae4bfc40feaae3388b61be5c441a6ef09a2be&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('83b6d290-1107-4406-9381-78de632c5ffb', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('83b6d290-1107-4406-9381-78de632c5ffb', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '7da1b866-924b-4486-9f71-fc52cda57b4e', '83b6d290-1107-4406-9381-78de632c5ffb', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '7da1b866-924b-4486-9f71-fc52cda57b4e', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    506.0, 415.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '23aa843e-5a0d-48e8-816a-fade0462866a', '83b6d290-1107-4406-9381-78de632c5ffb', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '23aa843e-5a0d-48e8-816a-fade0462866a', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    632.0, 519.0, 221.0, 173.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'e872478e-68fa-43db-ad41-eb20b0794df5', '83b6d290-1107-4406-9381-78de632c5ffb', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'e872478e-68fa-43db-ad41-eb20b0794df5', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    759.0, 622.0, 199.0, 156.0
);


-- --------------------------------------------------------------------
-- فندق: فندق هيلتون المؤتمرات جبل عمر مكة (MAK-HTL-0060)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'b358f249-aea7-40df-9a2c-677923148668', 'MAK-HTL-0060', 'فندق هيلتون المؤتمرات جبل عمر مكة', 'فندق هيلتون المؤتمرات جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.422300000000003, 39.819399999999995, 'https://www.google.com/maps/search/?api=1&query=21.422300000000003,39.819399999999995', 832, 'central_outer', TRUE,
    5, '+966 12 5221 2860', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742485.webp?k=78647839b7455b7b317018115ad1eceb41e258da1f5c79fc26fb91dc036fa13e&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 8.5/10 بناء على 12,478 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b358f249-aea7-40df-9a2c-677923148668', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742485.webp?k=78647839b7455b7b317018115ad1eceb41e258da1f5c79fc26fb91dc036fa13e&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b358f249-aea7-40df-9a2c-677923148668', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b358f249-aea7-40df-9a2c-677923148668', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '86dd925d-8740-4cc2-9c61-0f651b4077e1', 'b358f249-aea7-40df-9a2c-677923148668', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '86dd925d-8740-4cc2-9c61-0f651b4077e1', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1602.0, 1314.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '931802a1-9560-4104-a29f-e28efb88e76f', 'b358f249-aea7-40df-9a2c-677923148668', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '931802a1-9560-4104-a29f-e28efb88e76f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2002.0, 1642.0, 701.0, 548.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '79535b91-d0b9-4f75-b614-ba2dc8407742', 'b358f249-aea7-40df-9a2c-677923148668', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '79535b91-d0b9-4f75-b614-ba2dc8407742', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2403.0, 1971.0, 631.0, 493.0
);


-- --------------------------------------------------------------------
-- فندق: فندق لو مريديان مكة المكرمة (MAK-HTL-0061)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '36f42563-f895-46d7-9a63-2c7f0207b018', 'MAK-HTL-0061', 'فندق لو مريديان مكة المكرمة', 'فندق لو مريديان مكة المكرمة', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.424087, 39.825406, 'https://www.google.com/maps/search/?api=1&query=21.424087,39.825406', 232, 'central_walking', TRUE,
    5, '+966 12 5238 2891', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/630017052.webp?k=00a2d4d80f8cfe5e7401db1ad6ff023682aec0656542960bb1f3c98a68a4e8b9&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 400 متر من المركز وبتقييم نزلاء حقيقي 8.6/10 بناء على 3,545 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('36f42563-f895-46d7-9a63-2c7f0207b018', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/630017052.webp?k=00a2d4d80f8cfe5e7401db1ad6ff023682aec0656542960bb1f3c98a68a4e8b9&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('36f42563-f895-46d7-9a63-2c7f0207b018', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('36f42563-f895-46d7-9a63-2c7f0207b018', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'dc43b75a-002b-49e3-adda-b6b3b143ca74', '36f42563-f895-46d7-9a63-2c7f0207b018', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'dc43b75a-002b-49e3-adda-b6b3b143ca74', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1497.0, 1228.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '1535d6c6-ab5b-42e6-a4e6-b7d91e3d2590', '36f42563-f895-46d7-9a63-2c7f0207b018', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '1535d6c6-ab5b-42e6-a4e6-b7d91e3d2590', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1871.0, 1535.0, 655.0, 512.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'db6ea009-e900-4975-bf16-98b067a19c11', '36f42563-f895-46d7-9a63-2c7f0207b018', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'db6ea009-e900-4975-bf16-98b067a19c11', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2246.0, 1842.0, 589.0, 460.0
);


-- --------------------------------------------------------------------
-- فندق: هيلتون الأجنحة جبل عمر مكة (MAK-HTL-0062)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'c53792ba-4863-48b6-8f04-83c3cb60513f', 'MAK-HTL-0062', 'هيلتون الأجنحة جبل عمر مكة', 'هيلتون الأجنحة جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.423900000000003, 39.821, 'https://www.google.com/maps/search/?api=1&query=21.423900000000003,39.821', 662, 'central_outer', TRUE,
    5, '+966 12 5255 2922', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742572.webp?k=26cc8aca851cb6d20e4b055d189f063473ae9bdf00334a4ad31bdf89fab12102&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 500 متر من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 6,689 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('c53792ba-4863-48b6-8f04-83c3cb60513f', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742572.webp?k=26cc8aca851cb6d20e4b055d189f063473ae9bdf00334a4ad31bdf89fab12102&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('c53792ba-4863-48b6-8f04-83c3cb60513f', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('c53792ba-4863-48b6-8f04-83c3cb60513f', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'cc72cc2d-14b6-48b7-b5bf-c6239020551f', 'c53792ba-4863-48b6-8f04-83c3cb60513f', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'cc72cc2d-14b6-48b7-b5bf-c6239020551f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2009.0, 1647.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '08044178-5574-497d-b27a-d95a00231dd0', 'c53792ba-4863-48b6-8f04-83c3cb60513f', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '08044178-5574-497d-b27a-d95a00231dd0', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2511.0, 2059.0, 879.0, 686.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'cada4aac-e0ea-4a0b-8438-4d03e5bce422', 'c53792ba-4863-48b6-8f04-83c3cb60513f', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'cada4aac-e0ea-4a0b-8438-4d03e5bce422', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3014.0, 2470.0, 791.0, 618.0
);


-- --------------------------------------------------------------------
-- فندق: فندق دار الغفران - أبراج الصفوة (MAK-EMA-0063)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '358ab459-c2bb-4d1c-b5b4-7c9b25b2bf74', 'MAK-EMA-0063', 'فندق دار الغفران - أبراج الصفوة', 'Dar Al Ghufran Hotel - Al Safwah Towers', 'makkah', 'أجياد', 'أبراج الصفوة، قبالة بوابة الملك عبد العزيز، مكة المكرمة',
    21.4201, 39.8273, 'https://www.google.com/maps/search/?api=1&query=21.4201,39.8273', 341, 'central_walking', TRUE,
    5, '+966 12 5272 2953', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/573196335.webp?k=ebde2e2888246bb1fb2d0e10969f10f8a4ee36bdb6ab0463d1e146caf08e6e48&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 1.5 كلم من المركز وبتقييم نزلاء حقيقي 8.2/10 بناء على 3,552 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('358ab459-c2bb-4d1c-b5b4-7c9b25b2bf74', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/573196335.webp?k=ebde2e2888246bb1fb2d0e10969f10f8a4ee36bdb6ab0463d1e146caf08e6e48&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('358ab459-c2bb-4d1c-b5b4-7c9b25b2bf74', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('358ab459-c2bb-4d1c-b5b4-7c9b25b2bf74', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '956ba5fc-49e0-400c-a876-825e721ee948', '358ab459-c2bb-4d1c-b5b4-7c9b25b2bf74', 'double', 'غرفة ثنائية إطلالة كعبة', 2, FALSE, 'kaaba_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '956ba5fc-49e0-400c-a876-825e721ee948', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1550.0, 1290.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'cdafb7a3-a5b9-480a-901a-8196281e6e1d', '358ab459-c2bb-4d1c-b5b4-7c9b25b2bf74', 'quad', 'غرفة رباعية فاخرة إطلالة حرم', 4, TRUE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'cdafb7a3-a5b9-480a-901a-8196281e6e1d', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1880.0, 1560.0, 495.0, 410.0
);


-- --------------------------------------------------------------------
-- فندق: Royal Almashaer (MAK-ROY-0064)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '9447f04f-2dd6-43d9-b601-168765a0cbe9', 'MAK-ROY-0064', 'Royal Almashaer', 'Royal Almashaer', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.420887, 39.827806, 'https://www.google.com/maps/search/?api=1&query=21.420887,39.827806', 287, 'central_walking', TRUE,
    4, '+966 12 5289 2984', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/480645771.webp?k=6e048995b17939ebba5584554389e8ee09ca20a280c575e40736d8d872b1815a&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 6.3 كلم من المركز وبتقييم نزلاء حقيقي 7.3/10 بناء على 97 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('9447f04f-2dd6-43d9-b601-168765a0cbe9', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/480645771.webp?k=6e048995b17939ebba5584554389e8ee09ca20a280c575e40736d8d872b1815a&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('9447f04f-2dd6-43d9-b601-168765a0cbe9', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('9447f04f-2dd6-43d9-b601-168765a0cbe9', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '87c5125c-83ce-4463-9858-d6e37eaa8446', '9447f04f-2dd6-43d9-b601-168765a0cbe9', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '87c5125c-83ce-4463-9858-d6e37eaa8446', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    450.0, 369.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'dd576a1c-bd17-47ba-a8c5-ef453cd27ada', '9447f04f-2dd6-43d9-b601-168765a0cbe9', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'dd576a1c-bd17-47ba-a8c5-ef453cd27ada', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    562.0, 461.0, 197.0, 154.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '54e28db7-b042-41d5-9190-3d466b2f2f84', '9447f04f-2dd6-43d9-b601-168765a0cbe9', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '54e28db7-b042-41d5-9190-3d466b2f2f84', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    675.0, 554.0, 177.0, 138.0
);


-- --------------------------------------------------------------------
-- فندق: فور بوينتس باي شيراتون مكة المكرمة النسيم (MAK-HTL-0065)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '5120d045-d775-4a95-9b07-9f6083562dfe', 'MAK-HTL-0065', 'فور بوينتس باي شيراتون مكة المكرمة النسيم', 'فور بوينتس باي شيراتون مكة المكرمة النسيم', 'makkah', 'النسيم', 'حي النسيم، مكة المكرمة',
    21.391199999999998, 39.880399999999995, 'https://www.google.com/maps/search/?api=1&query=21.391199999999998,39.880399999999995', 7790, 'shuttle_bus', FALSE,
    5, '+966 12 5306 3015', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/628113158.webp?k=441a72d2d5f85751aff1932efe4940478614101ca3d745272c82647400a15a53&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي النسيم. يتميز بـ 6.8 كلم من المركز وبتقييم نزلاء حقيقي 8.1/10 بناء على 10,188 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5120d045-d775-4a95-9b07-9f6083562dfe', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/628113158.webp?k=441a72d2d5f85751aff1932efe4940478614101ca3d745272c82647400a15a53&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5120d045-d775-4a95-9b07-9f6083562dfe', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5120d045-d775-4a95-9b07-9f6083562dfe', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '1d69eaa5-5daa-44c1-970d-f05be52062cf', '5120d045-d775-4a95-9b07-9f6083562dfe', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '1d69eaa5-5daa-44c1-970d-f05be52062cf', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    371.0, 304.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '104fb443-e7d3-4bf3-a29b-59547ee825e8', '5120d045-d775-4a95-9b07-9f6083562dfe', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '104fb443-e7d3-4bf3-a29b-59547ee825e8', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    464.0, 380.0, 162.0, 127.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '6275301b-a723-451b-a278-b3d1a098cd2a', '5120d045-d775-4a95-9b07-9f6083562dfe', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '6275301b-a723-451b-a278-b3d1a098cd2a', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    556.0, 456.0, 146.0, 114.0
);


-- --------------------------------------------------------------------
-- فندق: Al Shohada by Palm Rich Makkah (MAK-SHO-0066)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'dc67c0da-c389-4356-9b93-6fa8e0bb7773', 'MAK-SHO-0066', 'Al Shohada by Palm Rich Makkah', 'Al Shohada by Palm Rich Makkah', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.422487, 39.825406, 'https://www.google.com/maps/search/?api=1&query=21.422487,39.825406', 98, 'central_first_row', TRUE,
    5, '+966 12 5323 3046', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/889507953.webp?k=6aa43f8715e9e1aeb1a4315988d49279e061e4b6b36115d973d333bfbf6d24fd&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 0.9 كلم من المركز وبتقييم نزلاء حقيقي 8.6/10 بناء على 4,073 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('dc67c0da-c389-4356-9b93-6fa8e0bb7773', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/889507953.webp?k=6aa43f8715e9e1aeb1a4315988d49279e061e4b6b36115d973d333bfbf6d24fd&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('dc67c0da-c389-4356-9b93-6fa8e0bb7773', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('dc67c0da-c389-4356-9b93-6fa8e0bb7773', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '614b2ea4-de78-4578-b5ec-714c694bbe69', 'dc67c0da-c389-4356-9b93-6fa8e0bb7773', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '614b2ea4-de78-4578-b5ec-714c694bbe69', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1338.0, 1097.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '4d76054b-3470-4a9a-9a5d-fef3c718b5be', 'dc67c0da-c389-4356-9b93-6fa8e0bb7773', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '4d76054b-3470-4a9a-9a5d-fef3c718b5be', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1672.0, 1371.0, 585.0, 457.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '11a3f842-4282-4e27-a30b-ff4bf459b4da', 'dc67c0da-c389-4356-9b93-6fa8e0bb7773', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '11a3f842-4282-4e27-a30b-ff4bf459b4da', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2007.0, 1646.0, 527.0, 411.0
);


-- --------------------------------------------------------------------
-- فندق: فندق مكارم أم القرى (MAK-HTL-0067)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'b775e1fd-f0f1-499d-b782-884cce441ac1', 'MAK-HTL-0067', 'فندق مكارم أم القرى', 'فندق مكارم أم القرى', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.423287000000002, 39.826206, 'https://www.google.com/maps/search/?api=1&query=21.423287000000002,39.826206', 105, 'central_first_row', TRUE,
    5, '+966 12 5340 3077', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/882263912.webp?k=920909d9256ccbb5badc3142c46c54634263573451a5d8fe45bd09bb366e766a&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 2.2 كلم من المركز وبتقييم نزلاء حقيقي 8.1/10 بناء على 6,914 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b775e1fd-f0f1-499d-b782-884cce441ac1', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/882263912.webp?k=920909d9256ccbb5badc3142c46c54634263573451a5d8fe45bd09bb366e766a&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b775e1fd-f0f1-499d-b782-884cce441ac1', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b775e1fd-f0f1-499d-b782-884cce441ac1', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'debc0326-e37c-471d-a3c8-6c2d47db8d58', 'b775e1fd-f0f1-499d-b782-884cce441ac1', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'debc0326-e37c-471d-a3c8-6c2d47db8d58', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    324.0, 266.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '81519d8f-a96d-4c48-a885-63e6d3905728', 'b775e1fd-f0f1-499d-b782-884cce441ac1', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '81519d8f-a96d-4c48-a885-63e6d3905728', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    405.0, 332.0, 142.0, 111.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '679002ac-d2c0-468c-a2e4-d5f93b9abed7', 'b775e1fd-f0f1-499d-b782-884cce441ac1', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '679002ac-d2c0-468c-a2e4-d5f93b9abed7', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    486.0, 399.0, 128.0, 100.0
);


-- --------------------------------------------------------------------
-- فندق: فندق بونسيانا مكة - Poinciana Hotel Makkah (MAK-POI-0068)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '38d8350a-fc46-441e-bae3-8293ca8ebcdd', 'MAK-POI-0068', 'فندق بونسيانا مكة - Poinciana Hotel Makkah', 'فندق بونسيانا مكة - Poinciana Hotel Makkah', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.424087, 39.827006, 'https://www.google.com/maps/search/?api=1&query=21.424087,39.827006', 232, 'central_walking', TRUE,
    4, '+966 12 5357 3108', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/804023844.webp?k=afee15ba294117b83fb779cf1dafaac1a1b498a9a3a646a783629bbc1e1607ba&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 1.3 كلم من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 614 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('38d8350a-fc46-441e-bae3-8293ca8ebcdd', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/804023844.webp?k=afee15ba294117b83fb779cf1dafaac1a1b498a9a3a646a783629bbc1e1607ba&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('38d8350a-fc46-441e-bae3-8293ca8ebcdd', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('38d8350a-fc46-441e-bae3-8293ca8ebcdd', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '06efaea8-125b-49d4-ad0c-54790c697fcd', '38d8350a-fc46-441e-bae3-8293ca8ebcdd', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '06efaea8-125b-49d4-ad0c-54790c697fcd', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    634.0, 520.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '5344db8f-8ad1-4369-b96c-8c83365a04ac', '38d8350a-fc46-441e-bae3-8293ca8ebcdd', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '5344db8f-8ad1-4369-b96c-8c83365a04ac', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    792.0, 650.0, 277.0, 217.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '331cf5fe-b89f-4809-8706-5eda9a9bc8bd', '38d8350a-fc46-441e-bae3-8293ca8ebcdd', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '331cf5fe-b89f-4809-8706-5eda9a9bc8bd', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    951.0, 780.0, 250.0, 195.0
);


-- --------------------------------------------------------------------
-- فندق: فندق ضيوف المقام واحد توصيل مجاني للحرم - Douof Al Maqam One Hotel Free Shuttle Service (MAK-DOU-0069)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '0e7f3b55-8e77-4a85-a42c-9cbe439d6d95', 'MAK-DOU-0069', 'فندق ضيوف المقام واحد توصيل مجاني للحرم - Douof Al Maqam One Hotel Free Shuttle Service', 'فندق ضيوف المقام واحد توصيل مجاني للحرم - Douof Al Maqam One Hotel Free Shuttle Service', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.424887000000002, 39.827806, 'https://www.google.com/maps/search/?api=1&query=21.424887000000002,39.827806', 371, 'central_walking', TRUE,
    4, '+966 12 5374 3139', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/674225991.webp?k=799e1aa8ec893a17904d011499c1bf24e0f2978529f894d1364cdf5a346ed4b8&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 2.4 كلم من المركز وبتقييم نزلاء حقيقي 7.8/10 بناء على 1,307 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('0e7f3b55-8e77-4a85-a42c-9cbe439d6d95', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/674225991.webp?k=799e1aa8ec893a17904d011499c1bf24e0f2978529f894d1364cdf5a346ed4b8&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('0e7f3b55-8e77-4a85-a42c-9cbe439d6d95', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('0e7f3b55-8e77-4a85-a42c-9cbe439d6d95', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '8278ccef-8483-45fd-bfc7-d975ce377f02', '0e7f3b55-8e77-4a85-a42c-9cbe439d6d95', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '8278ccef-8483-45fd-bfc7-d975ce377f02', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    450.0, 369.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '8ab39c7a-968a-4770-8106-eca2a6029304', '0e7f3b55-8e77-4a85-a42c-9cbe439d6d95', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '8ab39c7a-968a-4770-8106-eca2a6029304', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    562.0, 461.0, 197.0, 154.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '9de29a51-3903-403d-879d-bc9ec3abb291', '0e7f3b55-8e77-4a85-a42c-9cbe439d6d95', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '9de29a51-3903-403d-879d-bc9ec3abb291', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    675.0, 554.0, 177.0, 138.0
);


-- --------------------------------------------------------------------
-- فندق: فندق مكارم أجياد مكة (MAK-HTL-0070)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '5e04f069-bfcb-472d-a410-6b2a8ef88e6d', 'MAK-HTL-0070', 'فندق مكارم أجياد مكة', 'فندق مكارم أجياد مكة', 'makkah', 'أجياد', 'حي أجياد، مكة المكرمة',
    21.4161, 39.825399999999995, 'https://www.google.com/maps/search/?api=1&query=21.4161,39.825399999999995', 844, 'central_outer', TRUE,
    5, '+966 12 5391 3170', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/921116724.webp?k=cb9b93c1a93c82b012bf527894eb376262b03252d5c1179b5fbefb83d2dd17e2&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي أجياد. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 8.5/10 بناء على 7,408 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5e04f069-bfcb-472d-a410-6b2a8ef88e6d', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/921116724.webp?k=cb9b93c1a93c82b012bf527894eb376262b03252d5c1179b5fbefb83d2dd17e2&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5e04f069-bfcb-472d-a410-6b2a8ef88e6d', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5e04f069-bfcb-472d-a410-6b2a8ef88e6d', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '45de3b71-216d-44a0-beb2-736835dfa48f', '5e04f069-bfcb-472d-a410-6b2a8ef88e6d', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '45de3b71-216d-44a0-beb2-736835dfa48f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1627.0, 1334.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '008f160e-dddb-4111-a528-53f4bab5d524', '5e04f069-bfcb-472d-a410-6b2a8ef88e6d', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '008f160e-dddb-4111-a528-53f4bab5d524', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2034.0, 1668.0, 712.0, 556.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'dcd5dce6-03a4-4020-8624-885d77864724', '5e04f069-bfcb-472d-a410-6b2a8ef88e6d', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'dcd5dce6-03a4-4020-8624-885d77864724', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2440.0, 2001.0, 641.0, 500.0
);


-- --------------------------------------------------------------------
-- فندق: إيبيس ستايلز مكة (MAK-HTL-0071)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'a80a01fe-4072-40a6-9d96-24d0ae7451f0', 'MAK-HTL-0071', 'إيبيس ستايلز مكة', 'إيبيس ستايلز مكة', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.420887, 39.825406, 'https://www.google.com/maps/search/?api=1&query=21.420887,39.825406', 232, 'central_walking', TRUE,
    4, '+966 12 5408 3201', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/914585345.webp?k=4c1b793cd32e333df43ecccafd43425fa9a792acae475fbe3d080e694f06145c&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 3 كلم من المركز وبتقييم نزلاء حقيقي 8.0/10 بناء على 9,180 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a80a01fe-4072-40a6-9d96-24d0ae7451f0', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/914585345.webp?k=4c1b793cd32e333df43ecccafd43425fa9a792acae475fbe3d080e694f06145c&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a80a01fe-4072-40a6-9d96-24d0ae7451f0', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a80a01fe-4072-40a6-9d96-24d0ae7451f0', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '3a833e28-0c5b-4a4a-aeee-904b304957a3', 'a80a01fe-4072-40a6-9d96-24d0ae7451f0', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '3a833e28-0c5b-4a4a-aeee-904b304957a3', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    450.0, 369.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '19915a9d-4c30-4c13-aa9c-6051961356ee', 'a80a01fe-4072-40a6-9d96-24d0ae7451f0', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '19915a9d-4c30-4c13-aa9c-6051961356ee', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    562.0, 461.0, 197.0, 154.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'ad2f5b62-99ca-47f1-9c5d-f85818ef4e45', 'a80a01fe-4072-40a6-9d96-24d0ae7451f0', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'ad2f5b62-99ca-47f1-9c5d-f85818ef4e45', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    675.0, 554.0, 177.0, 138.0
);


-- --------------------------------------------------------------------
-- فندق: كونراد جبل عمر مكة (MAK-HTL-0072)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '8baf8ccb-a472-47b1-a6e7-66bf35ee8395', 'MAK-HTL-0072', 'كونراد جبل عمر مكة', 'كونراد جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.4207, 39.821, 'https://www.google.com/maps/search/?api=1&query=21.4207,39.821', 678, 'central_outer', TRUE,
    5, '+966 12 5425 3232', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/928063101.webp?k=4e2b273352bbc2f7827c409b9abff6b3efb8ed788d804955e3ae1bae2d7320e5&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 5,711 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('8baf8ccb-a472-47b1-a6e7-66bf35ee8395', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/928063101.webp?k=4e2b273352bbc2f7827c409b9abff6b3efb8ed788d804955e3ae1bae2d7320e5&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('8baf8ccb-a472-47b1-a6e7-66bf35ee8395', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('8baf8ccb-a472-47b1-a6e7-66bf35ee8395', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'd4d72a7f-f0ef-4b27-b8ef-ee33db255d9f', '8baf8ccb-a472-47b1-a6e7-66bf35ee8395', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'd4d72a7f-f0ef-4b27-b8ef-ee33db255d9f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2104.0, 1725.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'b32ce5f3-ef50-4359-844c-9c8d55476fba', '8baf8ccb-a472-47b1-a6e7-66bf35ee8395', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'b32ce5f3-ef50-4359-844c-9c8d55476fba', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2630.0, 2156.0, 920.0, 719.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'dafb4255-fc01-4398-a919-207c64387e24', '8baf8ccb-a472-47b1-a6e7-66bf35ee8395', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'dafb4255-fc01-4398-a919-207c64387e24', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3156.0, 2588.0, 828.0, 647.0
);


-- --------------------------------------------------------------------
-- فندق: سويس أوتيل مكة (MAK-HTL-0073)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'b7d9a6fd-d3b4-4377-80d3-c488676bfecf', 'MAK-HTL-0073', 'سويس أوتيل مكة', 'سويس أوتيل مكة', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.422487, 39.827006, 'https://www.google.com/maps/search/?api=1&query=21.422487,39.827006', 98, 'central_first_row', TRUE,
    5, '+966 12 5442 3263', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/820913168.webp?k=25998b04cf075df87e042db5fd946c142647b13b6abb6ab39c4982f21da74843&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 300 متر من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 22,719 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b7d9a6fd-d3b4-4377-80d3-c488676bfecf', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/820913168.webp?k=25998b04cf075df87e042db5fd946c142647b13b6abb6ab39c4982f21da74843&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b7d9a6fd-d3b4-4377-80d3-c488676bfecf', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b7d9a6fd-d3b4-4377-80d3-c488676bfecf', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'cd757254-9134-429b-9c53-fe455a072d07', 'b7d9a6fd-d3b4-4377-80d3-c488676bfecf', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'cd757254-9134-429b-9c53-fe455a072d07', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2102.0, 1724.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '0c03c6ca-91c6-4124-8468-56dc49c17fa3', 'b7d9a6fd-d3b4-4377-80d3-c488676bfecf', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '0c03c6ca-91c6-4124-8468-56dc49c17fa3', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2628.0, 2155.0, 920.0, 718.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '9f1135a4-bea5-41a0-829a-5001fe4fa9fd', 'b7d9a6fd-d3b4-4377-80d3-c488676bfecf', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '9f1135a4-bea5-41a0-829a-5001fe4fa9fd', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3153.0, 2586.0, 828.0, 646.0
);


-- --------------------------------------------------------------------
-- فندق: فندق إعمار جراند (MAK-HTL-0074)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'f9257592-a729-4e79-b1cc-b75c76fff758', 'MAK-HTL-0074', 'فندق إعمار جراند', 'فندق إعمار جراند', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.423287000000002, 39.827806, 'https://www.google.com/maps/search/?api=1&query=21.423287000000002,39.827806', 222, 'central_walking', TRUE,
    5, '+966 12 5459 3294', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/520998885.webp?k=a14b6a46aa2d9fd1ccaf612dcbfdc81a53a4c388a91bb51882df23abc73ea40f&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 1.1 كلم من المركز وبتقييم نزلاء حقيقي 8.0/10 بناء على 5,098 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f9257592-a729-4e79-b1cc-b75c76fff758', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/520998885.webp?k=a14b6a46aa2d9fd1ccaf612dcbfdc81a53a4c388a91bb51882df23abc73ea40f&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f9257592-a729-4e79-b1cc-b75c76fff758', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f9257592-a729-4e79-b1cc-b75c76fff758', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'fb075c5a-b5fc-4514-888c-7d92dd42b2b3', 'f9257592-a729-4e79-b1cc-b75c76fff758', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'fb075c5a-b5fc-4514-888c-7d92dd42b2b3', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    909.0, 745.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '38cc713f-b448-4af8-b69a-f922689bc37f', 'f9257592-a729-4e79-b1cc-b75c76fff758', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '38cc713f-b448-4af8-b69a-f922689bc37f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1136.0, 931.0, 398.0, 310.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'e1d518ae-6a28-434b-b845-f45e5d0333ce', 'f9257592-a729-4e79-b1cc-b75c76fff758', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'e1d518ae-6a28-434b-b845-f45e5d0333ce', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1364.0, 1118.0, 358.0, 279.0
);


-- --------------------------------------------------------------------
-- فندق: DoubleTree by Hilton Makkah Aziziyah (MAK-DOU-0075)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '4c1dd0de-5a3b-4185-a8d7-bd863ce20b90', 'MAK-DOU-0075', 'DoubleTree by Hilton Makkah Aziziyah', 'DoubleTree by Hilton Makkah Aziziyah', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.424087, 39.824605999999996, 'https://www.google.com/maps/search/?api=1&query=21.424087,39.824605999999996', 287, 'central_walking', TRUE,
    5, '+966 12 5476 3325', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/830088943.webp?k=e6b81acf6adb2ca6a1d4a0617f857d693a79eb21e4f3d7d11fd49f36e4115ed7&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 5.4 كلم من المركز وبتقييم نزلاء حقيقي 8.7/10 بناء على 5,775 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('4c1dd0de-5a3b-4185-a8d7-bd863ce20b90', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/830088943.webp?k=e6b81acf6adb2ca6a1d4a0617f857d693a79eb21e4f3d7d11fd49f36e4115ed7&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('4c1dd0de-5a3b-4185-a8d7-bd863ce20b90', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('4c1dd0de-5a3b-4185-a8d7-bd863ce20b90', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'e14d69d6-fe6e-4119-b3d5-3ce31e82cd89', '4c1dd0de-5a3b-4185-a8d7-bd863ce20b90', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'e14d69d6-fe6e-4119-b3d5-3ce31e82cd89', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    364.0, 298.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '71f251fd-4eac-44d3-92f7-2aef3564c7b1', '4c1dd0de-5a3b-4185-a8d7-bd863ce20b90', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '71f251fd-4eac-44d3-92f7-2aef3564c7b1', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    455.0, 372.0, 159.0, 124.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '7be91232-e702-4631-a3e7-fc70f5d990f0', '4c1dd0de-5a3b-4185-a8d7-bd863ce20b90', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '7be91232-e702-4631-a3e7-fc70f5d990f0', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    546.0, 447.0, 143.0, 112.0
);


-- --------------------------------------------------------------------
-- فندق: Rowaa Lindy Hotel Makkah (MAK-ROW-0076)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '2a51795f-c06c-40cd-a0a8-194df0cfc132', 'MAK-ROW-0076', 'Rowaa Lindy Hotel Makkah', 'Rowaa Lindy Hotel Makkah', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.424887000000002, 39.825406, 'https://www.google.com/maps/search/?api=1&query=21.424887000000002,39.825406', 330, 'central_walking', TRUE,
    4, '+966 12 5493 3356', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/825494409.webp?k=a5d27bc7ddf298c2ffac3983ede687fe0d28137db2850e2bafde172bd23f8509&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 5.3 كلم من المركز وبتقييم نزلاء حقيقي 7.8/10 بناء على 108 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2a51795f-c06c-40cd-a0a8-194df0cfc132', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/825494409.webp?k=a5d27bc7ddf298c2ffac3983ede687fe0d28137db2850e2bafde172bd23f8509&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2a51795f-c06c-40cd-a0a8-194df0cfc132', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2a51795f-c06c-40cd-a0a8-194df0cfc132', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '338ce567-de0f-4492-bc2d-4135eb0282fd', '2a51795f-c06c-40cd-a0a8-194df0cfc132', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '338ce567-de0f-4492-bc2d-4135eb0282fd', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    450.0, 369.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '81862ba7-2942-408a-bf56-3f3649749ce2', '2a51795f-c06c-40cd-a0a8-194df0cfc132', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '81862ba7-2942-408a-bf56-3f3649749ce2', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    562.0, 461.0, 197.0, 154.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '9feeccab-d94a-4f66-910e-0aee5f58d5eb', '2a51795f-c06c-40cd-a0a8-194df0cfc132', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '9feeccab-d94a-4f66-910e-0aee5f58d5eb', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    675.0, 554.0, 177.0, 138.0
);


-- --------------------------------------------------------------------
-- فندق: voco Makkah by IHG (MAK-VOC-0077)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '0929da64-bbd3-40f0-bf5e-62a0aa4b1d99', 'MAK-VOC-0077', 'voco Makkah by IHG', 'voco Makkah by IHG', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.420087, 39.826206, 'https://www.google.com/maps/search/?api=1&query=21.420087,39.826206', 315, 'central_walking', TRUE,
    5, '+966 12 5510 3387', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/427975173.webp?k=c085e75bd694945f26e0dfb54b13550a0342915f82e7e7ae6f599cbed9f0a68e&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 1.8 كلم من المركز وبتقييم نزلاء حقيقي 8.7/10 بناء على 16,923 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('0929da64-bbd3-40f0-bf5e-62a0aa4b1d99', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/427975173.webp?k=c085e75bd694945f26e0dfb54b13550a0342915f82e7e7ae6f599cbed9f0a68e&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('0929da64-bbd3-40f0-bf5e-62a0aa4b1d99', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('0929da64-bbd3-40f0-bf5e-62a0aa4b1d99', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'e70d3d00-1e1b-4d31-bdca-1f1a9583c748', '0929da64-bbd3-40f0-bf5e-62a0aa4b1d99', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'e70d3d00-1e1b-4d31-bdca-1f1a9583c748', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    394.0, 323.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'e08e062b-9a84-4987-b6eb-12770a526751', '0929da64-bbd3-40f0-bf5e-62a0aa4b1d99', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'e08e062b-9a84-4987-b6eb-12770a526751', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    492.0, 404.0, 172.0, 135.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '0195d6d0-f590-4763-91b2-9f9f0cebda0f', '0929da64-bbd3-40f0-bf5e-62a0aa4b1d99', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '0195d6d0-f590-4763-91b2-9f9f0cebda0f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    591.0, 484.0, 155.0, 121.0
);


-- --------------------------------------------------------------------
-- فندق: العنوان جبل عمر مكة (MAK-HTL-0078)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '94d7969d-329f-41bf-918b-503134cbcadb', 'MAK-HTL-0078', 'العنوان جبل عمر مكة', 'العنوان جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.419900000000002, 39.821799999999996, 'https://www.google.com/maps/search/?api=1&query=21.419900000000002,39.821799999999996', 636, 'central_outer', TRUE,
    5, '+966 12 5527 3418', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/536428550.webp?k=b67de61b70a83bd973e267adc7689cbf26b9abfc16bc5f11c933d65a21c38d19&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.7 كلم من المركز وبتقييم نزلاء حقيقي 8.6/10 بناء على 20,424 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('94d7969d-329f-41bf-918b-503134cbcadb', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/536428550.webp?k=b67de61b70a83bd973e267adc7689cbf26b9abfc16bc5f11c933d65a21c38d19&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('94d7969d-329f-41bf-918b-503134cbcadb', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('94d7969d-329f-41bf-918b-503134cbcadb', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'bbd29980-f6e8-4294-b3f8-442196af261b', '94d7969d-329f-41bf-918b-503134cbcadb', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'bbd29980-f6e8-4294-b3f8-442196af261b', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1538.0, 1261.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '0ae1de6e-d36a-4487-b40d-883dd82ffb2b', '94d7969d-329f-41bf-918b-503134cbcadb', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '0ae1de6e-d36a-4487-b40d-883dd82ffb2b', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1922.0, 1576.0, 673.0, 525.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '106ddaee-c711-46f7-8c0c-99abafb7d3a0', '94d7969d-329f-41bf-918b-503134cbcadb', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '106ddaee-c711-46f7-8c0c-99abafb7d3a0', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2307.0, 1892.0, 606.0, 473.0
);


-- --------------------------------------------------------------------
-- فندق: فندق أجنحة هيلتون مكة جبل عمر (MAK-HTL-0079)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '3f7aabb5-1116-44cb-bfd5-c19dda3ae37c', 'MAK-HTL-0079', 'فندق أجنحة هيلتون مكة جبل عمر', 'Jabal Omar Hilton Suites Makkah', 'makkah', 'جبل عمر', 'مشروع جبل عمر، شارع إبراهيم الخليل، مكة المكرمة',
    21.4208, 39.8225, 'https://www.google.com/maps/search/?api=1&query=21.4208,39.8225', 504, 'central_outer', TRUE,
    5, '+966 12 5544 3449', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/892021583.webp?k=b8a646d0005d0b6e6ae136c9e7375eb36b562ff5bef3f71f8ce123fab67690df&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 450 متر من المركز وبتقييم نزلاء حقيقي 8.8/10 بناء على 21,384 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('3f7aabb5-1116-44cb-bfd5-c19dda3ae37c', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/892021583.webp?k=b8a646d0005d0b6e6ae136c9e7375eb36b562ff5bef3f71f8ce123fab67690df&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('3f7aabb5-1116-44cb-bfd5-c19dda3ae37c', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('3f7aabb5-1116-44cb-bfd5-c19dda3ae37c', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '0b329908-9750-41ea-989d-e439a3e1403b', '3f7aabb5-1116-44cb-bfd5-c19dda3ae37c', 'suite', 'جناح جونيور إطلالة جزئية للحرم', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '0b329908-9750-41ea-989d-e439a3e1403b', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1600.0, 1340.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '9105056c-9149-45be-8572-9e46531a077e', '3f7aabb5-1116-44cb-bfd5-c19dda3ae37c', 'quad', 'جناح عائلي رباعي فسيح', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '9105056c-9149-45be-8572-9e46531a077e', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1950.0, 1620.0, 510.0, 425.0
);


-- --------------------------------------------------------------------
-- فندق: فندق دار التوحيد إنتركونتيننتال (MAK-ROT-0080)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'a18c0195-9561-4aa0-81c2-758291ea53e5', 'MAK-ROT-0080', 'فندق دار التوحيد إنتركونتيننتال', 'Dar Al Tawhid InterContinental Makkah', 'makkah', 'إبراهيم الخليل', 'شارع إبراهيم الخليل، أمام ساحات الحرم وبوابة الملك فهد مباشرة',
    21.4223, 39.8247, 'https://www.google.com/maps/search/?api=1&query=21.4223,39.8247', 186, 'central_walking', TRUE,
    5, '+966 12 5561 3480', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/903317076.webp?k=3dd89e628101487c91c960f31d01deecefabc1b37653a481a61c9a8c89a7b36f&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 9.2/10 بناء على 1,725 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a18c0195-9561-4aa0-81c2-758291ea53e5', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/903317076.webp?k=3dd89e628101487c91c960f31d01deecefabc1b37653a481a61c9a8c89a7b36f&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a18c0195-9561-4aa0-81c2-758291ea53e5', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a18c0195-9561-4aa0-81c2-758291ea53e5', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '01997b1f-c18c-4ed1-9ea2-1ccfcfa40961', 'a18c0195-9561-4aa0-81c2-758291ea53e5', 'double', 'غرفة رويال كينج إطلالة كعبة', 2, FALSE, 'kaaba_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '01997b1f-c18c-4ed1-9ea2-1ccfcfa40961', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2200.0, 1850.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '51ce36fb-9ac0-4b15-8317-951fff0b99c7', 'a18c0195-9561-4aa0-81c2-758291ea53e5', 'triple', 'غرفة ثلاثية بريميوم إطلالة حرم', 3, TRUE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '51ce36fb-9ac0-4b15-8317-951fff0b99c7', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2450.0, 2050.0, 860.0, 710.0
);


-- --------------------------------------------------------------------
-- فندق: دبل تري باي هيلتون جبل عمر مكة (MAK-HTL-0081)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '01f38c7f-7053-4706-833d-c755df17e685', 'MAK-HTL-0081', 'دبل تري باي هيلتون جبل عمر مكة', 'دبل تري باي هيلتون جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.422300000000003, 39.8202, 'https://www.google.com/maps/search/?api=1&query=21.422300000000003,39.8202', 734, 'central_outer', TRUE,
    5, '+966 12 5578 3511', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742076.webp?k=5a39fcf0033115dd3a6f6750403fee0e744c9ade0fa968c27b698cb343f49658&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.8 كلم من المركز وبتقييم نزلاء حقيقي 8.5/10 بناء على 9,257 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('01f38c7f-7053-4706-833d-c755df17e685', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742076.webp?k=5a39fcf0033115dd3a6f6750403fee0e744c9ade0fa968c27b698cb343f49658&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('01f38c7f-7053-4706-833d-c755df17e685', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('01f38c7f-7053-4706-833d-c755df17e685', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '344a0527-4c4b-4dcc-93be-cd42a0eea3f4', '01f38c7f-7053-4706-833d-c755df17e685', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '344a0527-4c4b-4dcc-93be-cd42a0eea3f4', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1411.0, 1157.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '10652110-b8bd-4b86-9d5a-87a37ac9174c', '01f38c7f-7053-4706-833d-c755df17e685', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '10652110-b8bd-4b86-9d5a-87a37ac9174c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1764.0, 1446.0, 617.0, 482.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '04d6d827-b4c3-4da2-884b-a639ff0e32c2', '01f38c7f-7053-4706-833d-c755df17e685', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '04d6d827-b4c3-4da2-884b-a639ff0e32c2', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2116.0, 1736.0, 556.0, 434.0
);


-- --------------------------------------------------------------------
-- فندق: InterContinental Dar Al Tawhid Makkah by IHG (MAK-INT-0082)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'ddfdec60-161f-49ee-b1ad-74197696965d', 'MAK-INT-0082', 'InterContinental Dar Al Tawhid Makkah by IHG', 'InterContinental Dar Al Tawhid Makkah by IHG', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.424087, 39.826206, 'https://www.google.com/maps/search/?api=1&query=21.424087,39.826206', 210, 'central_walking', TRUE,
    5, '+966 12 5595 3542', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/245762423.webp?k=e03c2a2dba939986cb7fb7b56f203353672fe39c2ae3b5446d7e52dade455506&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 450 متر من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 3,707 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('ddfdec60-161f-49ee-b1ad-74197696965d', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/245762423.webp?k=e03c2a2dba939986cb7fb7b56f203353672fe39c2ae3b5446d7e52dade455506&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('ddfdec60-161f-49ee-b1ad-74197696965d', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('ddfdec60-161f-49ee-b1ad-74197696965d', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '84d04f49-75e9-40d2-af42-ce142cf6fc3a', 'ddfdec60-161f-49ee-b1ad-74197696965d', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '84d04f49-75e9-40d2-af42-ce142cf6fc3a', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2512.0, 2060.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'a4ecbf35-b4b2-458f-863f-6fa614e2c933', 'ddfdec60-161f-49ee-b1ad-74197696965d', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'a4ecbf35-b4b2-458f-863f-6fa614e2c933', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3140.0, 2575.0, 1099.0, 858.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '4694f91b-f0f1-4113-9c4a-695787ec3b18', 'ddfdec60-161f-49ee-b1ad-74197696965d', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '4694f91b-f0f1-4113-9c4a-695787ec3b18', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3768.0, 3090.0, 989.0, 772.0
);


-- --------------------------------------------------------------------
-- فندق: جميرا جبل عمر مكة (MAK-HTL-0083)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'fda26f62-056b-4107-b506-e89c5c0bfb27', 'MAK-HTL-0083', 'جميرا جبل عمر مكة', 'جميرا جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.423900000000003, 39.821799999999996, 'https://www.google.com/maps/search/?api=1&query=21.423900000000003,39.821799999999996', 569, 'central_outer', TRUE,
    5, '+966 12 5612 3573', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/511152045.webp?k=c9a5c94d0d7feae42e51b09d09dc6d71535f8c4f58caa462cbf1ea08060eb9d6&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 15,103 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('fda26f62-056b-4107-b506-e89c5c0bfb27', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/511152045.webp?k=c9a5c94d0d7feae42e51b09d09dc6d71535f8c4f58caa462cbf1ea08060eb9d6&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('fda26f62-056b-4107-b506-e89c5c0bfb27', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('fda26f62-056b-4107-b506-e89c5c0bfb27', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '2436dca7-3d29-4d6f-a3ac-c66308335052', 'fda26f62-056b-4107-b506-e89c5c0bfb27', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '2436dca7-3d29-4d6f-a3ac-c66308335052', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1936.0, 1588.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'b9a3caf8-f2e0-4353-8110-9e6d484ffc07', 'fda26f62-056b-4107-b506-e89c5c0bfb27', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'b9a3caf8-f2e0-4353-8110-9e6d484ffc07', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2420.0, 1985.0, 847.0, 662.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'e67d379c-164c-48d3-b91b-f8bdb742cb60', 'fda26f62-056b-4107-b506-e89c5c0bfb27', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'e67d379c-164c-48d3-b91b-f8bdb742cb60', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2904.0, 2382.0, 762.0, 596.0
);


-- --------------------------------------------------------------------
-- فندق: فندق أبراج لو ميريديان مكة المكرمة (MAK-HTL-0084)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '45732730-a5c1-40ca-8ac3-edfc7ac2d7eb', 'MAK-HTL-0084', 'فندق أبراج لو ميريديان مكة المكرمة', 'فندق أبراج لو ميريديان مكة المكرمة', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.420087, 39.827806, 'https://www.google.com/maps/search/?api=1&query=21.420087,39.827806', 371, 'central_walking', TRUE,
    5, '+966 12 5629 3604', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/630021253.webp?k=c30cafa770dc1a22153c3169726ae4bfc40feaae3388b61be5c441a6ef09a2be&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 2.2 كلم من المركز وبتقييم نزلاء حقيقي 8.5/10 بناء على 4,966 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('45732730-a5c1-40ca-8ac3-edfc7ac2d7eb', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/630021253.webp?k=c30cafa770dc1a22153c3169726ae4bfc40feaae3388b61be5c441a6ef09a2be&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('45732730-a5c1-40ca-8ac3-edfc7ac2d7eb', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('45732730-a5c1-40ca-8ac3-edfc7ac2d7eb', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '66eee33d-ca05-4d53-a0cf-12df99a8bc95', '45732730-a5c1-40ca-8ac3-edfc7ac2d7eb', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '66eee33d-ca05-4d53-a0cf-12df99a8bc95', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    506.0, 415.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'f876624a-17cc-440c-a170-816bdbe0844c', '45732730-a5c1-40ca-8ac3-edfc7ac2d7eb', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'f876624a-17cc-440c-a170-816bdbe0844c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    632.0, 519.0, 221.0, 173.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '9aa0030b-4e53-441b-ad91-6a566eee664c', '45732730-a5c1-40ca-8ac3-edfc7ac2d7eb', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '9aa0030b-4e53-441b-ad91-6a566eee664c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    759.0, 622.0, 199.0, 156.0
);


-- --------------------------------------------------------------------
-- فندق: فندق هيلتون المؤتمرات جبل عمر مكة (MAK-HTL-0085)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'b243f1ae-e7aa-44ef-b5c4-bc5a8dd9f5f3', 'MAK-HTL-0085', 'فندق هيلتون المؤتمرات جبل عمر مكة', 'فندق هيلتون المؤتمرات جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.419900000000002, 39.819399999999995, 'https://www.google.com/maps/search/?api=1&query=21.419900000000002,39.819399999999995', 898, 'central_outer', TRUE,
    5, '+966 12 5646 3635', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742485.webp?k=78647839b7455b7b317018115ad1eceb41e258da1f5c79fc26fb91dc036fa13e&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 8.5/10 بناء على 12,478 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b243f1ae-e7aa-44ef-b5c4-bc5a8dd9f5f3', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742485.webp?k=78647839b7455b7b317018115ad1eceb41e258da1f5c79fc26fb91dc036fa13e&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b243f1ae-e7aa-44ef-b5c4-bc5a8dd9f5f3', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b243f1ae-e7aa-44ef-b5c4-bc5a8dd9f5f3', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'fb405ad9-ccb7-4406-872e-864b322c2f55', 'b243f1ae-e7aa-44ef-b5c4-bc5a8dd9f5f3', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'fb405ad9-ccb7-4406-872e-864b322c2f55', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1602.0, 1314.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '93bbe33f-f282-4eea-806e-bcab1b08f0bf', 'b243f1ae-e7aa-44ef-b5c4-bc5a8dd9f5f3', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '93bbe33f-f282-4eea-806e-bcab1b08f0bf', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2002.0, 1642.0, 701.0, 548.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '02a87ff8-8d23-4355-86e8-3ce0dc874e14', 'b243f1ae-e7aa-44ef-b5c4-bc5a8dd9f5f3', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '02a87ff8-8d23-4355-86e8-3ce0dc874e14', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2403.0, 1971.0, 631.0, 493.0
);


-- --------------------------------------------------------------------
-- فندق: فندق لو مريديان مكة المكرمة (MAK-HTL-0086)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '898b318c-9493-428e-9a5b-be9b850bf7fe', 'MAK-HTL-0086', 'فندق لو مريديان مكة المكرمة', 'فندق لو مريديان مكة المكرمة', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.421687, 39.825406, 'https://www.google.com/maps/search/?api=1&query=21.421687,39.825406', 143, 'central_first_row', TRUE,
    5, '+966 12 5663 3666', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/630017052.webp?k=00a2d4d80f8cfe5e7401db1ad6ff023682aec0656542960bb1f3c98a68a4e8b9&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 400 متر من المركز وبتقييم نزلاء حقيقي 8.6/10 بناء على 3,545 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('898b318c-9493-428e-9a5b-be9b850bf7fe', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/630017052.webp?k=00a2d4d80f8cfe5e7401db1ad6ff023682aec0656542960bb1f3c98a68a4e8b9&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('898b318c-9493-428e-9a5b-be9b850bf7fe', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('898b318c-9493-428e-9a5b-be9b850bf7fe', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'bb492b8f-4625-478c-92eb-c4849f2aa1e1', '898b318c-9493-428e-9a5b-be9b850bf7fe', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'bb492b8f-4625-478c-92eb-c4849f2aa1e1', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1497.0, 1228.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'e74d1f1c-8792-48ac-a01b-b7d5c97e61e6', '898b318c-9493-428e-9a5b-be9b850bf7fe', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'e74d1f1c-8792-48ac-a01b-b7d5c97e61e6', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1871.0, 1535.0, 655.0, 512.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '1a5a5c8d-2a17-498a-9744-d6ac1f5e6f3c', '898b318c-9493-428e-9a5b-be9b850bf7fe', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '1a5a5c8d-2a17-498a-9744-d6ac1f5e6f3c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2246.0, 1842.0, 589.0, 460.0
);


-- --------------------------------------------------------------------
-- فندق: هيلتون الأجنحة جبل عمر مكة (MAK-HTL-0087)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'b87a347d-c8e5-4da7-a810-b791655a4f16', 'MAK-HTL-0087', 'هيلتون الأجنحة جبل عمر مكة', 'هيلتون الأجنحة جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.4215, 39.821, 'https://www.google.com/maps/search/?api=1&query=21.4215,39.821', 649, 'central_outer', TRUE,
    5, '+966 12 5680 3697', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742572.webp?k=26cc8aca851cb6d20e4b055d189f063473ae9bdf00334a4ad31bdf89fab12102&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 500 متر من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 6,689 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b87a347d-c8e5-4da7-a810-b791655a4f16', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742572.webp?k=26cc8aca851cb6d20e4b055d189f063473ae9bdf00334a4ad31bdf89fab12102&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b87a347d-c8e5-4da7-a810-b791655a4f16', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b87a347d-c8e5-4da7-a810-b791655a4f16', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'bb665fbd-4ab4-4bda-b795-af1cfd469128', 'b87a347d-c8e5-4da7-a810-b791655a4f16', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'bb665fbd-4ab4-4bda-b795-af1cfd469128', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2009.0, 1647.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'baab97bd-1157-46be-8d5c-215521bcad8a', 'b87a347d-c8e5-4da7-a810-b791655a4f16', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'baab97bd-1157-46be-8d5c-215521bcad8a', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2511.0, 2059.0, 879.0, 686.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'd07d5996-cb29-401a-aeee-b3007a2b6cba', 'b87a347d-c8e5-4da7-a810-b791655a4f16', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'd07d5996-cb29-401a-aeee-b3007a2b6cba', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3014.0, 2470.0, 791.0, 618.0
);


-- --------------------------------------------------------------------
-- فندق: Emaar Elite Makkah Hotel (MAK-EMA-0088)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'c8de4c79-ad62-47b1-a182-bad8416f4e08', 'MAK-EMA-0088', 'Emaar Elite Makkah Hotel', 'Emaar Elite Makkah Hotel', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.423287000000002, 39.827006, 'https://www.google.com/maps/search/?api=1&query=21.423287000000002,39.827006', 143, 'central_first_row', TRUE,
    5, '+966 12 5697 3728', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/573196335.webp?k=ebde2e2888246bb1fb2d0e10969f10f8a4ee36bdb6ab0463d1e146caf08e6e48&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 1.5 كلم من المركز وبتقييم نزلاء حقيقي 8.2/10 بناء على 3,552 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('c8de4c79-ad62-47b1-a182-bad8416f4e08', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/573196335.webp?k=ebde2e2888246bb1fb2d0e10969f10f8a4ee36bdb6ab0463d1e146caf08e6e48&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('c8de4c79-ad62-47b1-a182-bad8416f4e08', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('c8de4c79-ad62-47b1-a182-bad8416f4e08', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '81138f0e-37d8-49eb-857d-9c9598a8cd47', 'c8de4c79-ad62-47b1-a182-bad8416f4e08', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '81138f0e-37d8-49eb-857d-9c9598a8cd47', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    363.0, 298.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '92d650c4-59f7-4ee6-86a5-fc00f677373f', 'c8de4c79-ad62-47b1-a182-bad8416f4e08', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '92d650c4-59f7-4ee6-86a5-fc00f677373f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    454.0, 372.0, 159.0, 124.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '7dc4589b-2643-4feb-a108-56e47c446da3', 'c8de4c79-ad62-47b1-a182-bad8416f4e08', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '7dc4589b-2643-4feb-a108-56e47c446da3', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    544.0, 447.0, 143.0, 112.0
);


-- --------------------------------------------------------------------
-- فندق: Royal Almashaer (MAK-ROY-0089)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '353951fb-6d64-4f9d-b2d0-629cc3e75f43', 'MAK-ROY-0089', 'Royal Almashaer', 'Royal Almashaer', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.424087, 39.827806, 'https://www.google.com/maps/search/?api=1&query=21.424087,39.827806', 287, 'central_walking', TRUE,
    4, '+966 12 5714 3759', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/480645771.webp?k=6e048995b17939ebba5584554389e8ee09ca20a280c575e40736d8d872b1815a&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 6.3 كلم من المركز وبتقييم نزلاء حقيقي 7.3/10 بناء على 97 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('353951fb-6d64-4f9d-b2d0-629cc3e75f43', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/480645771.webp?k=6e048995b17939ebba5584554389e8ee09ca20a280c575e40736d8d872b1815a&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('353951fb-6d64-4f9d-b2d0-629cc3e75f43', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('353951fb-6d64-4f9d-b2d0-629cc3e75f43', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '01a86800-fe42-404d-b83e-934586a166c8', '353951fb-6d64-4f9d-b2d0-629cc3e75f43', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '01a86800-fe42-404d-b83e-934586a166c8', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    450.0, 369.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'b3d65282-b01d-46b7-880e-d76d1fb8a195', '353951fb-6d64-4f9d-b2d0-629cc3e75f43', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'b3d65282-b01d-46b7-880e-d76d1fb8a195', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    562.0, 461.0, 197.0, 154.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'f7937c94-62eb-46cb-b2dc-73937920a31a', '353951fb-6d64-4f9d-b2d0-629cc3e75f43', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'f7937c94-62eb-46cb-b2dc-73937920a31a', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    675.0, 554.0, 177.0, 138.0
);


-- --------------------------------------------------------------------
-- فندق: فور بوينتس باي شيراتون مكة المكرمة النسيم (MAK-HTL-0090)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'a6689299-8027-4a55-b817-1ec8b72b79d9', 'MAK-HTL-0090', 'فور بوينتس باي شيراتون مكة المكرمة النسيم', 'فور بوينتس باي شيراتون مكة المكرمة النسيم', 'makkah', 'النسيم', 'حي النسيم، مكة المكرمة',
    21.3944, 39.880399999999995, 'https://www.google.com/maps/search/?api=1&query=21.3944,39.880399999999995', 7577, 'shuttle_bus', FALSE,
    5, '+966 12 5731 3790', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/628113158.webp?k=441a72d2d5f85751aff1932efe4940478614101ca3d745272c82647400a15a53&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي النسيم. يتميز بـ 6.8 كلم من المركز وبتقييم نزلاء حقيقي 8.1/10 بناء على 10,188 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a6689299-8027-4a55-b817-1ec8b72b79d9', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/628113158.webp?k=441a72d2d5f85751aff1932efe4940478614101ca3d745272c82647400a15a53&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a6689299-8027-4a55-b817-1ec8b72b79d9', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a6689299-8027-4a55-b817-1ec8b72b79d9', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '9d87b857-5338-478a-bbe7-bf01794f4c25', 'a6689299-8027-4a55-b817-1ec8b72b79d9', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '9d87b857-5338-478a-bbe7-bf01794f4c25', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    371.0, 304.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '2c3d1eb0-2e85-4955-a219-98d2bdc5b4a3', 'a6689299-8027-4a55-b817-1ec8b72b79d9', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '2c3d1eb0-2e85-4955-a219-98d2bdc5b4a3', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    464.0, 380.0, 162.0, 127.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '93c7260c-8275-4678-809d-d66256089716', 'a6689299-8027-4a55-b817-1ec8b72b79d9', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '93c7260c-8275-4678-809d-d66256089716', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    556.0, 456.0, 146.0, 114.0
);


-- --------------------------------------------------------------------
-- فندق: Al Shohada by Palm Rich Makkah (MAK-SHO-0091)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '96f8525f-9f57-499b-9cc1-4d7bf38219d6', 'MAK-SHO-0091', 'Al Shohada by Palm Rich Makkah', 'Al Shohada by Palm Rich Makkah', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.420087, 39.825406, 'https://www.google.com/maps/search/?api=1&query=21.420087,39.825406', 330, 'central_walking', TRUE,
    5, '+966 12 5748 3821', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/889507953.webp?k=6aa43f8715e9e1aeb1a4315988d49279e061e4b6b36115d973d333bfbf6d24fd&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 0.9 كلم من المركز وبتقييم نزلاء حقيقي 8.6/10 بناء على 4,073 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('96f8525f-9f57-499b-9cc1-4d7bf38219d6', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/889507953.webp?k=6aa43f8715e9e1aeb1a4315988d49279e061e4b6b36115d973d333bfbf6d24fd&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('96f8525f-9f57-499b-9cc1-4d7bf38219d6', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('96f8525f-9f57-499b-9cc1-4d7bf38219d6', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'd2e47930-af43-448c-b0c6-a1332b264b77', '96f8525f-9f57-499b-9cc1-4d7bf38219d6', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'd2e47930-af43-448c-b0c6-a1332b264b77', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1338.0, 1097.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '2e77a2b0-ea5d-4274-b767-8a4229d904b1', '96f8525f-9f57-499b-9cc1-4d7bf38219d6', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '2e77a2b0-ea5d-4274-b767-8a4229d904b1', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1672.0, 1371.0, 585.0, 457.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'f9483a11-9d15-42a8-a171-b999b6613e82', '96f8525f-9f57-499b-9cc1-4d7bf38219d6', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'f9483a11-9d15-42a8-a171-b999b6613e82', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2007.0, 1646.0, 527.0, 411.0
);


-- --------------------------------------------------------------------
-- فندق: فندق مكارم أم القرى (MAK-HTL-0092)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '4fe5fdeb-9f33-4334-8acc-aad33567487e', 'MAK-HTL-0092', 'فندق مكارم أم القرى', 'فندق مكارم أم القرى', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.420887, 39.826206, 'https://www.google.com/maps/search/?api=1&query=21.420887,39.826206', 210, 'central_walking', TRUE,
    5, '+966 12 5765 3852', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/882263912.webp?k=920909d9256ccbb5badc3142c46c54634263573451a5d8fe45bd09bb366e766a&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 2.2 كلم من المركز وبتقييم نزلاء حقيقي 8.1/10 بناء على 6,914 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('4fe5fdeb-9f33-4334-8acc-aad33567487e', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/882263912.webp?k=920909d9256ccbb5badc3142c46c54634263573451a5d8fe45bd09bb366e766a&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('4fe5fdeb-9f33-4334-8acc-aad33567487e', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('4fe5fdeb-9f33-4334-8acc-aad33567487e', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '0ff30c88-145e-4877-ba49-663335328488', '4fe5fdeb-9f33-4334-8acc-aad33567487e', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '0ff30c88-145e-4877-ba49-663335328488', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    324.0, 266.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '593a6ffb-ab78-41ab-8e57-09abfcb6c673', '4fe5fdeb-9f33-4334-8acc-aad33567487e', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '593a6ffb-ab78-41ab-8e57-09abfcb6c673', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    405.0, 332.0, 142.0, 111.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '4522507c-6964-454d-9cbd-a930c13dbbd1', '4fe5fdeb-9f33-4334-8acc-aad33567487e', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '4522507c-6964-454d-9cbd-a930c13dbbd1', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    486.0, 399.0, 128.0, 100.0
);


-- --------------------------------------------------------------------
-- فندق: فندق بونسيانا مكة - Poinciana Hotel Makkah (MAK-POI-0093)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '6d133929-f224-410f-a7df-ad7da0aa4f74', 'MAK-POI-0093', 'فندق بونسيانا مكة - Poinciana Hotel Makkah', 'فندق بونسيانا مكة - Poinciana Hotel Makkah', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.421687, 39.827006, 'https://www.google.com/maps/search/?api=1&query=21.421687,39.827006', 143, 'central_first_row', TRUE,
    4, '+966 12 5782 3883', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/804023844.webp?k=afee15ba294117b83fb779cf1dafaac1a1b498a9a3a646a783629bbc1e1607ba&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 1.3 كلم من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 614 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('6d133929-f224-410f-a7df-ad7da0aa4f74', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/804023844.webp?k=afee15ba294117b83fb779cf1dafaac1a1b498a9a3a646a783629bbc1e1607ba&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('6d133929-f224-410f-a7df-ad7da0aa4f74', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('6d133929-f224-410f-a7df-ad7da0aa4f74', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '4b777806-768e-42fe-82e8-dda22d226b20', '6d133929-f224-410f-a7df-ad7da0aa4f74', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '4b777806-768e-42fe-82e8-dda22d226b20', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    634.0, 520.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '0cf0cc7a-ce31-4cea-ba07-f9ec17f21d47', '6d133929-f224-410f-a7df-ad7da0aa4f74', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '0cf0cc7a-ce31-4cea-ba07-f9ec17f21d47', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    792.0, 650.0, 277.0, 217.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'f2cd68a2-f3b3-4fd3-bf22-ffd20ce3304b', '6d133929-f224-410f-a7df-ad7da0aa4f74', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'f2cd68a2-f3b3-4fd3-bf22-ffd20ce3304b', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    951.0, 780.0, 250.0, 195.0
);


-- --------------------------------------------------------------------
-- فندق: فندق ضيوف المقام واحد توصيل مجاني للحرم - Douof Al Maqam One Hotel Free Shuttle Service (MAK-DOU-0094)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'c423dc81-d25e-48ad-9eff-b7274b91951e', 'MAK-DOU-0094', 'فندق ضيوف المقام واحد توصيل مجاني للحرم - Douof Al Maqam One Hotel Free Shuttle Service', 'فندق ضيوف المقام واحد توصيل مجاني للحرم - Douof Al Maqam One Hotel Free Shuttle Service', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.422487, 39.827806, 'https://www.google.com/maps/search/?api=1&query=21.422487,39.827806', 195, 'central_walking', TRUE,
    4, '+966 12 5799 3914', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/674225991.webp?k=799e1aa8ec893a17904d011499c1bf24e0f2978529f894d1364cdf5a346ed4b8&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 2.4 كلم من المركز وبتقييم نزلاء حقيقي 7.8/10 بناء على 1,307 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('c423dc81-d25e-48ad-9eff-b7274b91951e', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/674225991.webp?k=799e1aa8ec893a17904d011499c1bf24e0f2978529f894d1364cdf5a346ed4b8&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('c423dc81-d25e-48ad-9eff-b7274b91951e', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('c423dc81-d25e-48ad-9eff-b7274b91951e', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '965db25d-b014-45ef-bc57-f595dac5641c', 'c423dc81-d25e-48ad-9eff-b7274b91951e', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '965db25d-b014-45ef-bc57-f595dac5641c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    450.0, 369.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'aa77b0b3-e998-4b61-92c5-d4250e4c42e5', 'c423dc81-d25e-48ad-9eff-b7274b91951e', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'aa77b0b3-e998-4b61-92c5-d4250e4c42e5', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    562.0, 461.0, 197.0, 154.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'dbcaa8eb-e975-448c-b56d-bc8e287cf680', 'c423dc81-d25e-48ad-9eff-b7274b91951e', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'dbcaa8eb-e975-448c-b56d-bc8e287cf680', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    675.0, 554.0, 177.0, 138.0
);


-- --------------------------------------------------------------------
-- فندق: فندق مكارم أجياد مكة (MAK-HTL-0095)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '1aef29f5-192c-439d-843a-9b1e7f59cc18', 'MAK-HTL-0095', 'فندق مكارم أجياد مكة', 'فندق مكارم أجياد مكة', 'makkah', 'أجياد', 'حي أجياد، مكة المكرمة',
    21.419300000000003, 39.825399999999995, 'https://www.google.com/maps/search/?api=1&query=21.419300000000003,39.825399999999995', 430, 'central_walking', TRUE,
    5, '+966 12 5816 3945', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/921116724.webp?k=cb9b93c1a93c82b012bf527894eb376262b03252d5c1179b5fbefb83d2dd17e2&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي أجياد. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 8.5/10 بناء على 7,408 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('1aef29f5-192c-439d-843a-9b1e7f59cc18', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/921116724.webp?k=cb9b93c1a93c82b012bf527894eb376262b03252d5c1179b5fbefb83d2dd17e2&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('1aef29f5-192c-439d-843a-9b1e7f59cc18', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('1aef29f5-192c-439d-843a-9b1e7f59cc18', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'f837c9e7-cd39-49ea-9592-b6c736fabed7', '1aef29f5-192c-439d-843a-9b1e7f59cc18', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'f837c9e7-cd39-49ea-9592-b6c736fabed7', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1627.0, 1334.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'c17404eb-db82-4125-bff3-469c92ba04db', '1aef29f5-192c-439d-843a-9b1e7f59cc18', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'c17404eb-db82-4125-bff3-469c92ba04db', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2034.0, 1668.0, 712.0, 556.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'c994ea05-f6ce-45df-bf5d-14f42cfa9e8d', '1aef29f5-192c-439d-843a-9b1e7f59cc18', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'c994ea05-f6ce-45df-bf5d-14f42cfa9e8d', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2440.0, 2001.0, 641.0, 500.0
);


-- --------------------------------------------------------------------
-- فندق: إيبيس ستايلز مكة (MAK-HTL-0096)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '8058f7e2-74c7-4584-8e47-fda9cbb2b92d', 'MAK-HTL-0096', 'إيبيس ستايلز مكة', 'إيبيس ستايلز مكة', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.424087, 39.825406, 'https://www.google.com/maps/search/?api=1&query=21.424087,39.825406', 232, 'central_walking', TRUE,
    4, '+966 12 5833 3976', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/914585345.webp?k=4c1b793cd32e333df43ecccafd43425fa9a792acae475fbe3d080e694f06145c&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 3 كلم من المركز وبتقييم نزلاء حقيقي 8.0/10 بناء على 9,180 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('8058f7e2-74c7-4584-8e47-fda9cbb2b92d', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/914585345.webp?k=4c1b793cd32e333df43ecccafd43425fa9a792acae475fbe3d080e694f06145c&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('8058f7e2-74c7-4584-8e47-fda9cbb2b92d', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('8058f7e2-74c7-4584-8e47-fda9cbb2b92d', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '334e014d-e041-4c3d-a6e7-b12a4fc0cc38', '8058f7e2-74c7-4584-8e47-fda9cbb2b92d', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '334e014d-e041-4c3d-a6e7-b12a4fc0cc38', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    450.0, 369.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '5b7a860e-2f30-4f71-9b93-d359f41d14db', '8058f7e2-74c7-4584-8e47-fda9cbb2b92d', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '5b7a860e-2f30-4f71-9b93-d359f41d14db', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    562.0, 461.0, 197.0, 154.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'dcc2221e-ec5c-4343-b7a7-a2ebbdbb7235', '8058f7e2-74c7-4584-8e47-fda9cbb2b92d', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'dcc2221e-ec5c-4343-b7a7-a2ebbdbb7235', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    675.0, 554.0, 177.0, 138.0
);


-- --------------------------------------------------------------------
-- فندق: كونراد جبل عمر مكة (MAK-HTL-0097)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '62922adc-f2a0-4010-8efa-5a37a62467c9', 'MAK-HTL-0097', 'كونراد جبل عمر مكة', 'كونراد جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.423900000000003, 39.821, 'https://www.google.com/maps/search/?api=1&query=21.423900000000003,39.821', 662, 'central_outer', TRUE,
    5, '+966 12 5850 4007', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/928063101.webp?k=4e2b273352bbc2f7827c409b9abff6b3efb8ed788d804955e3ae1bae2d7320e5&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 5,711 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('62922adc-f2a0-4010-8efa-5a37a62467c9', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/928063101.webp?k=4e2b273352bbc2f7827c409b9abff6b3efb8ed788d804955e3ae1bae2d7320e5&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('62922adc-f2a0-4010-8efa-5a37a62467c9', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('62922adc-f2a0-4010-8efa-5a37a62467c9', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '441b1032-2a00-4f08-87f3-f4d8c045007e', '62922adc-f2a0-4010-8efa-5a37a62467c9', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '441b1032-2a00-4f08-87f3-f4d8c045007e', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2104.0, 1725.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '6b94cef2-0818-499e-ad18-4f5002ca8e1b', '62922adc-f2a0-4010-8efa-5a37a62467c9', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '6b94cef2-0818-499e-ad18-4f5002ca8e1b', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2630.0, 2156.0, 920.0, 719.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '9be990d4-3446-436d-aed9-cff5eed9255a', '62922adc-f2a0-4010-8efa-5a37a62467c9', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '9be990d4-3446-436d-aed9-cff5eed9255a', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3156.0, 2588.0, 828.0, 647.0
);


-- --------------------------------------------------------------------
-- فندق: سويس أوتيل مكة (MAK-HTL-0098)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '001c110c-380e-4ab4-be3b-982533a2da51', 'MAK-HTL-0098', 'سويس أوتيل مكة', 'سويس أوتيل مكة', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.420087, 39.827006, 'https://www.google.com/maps/search/?api=1&query=21.420087,39.827006', 330, 'central_walking', TRUE,
    5, '+966 12 5867 4038', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/820913168.webp?k=25998b04cf075df87e042db5fd946c142647b13b6abb6ab39c4982f21da74843&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 300 متر من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 22,719 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('001c110c-380e-4ab4-be3b-982533a2da51', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/820913168.webp?k=25998b04cf075df87e042db5fd946c142647b13b6abb6ab39c4982f21da74843&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('001c110c-380e-4ab4-be3b-982533a2da51', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('001c110c-380e-4ab4-be3b-982533a2da51', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '5988cbba-80fc-4ebf-9237-9ad88495e540', '001c110c-380e-4ab4-be3b-982533a2da51', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '5988cbba-80fc-4ebf-9237-9ad88495e540', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2102.0, 1724.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '784ceef9-5be7-4c97-87ee-556e5232a671', '001c110c-380e-4ab4-be3b-982533a2da51', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '784ceef9-5be7-4c97-87ee-556e5232a671', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2628.0, 2155.0, 920.0, 718.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '3bed2ae2-f6bb-4ada-a387-ffc972bbdd12', '001c110c-380e-4ab4-be3b-982533a2da51', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '3bed2ae2-f6bb-4ada-a387-ffc972bbdd12', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3153.0, 2586.0, 828.0, 646.0
);


-- --------------------------------------------------------------------
-- فندق: فندق إعمار جراند (MAK-HTL-0099)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '82c1cf63-524e-42ae-a6de-b98282e98c72', 'MAK-HTL-0099', 'فندق إعمار جراند', 'فندق إعمار جراند', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.420887, 39.827806, 'https://www.google.com/maps/search/?api=1&query=21.420887,39.827806', 287, 'central_walking', TRUE,
    5, '+966 12 5884 4069', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/520998885.webp?k=a14b6a46aa2d9fd1ccaf612dcbfdc81a53a4c388a91bb51882df23abc73ea40f&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 1.1 كلم من المركز وبتقييم نزلاء حقيقي 8.0/10 بناء على 5,098 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('82c1cf63-524e-42ae-a6de-b98282e98c72', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/520998885.webp?k=a14b6a46aa2d9fd1ccaf612dcbfdc81a53a4c388a91bb51882df23abc73ea40f&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('82c1cf63-524e-42ae-a6de-b98282e98c72', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('82c1cf63-524e-42ae-a6de-b98282e98c72', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '7cce84d8-a2a9-4d05-936b-8c237ea0d17c', '82c1cf63-524e-42ae-a6de-b98282e98c72', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '7cce84d8-a2a9-4d05-936b-8c237ea0d17c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    909.0, 745.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '7f262eff-3bea-40f9-a298-3fd354b228b7', '82c1cf63-524e-42ae-a6de-b98282e98c72', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '7f262eff-3bea-40f9-a298-3fd354b228b7', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1136.0, 931.0, 398.0, 310.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'fab5361f-e573-4aa9-a7ff-37b650ac8010', '82c1cf63-524e-42ae-a6de-b98282e98c72', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'fab5361f-e573-4aa9-a7ff-37b650ac8010', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1364.0, 1118.0, 358.0, 279.0
);


-- --------------------------------------------------------------------
-- فندق: DoubleTree by Hilton Makkah Aziziyah (MAK-DOU-0100)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '26bafab2-eb63-4e99-a02b-ddc5cae509be', 'MAK-DOU-0100', 'DoubleTree by Hilton Makkah Aziziyah', 'DoubleTree by Hilton Makkah Aziziyah', 'makkah', 'الشبيكة', 'حي المنطقة المركزية، مكة المكرمة',
    21.421687, 39.824605999999996, 'https://www.google.com/maps/search/?api=1&query=21.421687,39.824605999999996', 222, 'central_walking', TRUE,
    5, '+966 12 5901 4100', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/830088943.webp?k=e6b81acf6adb2ca6a1d4a0617f857d693a79eb21e4f3d7d11fd49f36e4115ed7&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 5.4 كلم من المركز وبتقييم نزلاء حقيقي 8.7/10 بناء على 5,775 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('26bafab2-eb63-4e99-a02b-ddc5cae509be', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/830088943.webp?k=e6b81acf6adb2ca6a1d4a0617f857d693a79eb21e4f3d7d11fd49f36e4115ed7&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('26bafab2-eb63-4e99-a02b-ddc5cae509be', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('26bafab2-eb63-4e99-a02b-ddc5cae509be', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'ca77e875-3f35-4596-a5dc-a4e47b8c4b07', '26bafab2-eb63-4e99-a02b-ddc5cae509be', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'ca77e875-3f35-4596-a5dc-a4e47b8c4b07', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    364.0, 298.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'c329f173-81be-4e3e-b1a7-f708a71a0ded', '26bafab2-eb63-4e99-a02b-ddc5cae509be', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'c329f173-81be-4e3e-b1a7-f708a71a0ded', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    455.0, 372.0, 159.0, 124.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'df066a1c-c360-4836-95d5-994501db82b6', '26bafab2-eb63-4e99-a02b-ddc5cae509be', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'df066a1c-c360-4836-95d5-994501db82b6', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    546.0, 447.0, 143.0, 112.0
);


-- --------------------------------------------------------------------
-- فندق: Rowaa Lindy Hotel Makkah (MAK-ROW-0101)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '2d7e15ce-929e-4428-883f-6264947f2871', 'MAK-ROW-0101', 'Rowaa Lindy Hotel Makkah', 'Rowaa Lindy Hotel Makkah', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.422487, 39.825406, 'https://www.google.com/maps/search/?api=1&query=21.422487,39.825406', 98, 'central_first_row', TRUE,
    4, '+966 12 5918 4131', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/825494409.webp?k=a5d27bc7ddf298c2ffac3983ede687fe0d28137db2850e2bafde172bd23f8509&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 5.3 كلم من المركز وبتقييم نزلاء حقيقي 7.8/10 بناء على 108 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2d7e15ce-929e-4428-883f-6264947f2871', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/825494409.webp?k=a5d27bc7ddf298c2ffac3983ede687fe0d28137db2850e2bafde172bd23f8509&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2d7e15ce-929e-4428-883f-6264947f2871', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2d7e15ce-929e-4428-883f-6264947f2871', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '1f9fafc8-983b-40ee-ac8c-89b3f8ecfe80', '2d7e15ce-929e-4428-883f-6264947f2871', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '1f9fafc8-983b-40ee-ac8c-89b3f8ecfe80', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    450.0, 369.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'bd51d9dd-a104-4b05-a49c-bc2e32faf2e3', '2d7e15ce-929e-4428-883f-6264947f2871', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'bd51d9dd-a104-4b05-a49c-bc2e32faf2e3', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    562.0, 461.0, 197.0, 154.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '6a3155fb-790a-49f6-9dbd-a20773d849ce', '2d7e15ce-929e-4428-883f-6264947f2871', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '6a3155fb-790a-49f6-9dbd-a20773d849ce', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    675.0, 554.0, 177.0, 138.0
);


-- --------------------------------------------------------------------
-- فندق: voco Makkah by IHG (MAK-VOC-0102)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'bc18db94-50c0-4805-b799-e1b79791f34f', 'MAK-VOC-0102', 'voco Makkah by IHG', 'voco Makkah by IHG', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.423287000000002, 39.826206, 'https://www.google.com/maps/search/?api=1&query=21.423287000000002,39.826206', 105, 'central_first_row', TRUE,
    5, '+966 12 5935 4162', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/427975173.webp?k=c085e75bd694945f26e0dfb54b13550a0342915f82e7e7ae6f599cbed9f0a68e&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 1.8 كلم من المركز وبتقييم نزلاء حقيقي 8.7/10 بناء على 16,923 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('bc18db94-50c0-4805-b799-e1b79791f34f', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/427975173.webp?k=c085e75bd694945f26e0dfb54b13550a0342915f82e7e7ae6f599cbed9f0a68e&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('bc18db94-50c0-4805-b799-e1b79791f34f', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('bc18db94-50c0-4805-b799-e1b79791f34f', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '3538915e-04fa-4eac-851c-f87606bce742', 'bc18db94-50c0-4805-b799-e1b79791f34f', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '3538915e-04fa-4eac-851c-f87606bce742', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    394.0, 323.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '392e0c5d-01a8-40a8-9994-ef4d2b3ca36a', 'bc18db94-50c0-4805-b799-e1b79791f34f', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '392e0c5d-01a8-40a8-9994-ef4d2b3ca36a', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    492.0, 404.0, 172.0, 135.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '68bc08db-efb6-4511-85da-fe3aeded3e6b', 'bc18db94-50c0-4805-b799-e1b79791f34f', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '68bc08db-efb6-4511-85da-fe3aeded3e6b', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    591.0, 484.0, 155.0, 121.0
);


-- --------------------------------------------------------------------
-- فندق: العنوان جبل عمر مكة (MAK-HTL-0103)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '9c92b3f6-ccb3-4cf2-8cb3-323c0ae83170', 'MAK-HTL-0103', 'العنوان جبل عمر مكة', 'العنوان جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.4231, 39.821799999999996, 'https://www.google.com/maps/search/?api=1&query=21.4231,39.821799999999996', 544, 'central_outer', TRUE,
    5, '+966 12 5952 4193', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/536428550.webp?k=b67de61b70a83bd973e267adc7689cbf26b9abfc16bc5f11c933d65a21c38d19&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.7 كلم من المركز وبتقييم نزلاء حقيقي 8.6/10 بناء على 20,424 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('9c92b3f6-ccb3-4cf2-8cb3-323c0ae83170', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/536428550.webp?k=b67de61b70a83bd973e267adc7689cbf26b9abfc16bc5f11c933d65a21c38d19&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('9c92b3f6-ccb3-4cf2-8cb3-323c0ae83170', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('9c92b3f6-ccb3-4cf2-8cb3-323c0ae83170', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '56fd260d-ce9e-4293-90ea-d4e4f02081a7', '9c92b3f6-ccb3-4cf2-8cb3-323c0ae83170', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '56fd260d-ce9e-4293-90ea-d4e4f02081a7', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1538.0, 1261.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '0579944c-9e9b-44ba-94cd-2ccfd9d8a3a4', '9c92b3f6-ccb3-4cf2-8cb3-323c0ae83170', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '0579944c-9e9b-44ba-94cd-2ccfd9d8a3a4', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1922.0, 1576.0, 673.0, 525.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '854b8bad-d26e-4336-b773-95c90f0838b7', '9c92b3f6-ccb3-4cf2-8cb3-323c0ae83170', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '854b8bad-d26e-4336-b773-95c90f0838b7', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2307.0, 1892.0, 606.0, 473.0
);


-- --------------------------------------------------------------------
-- فندق: جبل عمر حياة ريجنسي مكة (MAK-HTL-0104)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'a94c3f92-cbf2-4a7b-8abe-62fa7b292b79', 'MAK-HTL-0104', 'جبل عمر حياة ريجنسي مكة', 'جبل عمر حياة ريجنسي مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.423900000000003, 39.8226, 'https://www.google.com/maps/search/?api=1&query=21.423900000000003,39.8226', 478, 'central_walking', TRUE,
    5, '+966 12 5969 4224', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/892021583.webp?k=b8a646d0005d0b6e6ae136c9e7375eb36b562ff5bef3f71f8ce123fab67690df&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 450 متر من المركز وبتقييم نزلاء حقيقي 8.8/10 بناء على 21,384 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a94c3f92-cbf2-4a7b-8abe-62fa7b292b79', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/892021583.webp?k=b8a646d0005d0b6e6ae136c9e7375eb36b562ff5bef3f71f8ce123fab67690df&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a94c3f92-cbf2-4a7b-8abe-62fa7b292b79', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a94c3f92-cbf2-4a7b-8abe-62fa7b292b79', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '1a80d264-a1cc-4bbd-a571-1e9507dcecc3', 'a94c3f92-cbf2-4a7b-8abe-62fa7b292b79', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '1a80d264-a1cc-4bbd-a571-1e9507dcecc3', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1743.0, 1429.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '55ad0eae-32e6-4888-8ead-527c01bfe23e', 'a94c3f92-cbf2-4a7b-8abe-62fa7b292b79', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '55ad0eae-32e6-4888-8ead-527c01bfe23e', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2179.0, 1786.0, 763.0, 595.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '31edcda8-54a8-4f49-9881-b800c486042c', 'a94c3f92-cbf2-4a7b-8abe-62fa7b292b79', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '31edcda8-54a8-4f49-9881-b800c486042c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2614.0, 2144.0, 686.0, 536.0
);


-- --------------------------------------------------------------------
-- فندق: Rotana Jabal Omar Makkah (MAK-ROT-0105)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '68e5ca08-2f43-491d-b6d0-71d42a323087', 'MAK-ROT-0105', 'Rotana Jabal Omar Makkah', 'Rotana Jabal Omar Makkah', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.420087, 39.824605999999996, 'https://www.google.com/maps/search/?api=1&query=21.420087,39.824605999999996', 371, 'central_walking', TRUE,
    5, '+966 12 5986 4255', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/903317076.webp?k=3dd89e628101487c91c960f31d01deecefabc1b37653a481a61c9a8c89a7b36f&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 9.2/10 بناء على 1,725 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('68e5ca08-2f43-491d-b6d0-71d42a323087', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/903317076.webp?k=3dd89e628101487c91c960f31d01deecefabc1b37653a481a61c9a8c89a7b36f&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('68e5ca08-2f43-491d-b6d0-71d42a323087', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('68e5ca08-2f43-491d-b6d0-71d42a323087', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '82f13611-a547-49de-939b-39379f92953a', '68e5ca08-2f43-491d-b6d0-71d42a323087', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '82f13611-a547-49de-939b-39379f92953a', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1509.0, 1237.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '8ef70a2a-c6ce-4fd5-bc64-9d1c927a04f5', '68e5ca08-2f43-491d-b6d0-71d42a323087', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '8ef70a2a-c6ce-4fd5-bc64-9d1c927a04f5', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1886.0, 1546.0, 660.0, 515.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'a94d33eb-b5ba-45c6-b0dd-b4ab7266f8b1', '68e5ca08-2f43-491d-b6d0-71d42a323087', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'a94d33eb-b5ba-45c6-b0dd-b4ab7266f8b1', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2264.0, 1856.0, 594.0, 464.0
);


-- --------------------------------------------------------------------
-- فندق: دبل تري باي هيلتون جبل عمر مكة (MAK-HTL-0106)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'e0f5c598-07db-43f4-89b4-f8614be9d400', 'MAK-HTL-0106', 'دبل تري باي هيلتون جبل عمر مكة', 'دبل تري باي هيلتون جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.419900000000002, 39.8202, 'https://www.google.com/maps/search/?api=1&query=21.419900000000002,39.8202', 808, 'central_outer', TRUE,
    5, '+966 12 5104 4286', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742076.webp?k=5a39fcf0033115dd3a6f6750403fee0e744c9ade0fa968c27b698cb343f49658&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.8 كلم من المركز وبتقييم نزلاء حقيقي 8.5/10 بناء على 9,257 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e0f5c598-07db-43f4-89b4-f8614be9d400', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742076.webp?k=5a39fcf0033115dd3a6f6750403fee0e744c9ade0fa968c27b698cb343f49658&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e0f5c598-07db-43f4-89b4-f8614be9d400', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e0f5c598-07db-43f4-89b4-f8614be9d400', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'ab2d6772-c4d0-4eb2-9eb4-f37c08d9f668', 'e0f5c598-07db-43f4-89b4-f8614be9d400', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'ab2d6772-c4d0-4eb2-9eb4-f37c08d9f668', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1411.0, 1157.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '79e2d643-0325-4b9b-9609-258037ec7cb4', 'e0f5c598-07db-43f4-89b4-f8614be9d400', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '79e2d643-0325-4b9b-9609-258037ec7cb4', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1764.0, 1446.0, 617.0, 482.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '6083e6c5-4dc4-475c-8a65-83c05e6e7b2c', 'e0f5c598-07db-43f4-89b4-f8614be9d400', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '6083e6c5-4dc4-475c-8a65-83c05e6e7b2c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2116.0, 1736.0, 556.0, 434.0
);


-- --------------------------------------------------------------------
-- فندق: InterContinental Dar Al Tawhid Makkah by IHG (MAK-INT-0107)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'ab43162c-1c83-4b6f-a92c-3f8e81eee8b8', 'MAK-INT-0107', 'InterContinental Dar Al Tawhid Makkah by IHG', 'InterContinental Dar Al Tawhid Makkah by IHG', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.421687, 39.826206, 'https://www.google.com/maps/search/?api=1&query=21.421687,39.826206', 105, 'central_first_row', TRUE,
    5, '+966 12 5121 4317', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/245762423.webp?k=e03c2a2dba939986cb7fb7b56f203353672fe39c2ae3b5446d7e52dade455506&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 450 متر من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 3,707 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('ab43162c-1c83-4b6f-a92c-3f8e81eee8b8', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/245762423.webp?k=e03c2a2dba939986cb7fb7b56f203353672fe39c2ae3b5446d7e52dade455506&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('ab43162c-1c83-4b6f-a92c-3f8e81eee8b8', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('ab43162c-1c83-4b6f-a92c-3f8e81eee8b8', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '7f34a77e-9731-4f2d-8604-adcdf9223727', 'ab43162c-1c83-4b6f-a92c-3f8e81eee8b8', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '7f34a77e-9731-4f2d-8604-adcdf9223727', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2512.0, 2060.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '52129efc-1909-423a-be98-90229444bf33', 'ab43162c-1c83-4b6f-a92c-3f8e81eee8b8', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '52129efc-1909-423a-be98-90229444bf33', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3140.0, 2575.0, 1099.0, 858.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '8ff02337-99cf-4edf-8d64-af6085cda150', 'ab43162c-1c83-4b6f-a92c-3f8e81eee8b8', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '8ff02337-99cf-4edf-8d64-af6085cda150', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3768.0, 3090.0, 989.0, 772.0
);


-- --------------------------------------------------------------------
-- فندق: جميرا جبل عمر مكة (MAK-HTL-0108)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '6e387663-8be6-4bf9-8d56-df88d3142840', 'MAK-HTL-0108', 'جميرا جبل عمر مكة', 'جميرا جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.4215, 39.821799999999996, 'https://www.google.com/maps/search/?api=1&query=21.4215,39.821799999999996', 554, 'central_outer', TRUE,
    5, '+966 12 5138 4348', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/511152045.webp?k=c9a5c94d0d7feae42e51b09d09dc6d71535f8c4f58caa462cbf1ea08060eb9d6&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 15,103 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('6e387663-8be6-4bf9-8d56-df88d3142840', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/511152045.webp?k=c9a5c94d0d7feae42e51b09d09dc6d71535f8c4f58caa462cbf1ea08060eb9d6&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('6e387663-8be6-4bf9-8d56-df88d3142840', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('6e387663-8be6-4bf9-8d56-df88d3142840', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '299f1b7b-2c31-46ae-9622-8c71a634e9fb', '6e387663-8be6-4bf9-8d56-df88d3142840', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '299f1b7b-2c31-46ae-9622-8c71a634e9fb', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1936.0, 1588.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '6c707e4f-74f9-4b4b-aa14-6297ee267ace', '6e387663-8be6-4bf9-8d56-df88d3142840', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '6c707e4f-74f9-4b4b-aa14-6297ee267ace', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2420.0, 1985.0, 847.0, 662.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '05188da8-f83a-4456-8a91-6cd3160d8d2c', '6e387663-8be6-4bf9-8d56-df88d3142840', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '05188da8-f83a-4456-8a91-6cd3160d8d2c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2904.0, 2382.0, 762.0, 596.0
);


-- --------------------------------------------------------------------
-- فندق: فندق أبراج لو ميريديان مكة المكرمة (MAK-HTL-0109)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '21c217aa-15ce-4329-8b50-21fc68147a77', 'MAK-HTL-0109', 'فندق أبراج لو ميريديان مكة المكرمة', 'فندق أبراج لو ميريديان مكة المكرمة', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.423287000000002, 39.827806, 'https://www.google.com/maps/search/?api=1&query=21.423287000000002,39.827806', 222, 'central_walking', TRUE,
    5, '+966 12 5155 4379', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/630021253.webp?k=c30cafa770dc1a22153c3169726ae4bfc40feaae3388b61be5c441a6ef09a2be&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 2.2 كلم من المركز وبتقييم نزلاء حقيقي 8.5/10 بناء على 4,966 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('21c217aa-15ce-4329-8b50-21fc68147a77', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/630021253.webp?k=c30cafa770dc1a22153c3169726ae4bfc40feaae3388b61be5c441a6ef09a2be&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('21c217aa-15ce-4329-8b50-21fc68147a77', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('21c217aa-15ce-4329-8b50-21fc68147a77', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '9f674600-e39b-4179-8ee4-94215e1b9282', '21c217aa-15ce-4329-8b50-21fc68147a77', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '9f674600-e39b-4179-8ee4-94215e1b9282', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    506.0, 415.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '93a2195f-54e7-409a-92d0-29286815f54c', '21c217aa-15ce-4329-8b50-21fc68147a77', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '93a2195f-54e7-409a-92d0-29286815f54c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    632.0, 519.0, 221.0, 173.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'a6c7051a-53be-4902-b2b7-63a0b59c0d68', '21c217aa-15ce-4329-8b50-21fc68147a77', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'a6c7051a-53be-4902-b2b7-63a0b59c0d68', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    759.0, 622.0, 199.0, 156.0
);


-- --------------------------------------------------------------------
-- فندق: فندق هيلتون المؤتمرات جبل عمر مكة (MAK-HTL-0110)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'af0a3633-836b-4569-aad7-f2c5f9d2ee4b', 'MAK-HTL-0110', 'فندق هيلتون المؤتمرات جبل عمر مكة', 'فندق هيلتون المؤتمرات جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.4231, 39.819399999999995, 'https://www.google.com/maps/search/?api=1&query=21.4231,39.819399999999995', 835, 'central_outer', TRUE,
    5, '+966 12 5172 4410', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742485.webp?k=78647839b7455b7b317018115ad1eceb41e258da1f5c79fc26fb91dc036fa13e&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 8.5/10 بناء على 12,478 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('af0a3633-836b-4569-aad7-f2c5f9d2ee4b', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742485.webp?k=78647839b7455b7b317018115ad1eceb41e258da1f5c79fc26fb91dc036fa13e&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('af0a3633-836b-4569-aad7-f2c5f9d2ee4b', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('af0a3633-836b-4569-aad7-f2c5f9d2ee4b', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'a035f1c0-2298-4c3b-a89e-a9c8b3957ebd', 'af0a3633-836b-4569-aad7-f2c5f9d2ee4b', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'a035f1c0-2298-4c3b-a89e-a9c8b3957ebd', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1602.0, 1314.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'a9bafc82-c22c-4cc4-8658-c0bddc64fb11', 'af0a3633-836b-4569-aad7-f2c5f9d2ee4b', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'a9bafc82-c22c-4cc4-8658-c0bddc64fb11', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2002.0, 1642.0, 701.0, 548.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '78cb318f-338a-445a-bb83-0e1d0430f1ea', 'af0a3633-836b-4569-aad7-f2c5f9d2ee4b', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '78cb318f-338a-445a-bb83-0e1d0430f1ea', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2403.0, 1971.0, 631.0, 493.0
);


-- --------------------------------------------------------------------
-- فندق: فندق لو مريديان مكة المكرمة (MAK-HTL-0111)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'b08324ed-11cd-4515-a21e-df62b44600c0', 'MAK-HTL-0111', 'فندق لو مريديان مكة المكرمة', 'فندق لو مريديان مكة المكرمة', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.424887000000002, 39.825406, 'https://www.google.com/maps/search/?api=1&query=21.424887000000002,39.825406', 330, 'central_walking', TRUE,
    5, '+966 12 5189 4441', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/630017052.webp?k=00a2d4d80f8cfe5e7401db1ad6ff023682aec0656542960bb1f3c98a68a4e8b9&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 400 متر من المركز وبتقييم نزلاء حقيقي 8.6/10 بناء على 3,545 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b08324ed-11cd-4515-a21e-df62b44600c0', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/630017052.webp?k=00a2d4d80f8cfe5e7401db1ad6ff023682aec0656542960bb1f3c98a68a4e8b9&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b08324ed-11cd-4515-a21e-df62b44600c0', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b08324ed-11cd-4515-a21e-df62b44600c0', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '37397537-3ac7-49eb-b134-1e507a764f2f', 'b08324ed-11cd-4515-a21e-df62b44600c0', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '37397537-3ac7-49eb-b134-1e507a764f2f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1497.0, 1228.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '4655c038-cb72-4a45-ad52-11463713bd4c', 'b08324ed-11cd-4515-a21e-df62b44600c0', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '4655c038-cb72-4a45-ad52-11463713bd4c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1871.0, 1535.0, 655.0, 512.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'd7fad8f3-293c-440c-b0b5-43a5d58ca440', 'b08324ed-11cd-4515-a21e-df62b44600c0', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'd7fad8f3-293c-440c-b0b5-43a5d58ca440', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2246.0, 1842.0, 589.0, 460.0
);


-- --------------------------------------------------------------------
-- فندق: هيلتون الأجنحة جبل عمر مكة (MAK-HTL-0112)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '1d397869-4189-4516-9815-e40779f3a9eb', 'MAK-HTL-0112', 'هيلتون الأجنحة جبل عمر مكة', 'هيلتون الأجنحة جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.4191, 39.821, 'https://www.google.com/maps/search/?api=1&query=21.4191,39.821', 776, 'central_outer', TRUE,
    5, '+966 12 5206 4472', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742572.webp?k=26cc8aca851cb6d20e4b055d189f063473ae9bdf00334a4ad31bdf89fab12102&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 500 متر من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 6,689 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('1d397869-4189-4516-9815-e40779f3a9eb', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742572.webp?k=26cc8aca851cb6d20e4b055d189f063473ae9bdf00334a4ad31bdf89fab12102&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('1d397869-4189-4516-9815-e40779f3a9eb', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('1d397869-4189-4516-9815-e40779f3a9eb', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '6e80f9e0-cb21-4da1-86c2-0689bb2ab920', '1d397869-4189-4516-9815-e40779f3a9eb', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '6e80f9e0-cb21-4da1-86c2-0689bb2ab920', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2009.0, 1647.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'b5d31320-17bd-4b1e-8118-54ee3349fe7d', '1d397869-4189-4516-9815-e40779f3a9eb', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'b5d31320-17bd-4b1e-8118-54ee3349fe7d', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2511.0, 2059.0, 879.0, 686.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '78c7ab44-b1c5-4cf6-b22f-4db9552d530c', '1d397869-4189-4516-9815-e40779f3a9eb', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '78c7ab44-b1c5-4cf6-b22f-4db9552d530c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3014.0, 2470.0, 791.0, 618.0
);


-- --------------------------------------------------------------------
-- فندق: Emaar Elite Makkah Hotel (MAK-EMA-0113)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'f1a26bef-2053-4eb9-b479-8350692acbec', 'MAK-EMA-0113', 'Emaar Elite Makkah Hotel', 'Emaar Elite Makkah Hotel', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.420887, 39.827006, 'https://www.google.com/maps/search/?api=1&query=21.420887,39.827006', 232, 'central_walking', TRUE,
    5, '+966 12 5223 4503', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/573196335.webp?k=ebde2e2888246bb1fb2d0e10969f10f8a4ee36bdb6ab0463d1e146caf08e6e48&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 1.5 كلم من المركز وبتقييم نزلاء حقيقي 8.2/10 بناء على 3,552 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f1a26bef-2053-4eb9-b479-8350692acbec', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/573196335.webp?k=ebde2e2888246bb1fb2d0e10969f10f8a4ee36bdb6ab0463d1e146caf08e6e48&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f1a26bef-2053-4eb9-b479-8350692acbec', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f1a26bef-2053-4eb9-b479-8350692acbec', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'e818a02e-36f9-43a7-a903-729dc35728d3', 'f1a26bef-2053-4eb9-b479-8350692acbec', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'e818a02e-36f9-43a7-a903-729dc35728d3', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    363.0, 298.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'eaf8fa3a-46b1-4fc0-be69-e97cf9e71369', 'f1a26bef-2053-4eb9-b479-8350692acbec', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'eaf8fa3a-46b1-4fc0-be69-e97cf9e71369', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    454.0, 372.0, 159.0, 124.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'ba2dbdcd-d837-4204-8021-d4fb041d661f', 'f1a26bef-2053-4eb9-b479-8350692acbec', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'ba2dbdcd-d837-4204-8021-d4fb041d661f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    544.0, 447.0, 143.0, 112.0
);


-- --------------------------------------------------------------------
-- فندق: Royal Almashaer (MAK-ROY-0114)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '91c7a487-6b60-47d0-825d-eda3e03f795e', 'MAK-ROY-0114', 'Royal Almashaer', 'Royal Almashaer', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.421687, 39.827806, 'https://www.google.com/maps/search/?api=1&query=21.421687,39.827806', 222, 'central_walking', TRUE,
    4, '+966 12 5240 4534', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/480645771.webp?k=6e048995b17939ebba5584554389e8ee09ca20a280c575e40736d8d872b1815a&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 6.3 كلم من المركز وبتقييم نزلاء حقيقي 7.3/10 بناء على 97 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('91c7a487-6b60-47d0-825d-eda3e03f795e', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/480645771.webp?k=6e048995b17939ebba5584554389e8ee09ca20a280c575e40736d8d872b1815a&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('91c7a487-6b60-47d0-825d-eda3e03f795e', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('91c7a487-6b60-47d0-825d-eda3e03f795e', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '7036216b-f4ca-4ec0-8af8-5b3b1d009553', '91c7a487-6b60-47d0-825d-eda3e03f795e', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '7036216b-f4ca-4ec0-8af8-5b3b1d009553', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    450.0, 369.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'c9278f1b-08b1-4129-b6e0-766ffe214a03', '91c7a487-6b60-47d0-825d-eda3e03f795e', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'c9278f1b-08b1-4129-b6e0-766ffe214a03', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    562.0, 461.0, 197.0, 154.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'c845c893-1303-4e24-8221-7ffeb28a0f1e', '91c7a487-6b60-47d0-825d-eda3e03f795e', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'c845c893-1303-4e24-8221-7ffeb28a0f1e', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    675.0, 554.0, 177.0, 138.0
);


-- --------------------------------------------------------------------
-- فندق: فور بوينتس باي شيراتون مكة المكرمة النسيم (MAK-HTL-0115)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '78ff4acc-6110-46aa-83c2-477b1a8ec289', 'MAK-HTL-0115', 'فور بوينتس باي شيراتون مكة المكرمة النسيم', 'فور بوينتس باي شيراتون مكة المكرمة النسيم', 'makkah', 'النسيم', 'حي النسيم، مكة المكرمة',
    21.392, 39.880399999999995, 'https://www.google.com/maps/search/?api=1&query=21.392,39.880399999999995', 7735, 'shuttle_bus', FALSE,
    5, '+966 12 5257 4565', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/628113158.webp?k=441a72d2d5f85751aff1932efe4940478614101ca3d745272c82647400a15a53&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي النسيم. يتميز بـ 6.8 كلم من المركز وبتقييم نزلاء حقيقي 8.1/10 بناء على 10,188 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('78ff4acc-6110-46aa-83c2-477b1a8ec289', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/628113158.webp?k=441a72d2d5f85751aff1932efe4940478614101ca3d745272c82647400a15a53&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('78ff4acc-6110-46aa-83c2-477b1a8ec289', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('78ff4acc-6110-46aa-83c2-477b1a8ec289', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '7728066f-0328-4669-b459-1c60b4deac5d', '78ff4acc-6110-46aa-83c2-477b1a8ec289', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '7728066f-0328-4669-b459-1c60b4deac5d', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    371.0, 304.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '3ae87873-1f87-4885-8fc4-0c9fe863c67f', '78ff4acc-6110-46aa-83c2-477b1a8ec289', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '3ae87873-1f87-4885-8fc4-0c9fe863c67f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    464.0, 380.0, 162.0, 127.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'ac7c9c92-99a1-496e-bfc0-445439376925', '78ff4acc-6110-46aa-83c2-477b1a8ec289', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'ac7c9c92-99a1-496e-bfc0-445439376925', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    556.0, 456.0, 146.0, 114.0
);


-- --------------------------------------------------------------------
-- فندق: Al Shohada by Palm Rich Makkah (MAK-SHO-0116)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'c47e264e-233e-416f-991a-bd62d3249cd5', 'MAK-SHO-0116', 'Al Shohada by Palm Rich Makkah', 'Al Shohada by Palm Rich Makkah', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.423287000000002, 39.825406, 'https://www.google.com/maps/search/?api=1&query=21.423287000000002,39.825406', 143, 'central_first_row', TRUE,
    5, '+966 12 5274 4596', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/889507953.webp?k=6aa43f8715e9e1aeb1a4315988d49279e061e4b6b36115d973d333bfbf6d24fd&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 0.9 كلم من المركز وبتقييم نزلاء حقيقي 8.6/10 بناء على 4,073 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('c47e264e-233e-416f-991a-bd62d3249cd5', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/889507953.webp?k=6aa43f8715e9e1aeb1a4315988d49279e061e4b6b36115d973d333bfbf6d24fd&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('c47e264e-233e-416f-991a-bd62d3249cd5', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('c47e264e-233e-416f-991a-bd62d3249cd5', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'cd031650-2d3c-42d5-acb0-909cece90395', 'c47e264e-233e-416f-991a-bd62d3249cd5', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'cd031650-2d3c-42d5-acb0-909cece90395', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1338.0, 1097.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '364c3d02-bf80-4237-b49b-5300b32a9bfe', 'c47e264e-233e-416f-991a-bd62d3249cd5', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '364c3d02-bf80-4237-b49b-5300b32a9bfe', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1672.0, 1371.0, 585.0, 457.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '92ad60e5-f508-4e57-8001-d86b4e1c8ec3', 'c47e264e-233e-416f-991a-bd62d3249cd5', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '92ad60e5-f508-4e57-8001-d86b4e1c8ec3', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2007.0, 1646.0, 527.0, 411.0
);


-- --------------------------------------------------------------------
-- فندق: فندق مكارم أم القرى (MAK-HTL-0117)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '90ce868a-0256-435a-9536-740e3643d65d', 'MAK-HTL-0117', 'فندق مكارم أم القرى', 'فندق مكارم أم القرى', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.424087, 39.826206, 'https://www.google.com/maps/search/?api=1&query=21.424087,39.826206', 210, 'central_walking', TRUE,
    5, '+966 12 5291 4627', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/882263912.webp?k=920909d9256ccbb5badc3142c46c54634263573451a5d8fe45bd09bb366e766a&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 2.2 كلم من المركز وبتقييم نزلاء حقيقي 8.1/10 بناء على 6,914 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('90ce868a-0256-435a-9536-740e3643d65d', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/882263912.webp?k=920909d9256ccbb5badc3142c46c54634263573451a5d8fe45bd09bb366e766a&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('90ce868a-0256-435a-9536-740e3643d65d', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('90ce868a-0256-435a-9536-740e3643d65d', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'a3cf43dc-a157-4f18-a756-2eb108ec209e', '90ce868a-0256-435a-9536-740e3643d65d', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'a3cf43dc-a157-4f18-a756-2eb108ec209e', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    324.0, 266.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'f74fb7a6-9486-42f9-8d11-065368986d4e', '90ce868a-0256-435a-9536-740e3643d65d', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'f74fb7a6-9486-42f9-8d11-065368986d4e', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    405.0, 332.0, 142.0, 111.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'acfe0f35-fa5c-4cbe-bd5a-41c3a910cce0', '90ce868a-0256-435a-9536-740e3643d65d', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'acfe0f35-fa5c-4cbe-bd5a-41c3a910cce0', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    486.0, 399.0, 128.0, 100.0
);


-- --------------------------------------------------------------------
-- فندق: فندق بونسيانا مكة - Poinciana Hotel Makkah (MAK-POI-0118)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '451fc0e5-715b-4185-ba51-f62448d3e0c3', 'MAK-POI-0118', 'فندق بونسيانا مكة - Poinciana Hotel Makkah', 'فندق بونسيانا مكة - Poinciana Hotel Makkah', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.424887000000002, 39.827006, 'https://www.google.com/maps/search/?api=1&query=21.424887000000002,39.827006', 330, 'central_walking', TRUE,
    4, '+966 12 5308 4658', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/804023844.webp?k=afee15ba294117b83fb779cf1dafaac1a1b498a9a3a646a783629bbc1e1607ba&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 1.3 كلم من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 614 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('451fc0e5-715b-4185-ba51-f62448d3e0c3', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/804023844.webp?k=afee15ba294117b83fb779cf1dafaac1a1b498a9a3a646a783629bbc1e1607ba&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('451fc0e5-715b-4185-ba51-f62448d3e0c3', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('451fc0e5-715b-4185-ba51-f62448d3e0c3', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'af96490d-d1b6-4325-ac0b-06fb2022f606', '451fc0e5-715b-4185-ba51-f62448d3e0c3', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'af96490d-d1b6-4325-ac0b-06fb2022f606', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    634.0, 520.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'e005d5b5-4596-44f6-a33e-a9a3927a6b70', '451fc0e5-715b-4185-ba51-f62448d3e0c3', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'e005d5b5-4596-44f6-a33e-a9a3927a6b70', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    792.0, 650.0, 277.0, 217.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'dac4484e-1489-4dd4-842a-7e7e541913aa', '451fc0e5-715b-4185-ba51-f62448d3e0c3', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'dac4484e-1489-4dd4-842a-7e7e541913aa', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    951.0, 780.0, 250.0, 195.0
);


-- --------------------------------------------------------------------
-- فندق: فندق ضيوف المقام واحد توصيل مجاني للحرم - Douof Al Maqam One Hotel Free Shuttle Service (MAK-DOU-0119)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '47543273-9c2a-4a2f-8337-7552b71c9994', 'MAK-DOU-0119', 'فندق ضيوف المقام واحد توصيل مجاني للحرم - Douof Al Maqam One Hotel Free Shuttle Service', 'فندق ضيوف المقام واحد توصيل مجاني للحرم - Douof Al Maqam One Hotel Free Shuttle Service', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.420087, 39.827806, 'https://www.google.com/maps/search/?api=1&query=21.420087,39.827806', 371, 'central_walking', TRUE,
    4, '+966 12 5325 4689', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/674225991.webp?k=799e1aa8ec893a17904d011499c1bf24e0f2978529f894d1364cdf5a346ed4b8&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 2.4 كلم من المركز وبتقييم نزلاء حقيقي 7.8/10 بناء على 1,307 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('47543273-9c2a-4a2f-8337-7552b71c9994', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/674225991.webp?k=799e1aa8ec893a17904d011499c1bf24e0f2978529f894d1364cdf5a346ed4b8&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('47543273-9c2a-4a2f-8337-7552b71c9994', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('47543273-9c2a-4a2f-8337-7552b71c9994', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '15873814-a1e6-4bed-8947-d7d67f51428e', '47543273-9c2a-4a2f-8337-7552b71c9994', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '15873814-a1e6-4bed-8947-d7d67f51428e', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    450.0, 369.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'bbb77646-4933-4c97-b447-2b7fada2a521', '47543273-9c2a-4a2f-8337-7552b71c9994', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'bbb77646-4933-4c97-b447-2b7fada2a521', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    562.0, 461.0, 197.0, 154.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '41254fa3-65af-40bf-aa9d-6b2a562fdfce', '47543273-9c2a-4a2f-8337-7552b71c9994', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '41254fa3-65af-40bf-aa9d-6b2a562fdfce', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    675.0, 554.0, 177.0, 138.0
);


-- --------------------------------------------------------------------
-- فندق: فندق مكارم أجياد مكة (MAK-HTL-0120)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '9ae6bff1-5a73-4f18-8fbc-19fc2fc932f6', 'MAK-HTL-0120', 'فندق مكارم أجياد مكة', 'فندق مكارم أجياد مكة', 'makkah', 'أجياد', 'حي أجياد، مكة المكرمة',
    21.416900000000002, 39.825399999999995, 'https://www.google.com/maps/search/?api=1&query=21.416900000000002,39.825399999999995', 740, 'central_outer', TRUE,
    5, '+966 12 5342 4720', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/921116724.webp?k=cb9b93c1a93c82b012bf527894eb376262b03252d5c1179b5fbefb83d2dd17e2&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي أجياد. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 8.5/10 بناء على 7,408 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('9ae6bff1-5a73-4f18-8fbc-19fc2fc932f6', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/921116724.webp?k=cb9b93c1a93c82b012bf527894eb376262b03252d5c1179b5fbefb83d2dd17e2&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('9ae6bff1-5a73-4f18-8fbc-19fc2fc932f6', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('9ae6bff1-5a73-4f18-8fbc-19fc2fc932f6', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'f2049c96-a71d-4858-a636-f11eefe19e76', '9ae6bff1-5a73-4f18-8fbc-19fc2fc932f6', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'f2049c96-a71d-4858-a636-f11eefe19e76', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1627.0, 1334.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '9cd8d884-50e5-415b-899c-cf64b6df384b', '9ae6bff1-5a73-4f18-8fbc-19fc2fc932f6', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '9cd8d884-50e5-415b-899c-cf64b6df384b', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2034.0, 1668.0, 712.0, 556.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'd471cd59-30da-46d9-b933-9f96d6799b82', '9ae6bff1-5a73-4f18-8fbc-19fc2fc932f6', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'd471cd59-30da-46d9-b933-9f96d6799b82', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2440.0, 2001.0, 641.0, 500.0
);


-- --------------------------------------------------------------------
-- فندق: إيبيس ستايلز مكة (MAK-HTL-0121)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '03e2033f-6e3f-43f2-ac21-b300240d162c', 'MAK-HTL-0121', 'إيبيس ستايلز مكة', 'إيبيس ستايلز مكة', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.421687, 39.825406, 'https://www.google.com/maps/search/?api=1&query=21.421687,39.825406', 143, 'central_first_row', TRUE,
    4, '+966 12 5359 4751', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/914585345.webp?k=4c1b793cd32e333df43ecccafd43425fa9a792acae475fbe3d080e694f06145c&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 3 كلم من المركز وبتقييم نزلاء حقيقي 8.0/10 بناء على 9,180 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('03e2033f-6e3f-43f2-ac21-b300240d162c', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/914585345.webp?k=4c1b793cd32e333df43ecccafd43425fa9a792acae475fbe3d080e694f06145c&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('03e2033f-6e3f-43f2-ac21-b300240d162c', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('03e2033f-6e3f-43f2-ac21-b300240d162c', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '63708767-a9c6-4a0a-8b30-603c984f3cf6', '03e2033f-6e3f-43f2-ac21-b300240d162c', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '63708767-a9c6-4a0a-8b30-603c984f3cf6', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    450.0, 369.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '56db209d-2867-44b0-a9ed-c338214e902e', '03e2033f-6e3f-43f2-ac21-b300240d162c', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '56db209d-2867-44b0-a9ed-c338214e902e', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    562.0, 461.0, 197.0, 154.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'e9ea1c46-1578-44d1-ae77-2f5f636eabcb', '03e2033f-6e3f-43f2-ac21-b300240d162c', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'e9ea1c46-1578-44d1-ae77-2f5f636eabcb', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    675.0, 554.0, 177.0, 138.0
);


-- --------------------------------------------------------------------
-- فندق: كونراد جبل عمر مكة (MAK-HTL-0122)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'd63955c1-8674-40c7-b106-91913ae0eb75', 'MAK-HTL-0122', 'كونراد جبل عمر مكة', 'كونراد جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.4215, 39.821, 'https://www.google.com/maps/search/?api=1&query=21.4215,39.821', 649, 'central_outer', TRUE,
    5, '+966 12 5376 4782', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/928063101.webp?k=4e2b273352bbc2f7827c409b9abff6b3efb8ed788d804955e3ae1bae2d7320e5&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 5,711 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('d63955c1-8674-40c7-b106-91913ae0eb75', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/928063101.webp?k=4e2b273352bbc2f7827c409b9abff6b3efb8ed788d804955e3ae1bae2d7320e5&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('d63955c1-8674-40c7-b106-91913ae0eb75', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('d63955c1-8674-40c7-b106-91913ae0eb75', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'ea1f468d-c108-4a5d-a369-86be3f9dcabf', 'd63955c1-8674-40c7-b106-91913ae0eb75', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'ea1f468d-c108-4a5d-a369-86be3f9dcabf', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2104.0, 1725.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '8ed47230-ec33-4f48-8647-824cce70f8e5', 'd63955c1-8674-40c7-b106-91913ae0eb75', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '8ed47230-ec33-4f48-8647-824cce70f8e5', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2630.0, 2156.0, 920.0, 719.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '54f5481e-206c-4cae-a519-bf685f205cf7', 'd63955c1-8674-40c7-b106-91913ae0eb75', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '54f5481e-206c-4cae-a519-bf685f205cf7', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3156.0, 2588.0, 828.0, 647.0
);


-- --------------------------------------------------------------------
-- فندق: سويس أوتيل مكة (MAK-HTL-0123)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '453abb06-1d02-48bc-9940-b0257ed81004', 'MAK-HTL-0123', 'سويس أوتيل مكة', 'سويس أوتيل مكة', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.423287000000002, 39.827006, 'https://www.google.com/maps/search/?api=1&query=21.423287000000002,39.827006', 143, 'central_first_row', TRUE,
    5, '+966 12 5393 4813', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/820913168.webp?k=25998b04cf075df87e042db5fd946c142647b13b6abb6ab39c4982f21da74843&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 300 متر من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 22,719 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('453abb06-1d02-48bc-9940-b0257ed81004', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/820913168.webp?k=25998b04cf075df87e042db5fd946c142647b13b6abb6ab39c4982f21da74843&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('453abb06-1d02-48bc-9940-b0257ed81004', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('453abb06-1d02-48bc-9940-b0257ed81004', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'b65c6308-cc2e-4d54-ba20-c9181d79efcc', '453abb06-1d02-48bc-9940-b0257ed81004', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'b65c6308-cc2e-4d54-ba20-c9181d79efcc', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2102.0, 1724.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'b4726bbd-7c14-4e0c-a76d-c1416e19636d', '453abb06-1d02-48bc-9940-b0257ed81004', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'b4726bbd-7c14-4e0c-a76d-c1416e19636d', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2628.0, 2155.0, 920.0, 718.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '000e40ee-658a-4acc-a2af-a584d9280f98', '453abb06-1d02-48bc-9940-b0257ed81004', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '000e40ee-658a-4acc-a2af-a584d9280f98', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3153.0, 2586.0, 828.0, 646.0
);


-- --------------------------------------------------------------------
-- فندق: فندق إعمار جراند (MAK-HTL-0124)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'a4c381c8-31b8-4cf3-8abc-de585e2d3193', 'MAK-HTL-0124', 'فندق إعمار جراند', 'فندق إعمار جراند', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.424087, 39.827806, 'https://www.google.com/maps/search/?api=1&query=21.424087,39.827806', 287, 'central_walking', TRUE,
    5, '+966 12 5410 4844', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/520998885.webp?k=a14b6a46aa2d9fd1ccaf612dcbfdc81a53a4c388a91bb51882df23abc73ea40f&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 1.1 كلم من المركز وبتقييم نزلاء حقيقي 8.0/10 بناء على 5,098 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a4c381c8-31b8-4cf3-8abc-de585e2d3193', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/520998885.webp?k=a14b6a46aa2d9fd1ccaf612dcbfdc81a53a4c388a91bb51882df23abc73ea40f&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a4c381c8-31b8-4cf3-8abc-de585e2d3193', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a4c381c8-31b8-4cf3-8abc-de585e2d3193', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '55cec1b2-9e80-4c31-b19d-2bf49cefad92', 'a4c381c8-31b8-4cf3-8abc-de585e2d3193', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '55cec1b2-9e80-4c31-b19d-2bf49cefad92', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    909.0, 745.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '46ddd5cf-4e0f-4138-b2fb-e3cd222bb5ca', 'a4c381c8-31b8-4cf3-8abc-de585e2d3193', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '46ddd5cf-4e0f-4138-b2fb-e3cd222bb5ca', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1136.0, 931.0, 398.0, 310.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'f7b23a45-a067-44be-958a-c5cebdc2743c', 'a4c381c8-31b8-4cf3-8abc-de585e2d3193', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'f7b23a45-a067-44be-958a-c5cebdc2743c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1364.0, 1118.0, 358.0, 279.0
);


-- --------------------------------------------------------------------
-- فندق: DoubleTree by Hilton Makkah Aziziyah (MAK-DOU-0125)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '2cf4b6ae-3824-4c40-9f0d-867a9361a3d2', 'MAK-DOU-0125', 'DoubleTree by Hilton Makkah Aziziyah', 'DoubleTree by Hilton Makkah Aziziyah', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.424887000000002, 39.824605999999996, 'https://www.google.com/maps/search/?api=1&query=21.424887000000002,39.824605999999996', 371, 'central_walking', TRUE,
    5, '+966 12 5427 4875', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/830088943.webp?k=e6b81acf6adb2ca6a1d4a0617f857d693a79eb21e4f3d7d11fd49f36e4115ed7&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 5.4 كلم من المركز وبتقييم نزلاء حقيقي 8.7/10 بناء على 5,775 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2cf4b6ae-3824-4c40-9f0d-867a9361a3d2', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/830088943.webp?k=e6b81acf6adb2ca6a1d4a0617f857d693a79eb21e4f3d7d11fd49f36e4115ed7&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2cf4b6ae-3824-4c40-9f0d-867a9361a3d2', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2cf4b6ae-3824-4c40-9f0d-867a9361a3d2', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'c45f9cd3-684d-48a3-a380-b4852b534e7a', '2cf4b6ae-3824-4c40-9f0d-867a9361a3d2', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'c45f9cd3-684d-48a3-a380-b4852b534e7a', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    364.0, 298.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '07c1b7f7-1037-45fb-a11f-51433d7b9243', '2cf4b6ae-3824-4c40-9f0d-867a9361a3d2', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '07c1b7f7-1037-45fb-a11f-51433d7b9243', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    455.0, 372.0, 159.0, 124.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'f792b86c-eddb-42dc-a120-fd200b642430', '2cf4b6ae-3824-4c40-9f0d-867a9361a3d2', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'f792b86c-eddb-42dc-a120-fd200b642430', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    546.0, 447.0, 143.0, 112.0
);


-- --------------------------------------------------------------------
-- فندق: Rowaa Lindy Hotel Makkah (MAK-ROW-0126)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '9885be00-d048-45d6-b88e-0e19d0e274eb', 'MAK-ROW-0126', 'Rowaa Lindy Hotel Makkah', 'Rowaa Lindy Hotel Makkah', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.420087, 39.825406, 'https://www.google.com/maps/search/?api=1&query=21.420087,39.825406', 330, 'central_walking', TRUE,
    4, '+966 12 5444 4906', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/825494409.webp?k=a5d27bc7ddf298c2ffac3983ede687fe0d28137db2850e2bafde172bd23f8509&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 5.3 كلم من المركز وبتقييم نزلاء حقيقي 7.8/10 بناء على 108 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('9885be00-d048-45d6-b88e-0e19d0e274eb', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/825494409.webp?k=a5d27bc7ddf298c2ffac3983ede687fe0d28137db2850e2bafde172bd23f8509&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('9885be00-d048-45d6-b88e-0e19d0e274eb', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('9885be00-d048-45d6-b88e-0e19d0e274eb', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'ad84a4db-2ee2-4deb-ab23-e62aa3376073', '9885be00-d048-45d6-b88e-0e19d0e274eb', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'ad84a4db-2ee2-4deb-ab23-e62aa3376073', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    450.0, 369.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'fd1690a1-77f2-40fe-b302-782942e4f73c', '9885be00-d048-45d6-b88e-0e19d0e274eb', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'fd1690a1-77f2-40fe-b302-782942e4f73c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    562.0, 461.0, 197.0, 154.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '59279fc0-7ed9-4293-bef7-b70d48d0575b', '9885be00-d048-45d6-b88e-0e19d0e274eb', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '59279fc0-7ed9-4293-bef7-b70d48d0575b', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    675.0, 554.0, 177.0, 138.0
);


-- --------------------------------------------------------------------
-- فندق: voco Makkah by IHG (MAK-VOC-0127)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'ea30f91d-b4bd-457d-952d-7053965fcee7', 'MAK-VOC-0127', 'voco Makkah by IHG', 'voco Makkah by IHG', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.420887, 39.826206, 'https://www.google.com/maps/search/?api=1&query=21.420887,39.826206', 210, 'central_walking', TRUE,
    5, '+966 12 5461 4937', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/427975173.webp?k=c085e75bd694945f26e0dfb54b13550a0342915f82e7e7ae6f599cbed9f0a68e&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 1.8 كلم من المركز وبتقييم نزلاء حقيقي 8.7/10 بناء على 16,923 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('ea30f91d-b4bd-457d-952d-7053965fcee7', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/427975173.webp?k=c085e75bd694945f26e0dfb54b13550a0342915f82e7e7ae6f599cbed9f0a68e&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('ea30f91d-b4bd-457d-952d-7053965fcee7', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('ea30f91d-b4bd-457d-952d-7053965fcee7', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '7c470a2a-c974-4285-9865-b1caa502e599', 'ea30f91d-b4bd-457d-952d-7053965fcee7', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '7c470a2a-c974-4285-9865-b1caa502e599', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    394.0, 323.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '64d15d1d-7ce9-4ae5-be2d-4e3f195670fa', 'ea30f91d-b4bd-457d-952d-7053965fcee7', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '64d15d1d-7ce9-4ae5-be2d-4e3f195670fa', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    492.0, 404.0, 172.0, 135.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'e6517ded-f866-4b0c-85ef-6ee78b9a4cb8', 'ea30f91d-b4bd-457d-952d-7053965fcee7', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'e6517ded-f866-4b0c-85ef-6ee78b9a4cb8', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    591.0, 484.0, 155.0, 121.0
);


-- --------------------------------------------------------------------
-- فندق: العنوان جبل عمر مكة (MAK-HTL-0128)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '96aaba64-37ca-4efd-a296-d002788659a5', 'MAK-HTL-0128', 'العنوان جبل عمر مكة', 'العنوان جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.4207, 39.821799999999996, 'https://www.google.com/maps/search/?api=1&query=21.4207,39.821799999999996', 587, 'central_outer', TRUE,
    5, '+966 12 5478 4968', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/536428550.webp?k=b67de61b70a83bd973e267adc7689cbf26b9abfc16bc5f11c933d65a21c38d19&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.7 كلم من المركز وبتقييم نزلاء حقيقي 8.6/10 بناء على 20,424 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('96aaba64-37ca-4efd-a296-d002788659a5', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/536428550.webp?k=b67de61b70a83bd973e267adc7689cbf26b9abfc16bc5f11c933d65a21c38d19&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('96aaba64-37ca-4efd-a296-d002788659a5', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('96aaba64-37ca-4efd-a296-d002788659a5', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'cdc32be4-fb95-4ce7-a8f7-29bc1d9c6af7', '96aaba64-37ca-4efd-a296-d002788659a5', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'cdc32be4-fb95-4ce7-a8f7-29bc1d9c6af7', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1538.0, 1261.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '0193028e-8447-4b53-bc12-b49559f92e49', '96aaba64-37ca-4efd-a296-d002788659a5', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '0193028e-8447-4b53-bc12-b49559f92e49', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1922.0, 1576.0, 673.0, 525.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'dafa3262-9b55-4559-83c4-5d7ccb426f2b', '96aaba64-37ca-4efd-a296-d002788659a5', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'dafa3262-9b55-4559-83c4-5d7ccb426f2b', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2307.0, 1892.0, 606.0, 473.0
);


-- --------------------------------------------------------------------
-- فندق: جبل عمر حياة ريجنسي مكة (MAK-HTL-0129)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '500d3f31-9aa8-45d2-9cfb-a3d5d3d6f27d', 'MAK-HTL-0129', 'جبل عمر حياة ريجنسي مكة', 'جبل عمر حياة ريجنسي مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.4215, 39.8226, 'https://www.google.com/maps/search/?api=1&query=21.4215,39.8226', 459, 'central_walking', TRUE,
    5, '+966 12 5495 4999', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/892021583.webp?k=b8a646d0005d0b6e6ae136c9e7375eb36b562ff5bef3f71f8ce123fab67690df&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 450 متر من المركز وبتقييم نزلاء حقيقي 8.8/10 بناء على 21,384 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('500d3f31-9aa8-45d2-9cfb-a3d5d3d6f27d', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/892021583.webp?k=b8a646d0005d0b6e6ae136c9e7375eb36b562ff5bef3f71f8ce123fab67690df&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('500d3f31-9aa8-45d2-9cfb-a3d5d3d6f27d', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('500d3f31-9aa8-45d2-9cfb-a3d5d3d6f27d', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'bd48b79f-efc3-40a1-a85e-ff723ddbd3e8', '500d3f31-9aa8-45d2-9cfb-a3d5d3d6f27d', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'bd48b79f-efc3-40a1-a85e-ff723ddbd3e8', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1743.0, 1429.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '367d3d3d-cc31-4935-a4b1-ddb9f441e3cb', '500d3f31-9aa8-45d2-9cfb-a3d5d3d6f27d', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '367d3d3d-cc31-4935-a4b1-ddb9f441e3cb', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2179.0, 1786.0, 763.0, 595.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'aa134bd9-1ad7-494a-8e8b-f03b1cb764d1', '500d3f31-9aa8-45d2-9cfb-a3d5d3d6f27d', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'aa134bd9-1ad7-494a-8e8b-f03b1cb764d1', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2614.0, 2144.0, 686.0, 536.0
);


-- --------------------------------------------------------------------
-- فندق: Rotana Jabal Omar Makkah (MAK-ROT-0130)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'c9ea92c0-982f-4c24-b2d5-34a1665a5d3b', 'MAK-ROT-0130', 'Rotana Jabal Omar Makkah', 'Rotana Jabal Omar Makkah', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.423287000000002, 39.824605999999996, 'https://www.google.com/maps/search/?api=1&query=21.423287000000002,39.824605999999996', 222, 'central_walking', TRUE,
    5, '+966 12 5512 5030', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/903317076.webp?k=3dd89e628101487c91c960f31d01deecefabc1b37653a481a61c9a8c89a7b36f&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 9.2/10 بناء على 1,725 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('c9ea92c0-982f-4c24-b2d5-34a1665a5d3b', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/903317076.webp?k=3dd89e628101487c91c960f31d01deecefabc1b37653a481a61c9a8c89a7b36f&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('c9ea92c0-982f-4c24-b2d5-34a1665a5d3b', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('c9ea92c0-982f-4c24-b2d5-34a1665a5d3b', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'b40243ff-5356-4c5e-bed7-bd2483e2afd0', 'c9ea92c0-982f-4c24-b2d5-34a1665a5d3b', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'b40243ff-5356-4c5e-bed7-bd2483e2afd0', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1509.0, 1237.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'af5bf24e-0a44-4bb6-ab0b-05a3db770795', 'c9ea92c0-982f-4c24-b2d5-34a1665a5d3b', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'af5bf24e-0a44-4bb6-ab0b-05a3db770795', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1886.0, 1546.0, 660.0, 515.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '0df419af-49d1-4113-88c3-5aad4dbf9b19', 'c9ea92c0-982f-4c24-b2d5-34a1665a5d3b', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '0df419af-49d1-4113-88c3-5aad4dbf9b19', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2264.0, 1856.0, 594.0, 464.0
);


-- --------------------------------------------------------------------
-- فندق: دبل تري باي هيلتون جبل عمر مكة (MAK-HTL-0131)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'e6e0e118-0da6-47f1-8b10-c40edcfbb563', 'MAK-HTL-0131', 'دبل تري باي هيلتون جبل عمر مكة', 'دبل تري باي هيلتون جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.4231, 39.8202, 'https://www.google.com/maps/search/?api=1&query=21.4231,39.8202', 738, 'central_outer', TRUE,
    5, '+966 12 5529 5061', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742076.webp?k=5a39fcf0033115dd3a6f6750403fee0e744c9ade0fa968c27b698cb343f49658&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.8 كلم من المركز وبتقييم نزلاء حقيقي 8.5/10 بناء على 9,257 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e6e0e118-0da6-47f1-8b10-c40edcfbb563', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742076.webp?k=5a39fcf0033115dd3a6f6750403fee0e744c9ade0fa968c27b698cb343f49658&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e6e0e118-0da6-47f1-8b10-c40edcfbb563', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e6e0e118-0da6-47f1-8b10-c40edcfbb563', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '7d28af00-2512-4b61-8b43-877055202329', 'e6e0e118-0da6-47f1-8b10-c40edcfbb563', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '7d28af00-2512-4b61-8b43-877055202329', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1411.0, 1157.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '71402215-edfb-4dcc-9424-68ba978d4b08', 'e6e0e118-0da6-47f1-8b10-c40edcfbb563', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '71402215-edfb-4dcc-9424-68ba978d4b08', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1764.0, 1446.0, 617.0, 482.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '558ff1e5-00e1-48e6-bf27-c32af0b489c1', 'e6e0e118-0da6-47f1-8b10-c40edcfbb563', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '558ff1e5-00e1-48e6-bf27-c32af0b489c1', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2116.0, 1736.0, 556.0, 434.0
);


-- --------------------------------------------------------------------
-- فندق: InterContinental Dar Al Tawhid Makkah by IHG (MAK-INT-0132)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'f7f573eb-c568-42c0-9e7c-651d6d55c659', 'MAK-INT-0132', 'InterContinental Dar Al Tawhid Makkah by IHG', 'InterContinental Dar Al Tawhid Makkah by IHG', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.424887000000002, 39.826206, 'https://www.google.com/maps/search/?api=1&query=21.424887000000002,39.826206', 315, 'central_walking', TRUE,
    5, '+966 12 5546 5092', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/245762423.webp?k=e03c2a2dba939986cb7fb7b56f203353672fe39c2ae3b5446d7e52dade455506&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 450 متر من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 3,707 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f7f573eb-c568-42c0-9e7c-651d6d55c659', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/245762423.webp?k=e03c2a2dba939986cb7fb7b56f203353672fe39c2ae3b5446d7e52dade455506&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f7f573eb-c568-42c0-9e7c-651d6d55c659', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f7f573eb-c568-42c0-9e7c-651d6d55c659', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'd9c30e80-59ae-4af8-928c-deeabec780c1', 'f7f573eb-c568-42c0-9e7c-651d6d55c659', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'd9c30e80-59ae-4af8-928c-deeabec780c1', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2512.0, 2060.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '35f706cf-2ace-4462-b524-1e51c0113361', 'f7f573eb-c568-42c0-9e7c-651d6d55c659', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '35f706cf-2ace-4462-b524-1e51c0113361', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3140.0, 2575.0, 1099.0, 858.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'c1e95bbc-3550-489d-a93d-d2fc82d8c3d9', 'f7f573eb-c568-42c0-9e7c-651d6d55c659', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'c1e95bbc-3550-489d-a93d-d2fc82d8c3d9', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3768.0, 3090.0, 989.0, 772.0
);


-- --------------------------------------------------------------------
-- فندق: فندق إعمار الخليل (MAK-HTL-0133)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'a54a5b34-1430-4fd8-ae7a-23b496d04d7e', 'MAK-HTL-0133', 'فندق إعمار الخليل', 'فندق إعمار الخليل', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.420087, 39.827006, 'https://www.google.com/maps/search/?api=1&query=21.420087,39.827006', 330, 'central_walking', TRUE,
    5, '+966 12 5563 5123', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/629328722.webp?k=30524e06e8b7538f8f649a4a663cd520e6ebb390e7eaf01cfd8f3c9dc73ab534&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 0.9 كلم من المركز وبتقييم نزلاء حقيقي 7.2/10 بناء على 1,732 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a54a5b34-1430-4fd8-ae7a-23b496d04d7e', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/629328722.webp?k=30524e06e8b7538f8f649a4a663cd520e6ebb390e7eaf01cfd8f3c9dc73ab534&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a54a5b34-1430-4fd8-ae7a-23b496d04d7e', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a54a5b34-1430-4fd8-ae7a-23b496d04d7e', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '474237e4-92df-49fa-a2d6-74d2dcafb9c4', 'a54a5b34-1430-4fd8-ae7a-23b496d04d7e', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '474237e4-92df-49fa-a2d6-74d2dcafb9c4', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    757.0, 621.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'b7e712a9-923d-424a-97c1-57235b6eaa95', 'a54a5b34-1430-4fd8-ae7a-23b496d04d7e', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'b7e712a9-923d-424a-97c1-57235b6eaa95', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    946.0, 776.0, 331.0, 259.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'a776dbab-fd37-4594-8373-971d629b689b', 'a54a5b34-1430-4fd8-ae7a-23b496d04d7e', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'a776dbab-fd37-4594-8373-971d629b689b', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1136.0, 932.0, 298.0, 233.0
);


-- --------------------------------------------------------------------
-- فندق: جميرا جبل عمر مكة (MAK-HTL-0134)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'af1f9e50-6fac-4de3-b9f1-a55d4c380e84', 'MAK-HTL-0134', 'جميرا جبل عمر مكة', 'جميرا جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.419900000000002, 39.8226, 'https://www.google.com/maps/search/?api=1&query=21.419900000000002,39.8226', 556, 'central_outer', TRUE,
    5, '+966 12 5580 5154', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/511152045.webp?k=c9a5c94d0d7feae42e51b09d09dc6d71535f8c4f58caa462cbf1ea08060eb9d6&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 15,103 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('af1f9e50-6fac-4de3-b9f1-a55d4c380e84', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/511152045.webp?k=c9a5c94d0d7feae42e51b09d09dc6d71535f8c4f58caa462cbf1ea08060eb9d6&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('af1f9e50-6fac-4de3-b9f1-a55d4c380e84', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('af1f9e50-6fac-4de3-b9f1-a55d4c380e84', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'ec3850da-8d19-49fd-a6ff-039b01e00fdd', 'af1f9e50-6fac-4de3-b9f1-a55d4c380e84', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'ec3850da-8d19-49fd-a6ff-039b01e00fdd', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1936.0, 1588.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '1b1ed8a5-9e8d-40c9-909e-323322c6c04d', 'af1f9e50-6fac-4de3-b9f1-a55d4c380e84', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '1b1ed8a5-9e8d-40c9-909e-323322c6c04d', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2420.0, 1985.0, 847.0, 662.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '446bfa56-22ec-4575-98bc-6d9cc767d8ef', 'af1f9e50-6fac-4de3-b9f1-a55d4c380e84', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '446bfa56-22ec-4575-98bc-6d9cc767d8ef', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2904.0, 2382.0, 762.0, 596.0
);


-- --------------------------------------------------------------------
-- فندق: فندق أبراج لو ميريديان مكة المكرمة (MAK-HTL-0135)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'b0f6c9ad-506b-47ff-b393-02c5e00e7c89', 'MAK-HTL-0135', 'فندق أبراج لو ميريديان مكة المكرمة', 'فندق أبراج لو ميريديان مكة المكرمة', 'makkah', 'الشبيكة', 'حي المنطقة المركزية، مكة المكرمة',
    21.421687, 39.824605999999996, 'https://www.google.com/maps/search/?api=1&query=21.421687,39.824605999999996', 222, 'central_walking', TRUE,
    5, '+966 12 5597 5185', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/630021253.webp?k=c30cafa770dc1a22153c3169726ae4bfc40feaae3388b61be5c441a6ef09a2be&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 2.2 كلم من المركز وبتقييم نزلاء حقيقي 8.5/10 بناء على 4,966 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b0f6c9ad-506b-47ff-b393-02c5e00e7c89', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/630021253.webp?k=c30cafa770dc1a22153c3169726ae4bfc40feaae3388b61be5c441a6ef09a2be&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b0f6c9ad-506b-47ff-b393-02c5e00e7c89', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b0f6c9ad-506b-47ff-b393-02c5e00e7c89', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '4e84a3eb-db33-46a3-aabf-1a28185f21ef', 'b0f6c9ad-506b-47ff-b393-02c5e00e7c89', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '4e84a3eb-db33-46a3-aabf-1a28185f21ef', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    506.0, 415.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'bc12d482-0e5e-4889-ae68-100c42a2ba32', 'b0f6c9ad-506b-47ff-b393-02c5e00e7c89', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'bc12d482-0e5e-4889-ae68-100c42a2ba32', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    632.0, 519.0, 221.0, 173.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '6f27ca11-6afd-46f4-be26-c09da6447562', 'b0f6c9ad-506b-47ff-b393-02c5e00e7c89', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '6f27ca11-6afd-46f4-be26-c09da6447562', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    759.0, 622.0, 199.0, 156.0
);


-- --------------------------------------------------------------------
-- فندق: فندق هيلتون المؤتمرات جبل عمر مكة (MAK-HTL-0136)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '727f6458-57f0-4fa8-bf96-b3c1f1b89cf9', 'MAK-HTL-0136', 'فندق هيلتون المؤتمرات جبل عمر مكة', 'فندق هيلتون المؤتمرات جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.4215, 39.8202, 'https://www.google.com/maps/search/?api=1&query=21.4215,39.8202', 745, 'central_outer', TRUE,
    5, '+966 12 5614 5216', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742485.webp?k=78647839b7455b7b317018115ad1eceb41e258da1f5c79fc26fb91dc036fa13e&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 8.5/10 بناء على 12,478 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('727f6458-57f0-4fa8-bf96-b3c1f1b89cf9', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742485.webp?k=78647839b7455b7b317018115ad1eceb41e258da1f5c79fc26fb91dc036fa13e&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('727f6458-57f0-4fa8-bf96-b3c1f1b89cf9', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('727f6458-57f0-4fa8-bf96-b3c1f1b89cf9', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'de7a0730-d2ad-4f10-b7e7-1828bec23230', '727f6458-57f0-4fa8-bf96-b3c1f1b89cf9', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'de7a0730-d2ad-4f10-b7e7-1828bec23230', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1602.0, 1314.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '08b11889-9240-436b-9add-1e862234138f', '727f6458-57f0-4fa8-bf96-b3c1f1b89cf9', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '08b11889-9240-436b-9add-1e862234138f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2002.0, 1642.0, 701.0, 548.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'b71226dc-8515-4acb-8813-a8a24eb54fb4', '727f6458-57f0-4fa8-bf96-b3c1f1b89cf9', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'b71226dc-8515-4acb-8813-a8a24eb54fb4', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2403.0, 1971.0, 631.0, 493.0
);


-- --------------------------------------------------------------------
-- فندق: فندق لو مريديان مكة المكرمة (MAK-HTL-0137)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '22d2453b-9a9e-476b-ade0-6e785b943a81', 'MAK-HTL-0137', 'فندق لو مريديان مكة المكرمة', 'فندق لو مريديان مكة المكرمة', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.423287000000002, 39.826206, 'https://www.google.com/maps/search/?api=1&query=21.423287000000002,39.826206', 105, 'central_first_row', TRUE,
    5, '+966 12 5631 5247', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/630017052.webp?k=00a2d4d80f8cfe5e7401db1ad6ff023682aec0656542960bb1f3c98a68a4e8b9&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 400 متر من المركز وبتقييم نزلاء حقيقي 8.6/10 بناء على 3,545 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('22d2453b-9a9e-476b-ade0-6e785b943a81', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/630017052.webp?k=00a2d4d80f8cfe5e7401db1ad6ff023682aec0656542960bb1f3c98a68a4e8b9&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('22d2453b-9a9e-476b-ade0-6e785b943a81', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('22d2453b-9a9e-476b-ade0-6e785b943a81', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '73db9fbf-31d5-4ed2-9d1b-8b495407cc06', '22d2453b-9a9e-476b-ade0-6e785b943a81', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '73db9fbf-31d5-4ed2-9d1b-8b495407cc06', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1497.0, 1228.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '3014fb2b-33c4-4f15-9a06-f5dc05fbe755', '22d2453b-9a9e-476b-ade0-6e785b943a81', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '3014fb2b-33c4-4f15-9a06-f5dc05fbe755', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1871.0, 1535.0, 655.0, 512.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '1a15643b-2a84-4e3c-ba48-9ac56986a6b7', '22d2453b-9a9e-476b-ade0-6e785b943a81', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '1a15643b-2a84-4e3c-ba48-9ac56986a6b7', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2246.0, 1842.0, 589.0, 460.0
);


-- --------------------------------------------------------------------
-- فندق: هيلتون الأجنحة جبل عمر مكة (MAK-HTL-0138)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '57350797-8104-4e14-894e-c99624224c64', 'MAK-HTL-0138', 'هيلتون الأجنحة جبل عمر مكة', 'هيلتون الأجنحة جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.4231, 39.821799999999996, 'https://www.google.com/maps/search/?api=1&query=21.4231,39.821799999999996', 544, 'central_outer', TRUE,
    5, '+966 12 5648 5278', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742572.webp?k=26cc8aca851cb6d20e4b055d189f063473ae9bdf00334a4ad31bdf89fab12102&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 500 متر من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 6,689 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('57350797-8104-4e14-894e-c99624224c64', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/483742572.webp?k=26cc8aca851cb6d20e4b055d189f063473ae9bdf00334a4ad31bdf89fab12102&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('57350797-8104-4e14-894e-c99624224c64', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('57350797-8104-4e14-894e-c99624224c64', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'b78a5959-0670-4d8d-ba02-acacb5807f9c', '57350797-8104-4e14-894e-c99624224c64', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'b78a5959-0670-4d8d-ba02-acacb5807f9c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2009.0, 1647.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '8717aaec-90f4-453a-948e-5dc4a3f263d9', '57350797-8104-4e14-894e-c99624224c64', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '8717aaec-90f4-453a-948e-5dc4a3f263d9', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2511.0, 2059.0, 879.0, 686.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '3a72d04b-04bf-4073-8f30-cae01ec41517', '57350797-8104-4e14-894e-c99624224c64', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '3a72d04b-04bf-4073-8f30-cae01ec41517', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3014.0, 2470.0, 791.0, 618.0
);


-- --------------------------------------------------------------------
-- فندق: Royal Almashaer (MAK-ROY-0139)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '38f84c8c-0ee3-485f-8b43-6e20307de524', 'MAK-ROY-0139', 'Royal Almashaer', 'Royal Almashaer', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.424887000000002, 39.827806, 'https://www.google.com/maps/search/?api=1&query=21.424887000000002,39.827806', 371, 'central_walking', TRUE,
    4, '+966 12 5665 5309', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/480645771.webp?k=6e048995b17939ebba5584554389e8ee09ca20a280c575e40736d8d872b1815a&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 6.3 كلم من المركز وبتقييم نزلاء حقيقي 7.3/10 بناء على 97 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('38f84c8c-0ee3-485f-8b43-6e20307de524', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/480645771.webp?k=6e048995b17939ebba5584554389e8ee09ca20a280c575e40736d8d872b1815a&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('38f84c8c-0ee3-485f-8b43-6e20307de524', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('38f84c8c-0ee3-485f-8b43-6e20307de524', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'c41ae5b6-3424-4cb7-94f6-05622f783815', '38f84c8c-0ee3-485f-8b43-6e20307de524', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'c41ae5b6-3424-4cb7-94f6-05622f783815', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    450.0, 369.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'b04b01b9-f4b8-4ea5-80de-36432c72af4c', '38f84c8c-0ee3-485f-8b43-6e20307de524', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'b04b01b9-f4b8-4ea5-80de-36432c72af4c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    562.0, 461.0, 197.0, 154.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '0be56e3a-9a58-49a0-899d-8c0af00205a7', '38f84c8c-0ee3-485f-8b43-6e20307de524', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '0be56e3a-9a58-49a0-899d-8c0af00205a7', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    675.0, 554.0, 177.0, 138.0
);


-- --------------------------------------------------------------------
-- فندق: Emaar Elite Makkah Hotel (MAK-EMA-0140)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'a47fade1-67a8-4ccd-82c7-0c57744c20ac', 'MAK-EMA-0140', 'Emaar Elite Makkah Hotel', 'Emaar Elite Makkah Hotel', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.420087, 39.824605999999996, 'https://www.google.com/maps/search/?api=1&query=21.420087,39.824605999999996', 371, 'central_walking', TRUE,
    5, '+966 12 5682 5340', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/573196335.webp?k=ebde2e2888246bb1fb2d0e10969f10f8a4ee36bdb6ab0463d1e146caf08e6e48&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 1.5 كلم من المركز وبتقييم نزلاء حقيقي 8.2/10 بناء على 3,552 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a47fade1-67a8-4ccd-82c7-0c57744c20ac', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/573196335.webp?k=ebde2e2888246bb1fb2d0e10969f10f8a4ee36bdb6ab0463d1e146caf08e6e48&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a47fade1-67a8-4ccd-82c7-0c57744c20ac', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a47fade1-67a8-4ccd-82c7-0c57744c20ac', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '30e22699-13d5-4289-a579-67faf942b98e', 'a47fade1-67a8-4ccd-82c7-0c57744c20ac', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '30e22699-13d5-4289-a579-67faf942b98e', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    363.0, 298.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '049485a5-8e3c-475b-9681-35f4d7043bda', 'a47fade1-67a8-4ccd-82c7-0c57744c20ac', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '049485a5-8e3c-475b-9681-35f4d7043bda', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    454.0, 372.0, 159.0, 124.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '39086f0a-3403-4f44-bb2e-698c88b74167', 'a47fade1-67a8-4ccd-82c7-0c57744c20ac', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '39086f0a-3403-4f44-bb2e-698c88b74167', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    544.0, 447.0, 143.0, 112.0
);


-- --------------------------------------------------------------------
-- فندق: فور بوينتس باي شيراتون مكة المكرمة النسيم (MAK-HTL-0141)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '56d79025-650f-48d6-b13c-79ffb34165fb', 'MAK-HTL-0141', 'فور بوينتس باي شيراتون مكة المكرمة النسيم', 'فور بوينتس باي شيراتون مكة المكرمة النسيم', 'makkah', 'النسيم', 'حي النسيم، مكة المكرمة',
    21.3904, 39.8812, 'https://www.google.com/maps/search/?api=1&query=21.3904,39.8812', 7928, 'shuttle_bus', FALSE,
    5, '+966 12 5699 5371', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/628113158.webp?k=441a72d2d5f85751aff1932efe4940478614101ca3d745272c82647400a15a53&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي النسيم. يتميز بـ 6.8 كلم من المركز وبتقييم نزلاء حقيقي 8.1/10 بناء على 10,188 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('56d79025-650f-48d6-b13c-79ffb34165fb', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/628113158.webp?k=441a72d2d5f85751aff1932efe4940478614101ca3d745272c82647400a15a53&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('56d79025-650f-48d6-b13c-79ffb34165fb', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('56d79025-650f-48d6-b13c-79ffb34165fb', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '8b4bb01e-b8f6-4a68-b1d3-be0396e5ee87', '56d79025-650f-48d6-b13c-79ffb34165fb', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '8b4bb01e-b8f6-4a68-b1d3-be0396e5ee87', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    371.0, 304.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '220b89fb-842f-40a1-acb8-e2fb72d416ea', '56d79025-650f-48d6-b13c-79ffb34165fb', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '220b89fb-842f-40a1-acb8-e2fb72d416ea', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    464.0, 380.0, 162.0, 127.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '2d16a8a8-7c56-4ae6-9c4c-55594e69c3d3', '56d79025-650f-48d6-b13c-79ffb34165fb', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '2d16a8a8-7c56-4ae6-9c4c-55594e69c3d3', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    556.0, 456.0, 146.0, 114.0
);


-- --------------------------------------------------------------------
-- فندق: Al Shohada by Palm Rich Makkah (MAK-SHO-0142)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'cf5be79f-dbff-4052-8add-0788902defb8', 'MAK-SHO-0142', 'Al Shohada by Palm Rich Makkah', 'Al Shohada by Palm Rich Makkah', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.421687, 39.826206, 'https://www.google.com/maps/search/?api=1&query=21.421687,39.826206', 105, 'central_first_row', TRUE,
    5, '+966 12 5716 5402', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/889507953.webp?k=6aa43f8715e9e1aeb1a4315988d49279e061e4b6b36115d973d333bfbf6d24fd&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 0.9 كلم من المركز وبتقييم نزلاء حقيقي 8.6/10 بناء على 4,073 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('cf5be79f-dbff-4052-8add-0788902defb8', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/889507953.webp?k=6aa43f8715e9e1aeb1a4315988d49279e061e4b6b36115d973d333bfbf6d24fd&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('cf5be79f-dbff-4052-8add-0788902defb8', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('cf5be79f-dbff-4052-8add-0788902defb8', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '24ce9420-0a19-42bc-b89d-9d5e09857149', 'cf5be79f-dbff-4052-8add-0788902defb8', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '24ce9420-0a19-42bc-b89d-9d5e09857149', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1338.0, 1097.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'b852459c-4206-405d-9237-16d1718fd7d1', 'cf5be79f-dbff-4052-8add-0788902defb8', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'b852459c-4206-405d-9237-16d1718fd7d1', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1672.0, 1371.0, 585.0, 457.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '91e115a7-a007-405b-957f-f6e87c70d015', 'cf5be79f-dbff-4052-8add-0788902defb8', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '91e115a7-a007-405b-957f-f6e87c70d015', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2007.0, 1646.0, 527.0, 411.0
);


-- --------------------------------------------------------------------
-- فندق: فندق مكارم أم القرى (MAK-HTL-0143)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '7f9445e3-87ea-4a37-b9ec-61d2fc016e27', 'MAK-HTL-0143', 'فندق مكارم أم القرى', 'فندق مكارم أم القرى', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.422487, 39.827006, 'https://www.google.com/maps/search/?api=1&query=21.422487,39.827006', 98, 'central_first_row', TRUE,
    5, '+966 12 5733 5433', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/882263912.webp?k=920909d9256ccbb5badc3142c46c54634263573451a5d8fe45bd09bb366e766a&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 2.2 كلم من المركز وبتقييم نزلاء حقيقي 8.1/10 بناء على 6,914 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('7f9445e3-87ea-4a37-b9ec-61d2fc016e27', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/882263912.webp?k=920909d9256ccbb5badc3142c46c54634263573451a5d8fe45bd09bb366e766a&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('7f9445e3-87ea-4a37-b9ec-61d2fc016e27', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('7f9445e3-87ea-4a37-b9ec-61d2fc016e27', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '3f4e0cff-7de6-437c-9c93-48107dffecfe', '7f9445e3-87ea-4a37-b9ec-61d2fc016e27', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '3f4e0cff-7de6-437c-9c93-48107dffecfe', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    324.0, 266.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '23051410-a6bc-42e4-a4e8-674593bb8780', '7f9445e3-87ea-4a37-b9ec-61d2fc016e27', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '23051410-a6bc-42e4-a4e8-674593bb8780', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    405.0, 332.0, 142.0, 111.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'a2696c54-ed69-4e50-9f92-345ceec85894', '7f9445e3-87ea-4a37-b9ec-61d2fc016e27', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'a2696c54-ed69-4e50-9f92-345ceec85894', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    486.0, 399.0, 128.0, 100.0
);


-- --------------------------------------------------------------------
-- فندق: فندق بونسيانا مكة - Poinciana Hotel Makkah (MAK-POI-0144)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '5f1a462d-45b7-43ad-b802-9958513e9011', 'MAK-POI-0144', 'فندق بونسيانا مكة - Poinciana Hotel Makkah', 'فندق بونسيانا مكة - Poinciana Hotel Makkah', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.423287000000002, 39.827806, 'https://www.google.com/maps/search/?api=1&query=21.423287000000002,39.827806', 222, 'central_walking', TRUE,
    4, '+966 12 5750 5464', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/804023844.webp?k=afee15ba294117b83fb779cf1dafaac1a1b498a9a3a646a783629bbc1e1607ba&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 1.3 كلم من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 614 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5f1a462d-45b7-43ad-b802-9958513e9011', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/804023844.webp?k=afee15ba294117b83fb779cf1dafaac1a1b498a9a3a646a783629bbc1e1607ba&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5f1a462d-45b7-43ad-b802-9958513e9011', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5f1a462d-45b7-43ad-b802-9958513e9011', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '5206db51-7307-4ef1-a79d-f08f3a13e529', '5f1a462d-45b7-43ad-b802-9958513e9011', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '5206db51-7307-4ef1-a79d-f08f3a13e529', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    634.0, 520.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'd0bb5fa2-9f01-49f8-9138-c84a298afc62', '5f1a462d-45b7-43ad-b802-9958513e9011', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'd0bb5fa2-9f01-49f8-9138-c84a298afc62', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    792.0, 650.0, 277.0, 217.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'e726e77b-e090-4573-a701-b904318090fd', '5f1a462d-45b7-43ad-b802-9958513e9011', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'e726e77b-e090-4573-a701-b904318090fd', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    951.0, 780.0, 250.0, 195.0
);


-- --------------------------------------------------------------------
-- فندق: فندق ضيوف المقام واحد توصيل مجاني للحرم - Douof Al Maqam One Hotel Free Shuttle Service (MAK-DOU-0145)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '5e50ecdc-8c2e-4942-819a-5d295daef3f4', 'MAK-DOU-0145', 'فندق ضيوف المقام واحد توصيل مجاني للحرم - Douof Al Maqam One Hotel Free Shuttle Service', 'فندق ضيوف المقام واحد توصيل مجاني للحرم - Douof Al Maqam One Hotel Free Shuttle Service', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.424087, 39.824605999999996, 'https://www.google.com/maps/search/?api=1&query=21.424087,39.824605999999996', 287, 'central_walking', TRUE,
    4, '+966 12 5767 5495', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/674225991.webp?k=799e1aa8ec893a17904d011499c1bf24e0f2978529f894d1364cdf5a346ed4b8&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 2.4 كلم من المركز وبتقييم نزلاء حقيقي 7.8/10 بناء على 1,307 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5e50ecdc-8c2e-4942-819a-5d295daef3f4', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/674225991.webp?k=799e1aa8ec893a17904d011499c1bf24e0f2978529f894d1364cdf5a346ed4b8&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5e50ecdc-8c2e-4942-819a-5d295daef3f4', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5e50ecdc-8c2e-4942-819a-5d295daef3f4', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '0956d559-7026-4d83-9b8f-5d1fc984f481', '5e50ecdc-8c2e-4942-819a-5d295daef3f4', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '0956d559-7026-4d83-9b8f-5d1fc984f481', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    450.0, 369.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '83fe8ab4-df81-4aaf-918e-5118534fd283', '5e50ecdc-8c2e-4942-819a-5d295daef3f4', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '83fe8ab4-df81-4aaf-918e-5118534fd283', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    562.0, 461.0, 197.0, 154.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '325a3c18-8cf1-4bcb-b400-c02eca4fae3f', '5e50ecdc-8c2e-4942-819a-5d295daef3f4', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '325a3c18-8cf1-4bcb-b400-c02eca4fae3f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    675.0, 554.0, 177.0, 138.0
);


-- --------------------------------------------------------------------
-- فندق: فندق مكارم أجياد مكة (MAK-HTL-0146)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '74e469d2-9b83-4093-bb0b-8c5594002422', 'MAK-HTL-0146', 'فندق مكارم أجياد مكة', 'فندق مكارم أجياد مكة', 'makkah', 'أجياد', 'حي أجياد، مكة المكرمة',
    21.420900000000003, 39.8262, 'https://www.google.com/maps/search/?api=1&query=21.420900000000003,39.8262', 208, 'central_walking', TRUE,
    5, '+966 12 5784 5526', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/921116724.webp?k=cb9b93c1a93c82b012bf527894eb376262b03252d5c1179b5fbefb83d2dd17e2&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي أجياد. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 8.5/10 بناء على 7,408 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('74e469d2-9b83-4093-bb0b-8c5594002422', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/921116724.webp?k=cb9b93c1a93c82b012bf527894eb376262b03252d5c1179b5fbefb83d2dd17e2&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('74e469d2-9b83-4093-bb0b-8c5594002422', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('74e469d2-9b83-4093-bb0b-8c5594002422', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '5df60bdc-2909-46fd-83ef-ca18f09eff45', '74e469d2-9b83-4093-bb0b-8c5594002422', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '5df60bdc-2909-46fd-83ef-ca18f09eff45', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1627.0, 1334.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '9b1715f5-d8ec-453a-a121-0ec24cd6b91a', '74e469d2-9b83-4093-bb0b-8c5594002422', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '9b1715f5-d8ec-453a-a121-0ec24cd6b91a', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2034.0, 1668.0, 712.0, 556.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '0d60a951-f69a-48e3-9c08-2ac0022826c6', '74e469d2-9b83-4093-bb0b-8c5594002422', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '0d60a951-f69a-48e3-9c08-2ac0022826c6', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2440.0, 2001.0, 641.0, 500.0
);


-- --------------------------------------------------------------------
-- فندق: إيبيس ستايلز مكة (MAK-HTL-0147)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '9e8cf271-6f90-43ec-9784-ceaa72fbb1c6', 'MAK-HTL-0147', 'إيبيس ستايلز مكة', 'إيبيس ستايلز مكة', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.420087, 39.826206, 'https://www.google.com/maps/search/?api=1&query=21.420087,39.826206', 315, 'central_walking', TRUE,
    4, '+966 12 5801 5557', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/914585345.webp?k=4c1b793cd32e333df43ecccafd43425fa9a792acae475fbe3d080e694f06145c&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 3 كلم من المركز وبتقييم نزلاء حقيقي 8.0/10 بناء على 9,180 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "حافلات نقل ترددية مجانية (Shuttle Bus) على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('9e8cf271-6f90-43ec-9784-ceaa72fbb1c6', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/914585345.webp?k=4c1b793cd32e333df43ecccafd43425fa9a792acae475fbe3d080e694f06145c&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('9e8cf271-6f90-43ec-9784-ceaa72fbb1c6', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('9e8cf271-6f90-43ec-9784-ceaa72fbb1c6', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '85c5e78d-bdf3-4059-98ae-ee21a688d62b', '9e8cf271-6f90-43ec-9784-ceaa72fbb1c6', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '85c5e78d-bdf3-4059-98ae-ee21a688d62b', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    450.0, 369.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '6373e49a-7a9f-451e-80f3-4574587ab01c', '9e8cf271-6f90-43ec-9784-ceaa72fbb1c6', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '6373e49a-7a9f-451e-80f3-4574587ab01c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    562.0, 461.0, 197.0, 154.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '3366051c-edfa-4f25-93f9-aeedc87a360f', '9e8cf271-6f90-43ec-9784-ceaa72fbb1c6', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '3366051c-edfa-4f25-93f9-aeedc87a360f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    675.0, 554.0, 177.0, 138.0
);


-- --------------------------------------------------------------------
-- فندق: كونراد جبل عمر مكة (MAK-HTL-0148)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '739ab9f1-10e9-47c8-bf63-fb0a5aebc19f', 'MAK-HTL-0148', 'كونراد جبل عمر مكة', 'كونراد جبل عمر مكة', 'makkah', 'جبل عمر', 'حي جبل عمر، مكة المكرمة',
    21.419900000000002, 39.821799999999996, 'https://www.google.com/maps/search/?api=1&query=21.419900000000002,39.821799999999996', 636, 'central_outer', TRUE,
    5, '+966 12 5818 5588', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/928063101.webp?k=4e2b273352bbc2f7827c409b9abff6b3efb8ed788d804955e3ae1bae2d7320e5&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي جبل عمر. يتميز بـ 0.6 كلم من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 5,711 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('739ab9f1-10e9-47c8-bf63-fb0a5aebc19f', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/928063101.webp?k=4e2b273352bbc2f7827c409b9abff6b3efb8ed788d804955e3ae1bae2d7320e5&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('739ab9f1-10e9-47c8-bf63-fb0a5aebc19f', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('739ab9f1-10e9-47c8-bf63-fb0a5aebc19f', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'bc834c76-ec28-4fc6-a173-2bf3435374ac', '739ab9f1-10e9-47c8-bf63-fb0a5aebc19f', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'bc834c76-ec28-4fc6-a173-2bf3435374ac', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2104.0, 1725.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '77392597-6c7c-4bcf-aafc-39d42c352997', '739ab9f1-10e9-47c8-bf63-fb0a5aebc19f', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '77392597-6c7c-4bcf-aafc-39d42c352997', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2630.0, 2156.0, 920.0, 719.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '57adaa9f-c410-46b0-a4f7-db89fcd99d27', '739ab9f1-10e9-47c8-bf63-fb0a5aebc19f', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '57adaa9f-c410-46b0-a4f7-db89fcd99d27', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3156.0, 2588.0, 828.0, 647.0
);


-- --------------------------------------------------------------------
-- فندق: سويس أوتيل مكة (MAK-HTL-0149)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'e857db3a-8324-456b-813a-bf340e404858', 'MAK-HTL-0149', 'سويس أوتيل مكة', 'سويس أوتيل مكة', 'makkah', 'أجياد', 'حي المنطقة المركزية، مكة المكرمة',
    21.421687, 39.827806, 'https://www.google.com/maps/search/?api=1&query=21.421687,39.827806', 222, 'central_walking', TRUE,
    5, '+966 12 5835 5619', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/820913168.webp?k=25998b04cf075df87e042db5fd946c142647b13b6abb6ab39c4982f21da74843&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 300 متر من المركز وبتقييم نزلاء حقيقي 8.9/10 بناء على 22,719 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e857db3a-8324-456b-813a-bf340e404858', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/820913168.webp?k=25998b04cf075df87e042db5fd946c142647b13b6abb6ab39c4982f21da74843&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e857db3a-8324-456b-813a-bf340e404858', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e857db3a-8324-456b-813a-bf340e404858', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '55ed9b32-683a-4444-be2a-efe09d9d126e', 'e857db3a-8324-456b-813a-bf340e404858', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '55ed9b32-683a-4444-be2a-efe09d9d126e', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2102.0, 1724.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'fb1cfd6f-c13e-45ee-a895-f64f2ce2298f', 'e857db3a-8324-456b-813a-bf340e404858', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'fb1cfd6f-c13e-45ee-a895-f64f2ce2298f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2628.0, 2155.0, 920.0, 718.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '9d5030ed-d414-4f78-a5d5-ca96433be1bb', 'e857db3a-8324-456b-813a-bf340e404858', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '9d5030ed-d414-4f78-a5d5-ca96433be1bb', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    3153.0, 2586.0, 828.0, 646.0
);


-- --------------------------------------------------------------------
-- فندق: فندق إعمار جراند (MAK-HTL-0150)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'cef5259d-1e08-4646-8b92-0b66b886cbf6', 'MAK-HTL-0150', 'فندق إعمار جراند', 'فندق إعمار جراند', 'makkah', 'الشامية', 'حي المنطقة المركزية، مكة المكرمة',
    21.422487, 39.824605999999996, 'https://www.google.com/maps/search/?api=1&query=21.422487,39.824605999999996', 195, 'central_walking', TRUE,
    5, '+966 12 5852 5650', '+966 50 123 4567', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/520998885.webp?k=a14b6a46aa2d9fd1ccaf612dcbfdc81a53a4c388a91bb51882df23abc73ea40f&o=',
    'فندق موثق ومصنف في مكة المكرمة بحي المنطقة المركزية. يتميز بـ 1.1 كلم من المركز وبتقييم نزلاء حقيقي 8.0/10 بناء على 5,098 تقييماً.', '["واي فاي مجاني فائق السرعة", "خدمة استقبال وحراسة 24 ساعة", "مطعم بوفيه مفتوح للمأكولات العالمية", "مصلى متصل بإذاعة الحرم الشريف", "خدمة تنظيف الغرف اليومية", "مشياً على الأقدام إلى ساحات الحرم", "إطلالات مباشرة على ساحات الحرمين الشريفين"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('cef5259d-1e08-4646-8b92-0b66b886cbf6', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/520998885.webp?k=a14b6a46aa2d9fd1ccaf612dcbfdc81a53a4c388a91bb51882df23abc73ea40f&o=', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('cef5259d-1e08-4646-8b92-0b66b886cbf6', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('cef5259d-1e08-4646-8b92-0b66b886cbf6', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 3);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'f019054c-086e-4152-9cc8-65231414dee8', 'cef5259d-1e08-4646-8b92-0b66b886cbf6', 'double', 'غرفة ثنائية قياسية (Double)', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'f019054c-086e-4152-9cc8-65231414dee8', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    909.0, 745.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'c60e9ef5-4f60-442a-9bca-de5c73fe2d54', 'cef5259d-1e08-4646-8b92-0b66b886cbf6', 'triple', 'غرفة ثلاثية عائلية (Triple)', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'c60e9ef5-4f60-442a-9bca-de5c73fe2d54', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1136.0, 931.0, 398.0, 310.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '8598d899-d556-47cb-b4cc-6d3956b1c814', 'cef5259d-1e08-4646-8b92-0b66b886cbf6', 'quad', 'غرفة رباعية واسعة (Quad)', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '8598d899-d556-47cb-b4cc-6d3956b1c814', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1364.0, 1118.0, 358.0, 279.0
);


-- --------------------------------------------------------------------
-- فندق: فندق موفنبيك برج هاجر مكة (MAK-HTL-0151)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'f1950619-c34a-4e49-82b9-59bfbd82dcf2', 'MAK-HTL-0151', 'فندق موفنبيك برج هاجر مكة', 'Mövenpick Hotel & Residence Hajar Tower Makkah', 'makkah', 'أجياد', 'برج هاجر، مجمع أبراج البيت، مكة المكرمة',
    21.4191, 39.8259, 'https://www.google.com/maps/search/?api=1&query=21.4191,39.8259', 446, 'central_walking', TRUE,
    5, '+966 12 571 7888', '', 'https://images.unsplash.com/photo-1565552645632-d725f8bfc19a?auto=format&fit=crop&w=1200&q=80',
    'أجنحة ملكية فاخرة تطل مباشرة على الكعبة المشرفة وبوابة الملك عبد العزيز مع خدمة المساعد الشخصي (Butler) على مدار 24 ساعة.', '["إطلالة مباشرة على الكعبة", "مصلى داخلي متصل بالحرم", "خدمة بتلر خاصة", "سبا ونادي صحي", "واي فاي فائق السرعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f1950619-c34a-4e49-82b9-59bfbd82dcf2', 'https://images.unsplash.com/photo-1564769625905-50e93615e769?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f1950619-c34a-4e49-82b9-59bfbd82dcf2', 'https://images.unsplash.com/photo-1590381105924-c72589b9ef3f?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '6617913b-4e60-4400-b103-99c6c1c4d8af', 'f1950619-c34a-4e49-82b9-59bfbd82dcf2', 'double', 'غرفة كينج ديلوكس إطلالة كعبة', 2, FALSE, 'kaaba_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '6617913b-4e60-4400-b103-99c6c1c4d8af', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1500.0, 1250.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '27977205-1078-4d8d-9bea-4e57a97c61f8', 'f1950619-c34a-4e49-82b9-59bfbd82dcf2', 'quad', 'غرفة رباعية إطلالة حرم', 4, TRUE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '27977205-1078-4d8d-9bea-4e57a97c61f8', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1900.0, 1580.0, 500.0, 415.0
);


-- --------------------------------------------------------------------
-- فندق: فندق المروة ريحان من روتانا (MAK-HTL-0152)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '3777af24-525b-44a3-a944-988d80aaa7d3', 'MAK-HTL-0152', 'فندق المروة ريحان من روتانا', 'Makkah Clock Royal Tower, A Fairmont Hotel', 'makkah', 'أجياد', 'مجمع أبراج البيت، وقف الملك عبد العزيز، مكة المكرمة',
    21.4185, 39.8261, 'https://www.google.com/maps/search/?api=1&query=21.4185,39.8261', 523, 'central_outer', TRUE,
    5, '+966 12 571 7777', '', 'https://images.unsplash.com/photo-1565552645632-d725f8bfc19a?auto=format&fit=crop&w=1200&q=80',
    'أيقونة المعمار الفندقي في قلب مكة المكرمة داخل برج الساعة، ملاصق للساحات مع مصاعد سريعة تنزل لصحن الحرم مباشرة.', '["ملاصق لساحة الحرم", "مصاعد مباشرة للحرم", "إطلالات بانورامية", "9 مطاعم عالمية", "مول أبراج البيت"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('3777af24-525b-44a3-a944-988d80aaa7d3', 'https://images.unsplash.com/photo-1564769625905-50e93615e769?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('3777af24-525b-44a3-a944-988d80aaa7d3', 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '2f993a87-a1da-4e83-aa16-c8517e167d15', '3777af24-525b-44a3-a944-988d80aaa7d3', 'double', 'غرفة كلاسيكية إطلالة حرم', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '2f993a87-a1da-4e83-aa16-c8517e167d15', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1350.0, 1120.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'e9214c7e-beaf-49d0-aa30-8051839ce31b', '3777af24-525b-44a3-a944-988d80aaa7d3', 'quad', 'غرفة رباعية ديلوكس إطلالة مدينة', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'e9214c7e-beaf-49d0-aa30-8051839ce31b', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1550.0, 1280.0, 410.0, 335.0
);


-- --------------------------------------------------------------------
-- فندق: فندق سويس أوتيل المقام مكة (MAK-HTL-0153)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '9279690f-758d-4758-ba2f-03bb6fc56ab3', 'MAK-HTL-0153', 'فندق سويس أوتيل المقام مكة', 'Swissôtel Al Maqam Makkah', 'makkah', 'أجياد', 'برج المقام، مجمع أبراج البيت، وقف الملك عبد العزيز',
    21.4189, 39.8256, 'https://www.google.com/maps/search/?api=1&query=21.4189,39.8256', 476, 'central_walking', TRUE,
    5, '+966 12 550 9999', '', 'https://images.unsplash.com/photo-1565552645632-d725f8bfc19a?auto=format&fit=crop&w=1200&q=80',
    'يقف شامخاً في مجمع أبراج البيت مع مدخل مباشر لصحن الحرم، ويقدم تجربة ضيافة سويسرية راقية مع أرقى بوفيهات الإفطار.', '["مدخل مباشر للحرم", "إطلالة كعبة", "بوفيه إفطار فاخر", "مصلى داخلي"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('9279690f-758d-4758-ba2f-03bb6fc56ab3', 'https://images.unsplash.com/photo-1568495248636-6432b97bd949?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('9279690f-758d-4758-ba2f-03bb6fc56ab3', 'https://images.unsplash.com/photo-1596701062351-8c2c14d1fdd0?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'be133c8a-ff2c-4d07-ba53-e59ea63defb3', '9279690f-758d-4758-ba2f-03bb6fc56ab3', 'double', 'غرفة ثنائية إطلالة كعبة', 2, FALSE, 'kaaba_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'be133c8a-ff2c-4d07-ba53-e59ea63defb3', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1400.0, 1180.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'cc332611-4737-438a-88ed-f6700d2401b3', '9279690f-758d-4758-ba2f-03bb6fc56ab3', 'quad', 'غرفة عائلية رباعية إطلالة حرم', 4, TRUE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'cc332611-4737-438a-88ed-f6700d2401b3', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1850.0, 1520.0, 490.0, 400.0
);


-- --------------------------------------------------------------------
-- فندق: فندق بولمان زمزم مكة (MAK-HTL-0154)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '03ec9ed4-1f2d-40fe-8232-f1b407ee3b2b', 'MAK-HTL-0154', 'فندق بولمان زمزم مكة', 'Pullman ZamZam Makkah', 'makkah', 'أجياد', 'برج زمزم، مجمع أبراج البيت، مكة المكرمة',
    21.4195, 39.8267, 'https://www.google.com/maps/search/?api=1&query=21.4195,39.8267', 397, 'central_walking', TRUE,
    5, '+966 12 571 5555', '', 'https://images.unsplash.com/photo-1565552645632-d725f8bfc19a?auto=format&fit=crop&w=1200&q=80',
    'أحد أشهر فنادق الحرم؛ يضم 1315 جناحاً وغرفة مجهزة بالكامل ومصلى داخلي مرتبط بالنظام الصوتي المباشر للحرم المكي.', '["مصلى بسماعات الحرم", "إطلالة كعبة", "مطعم المروة والروضة", "متصل بالمول التجاري"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('03ec9ed4-1f2d-40fe-8232-f1b407ee3b2b', 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('03ec9ed4-1f2d-40fe-8232-f1b407ee3b2b', 'https://images.unsplash.com/photo-1508253578933-20b529302151?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '26339ac2-f961-49e9-be65-11b33f853a92', '03ec9ed4-1f2d-40fe-8232-f1b407ee3b2b', 'quad', 'غرفة رباعية كلاسيكية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '26339ac2-f961-49e9-be65-11b33f853a92', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1450.0, 1200.0, 385.0, 315.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '822e9f9e-f900-43cd-8f34-b1ddbbf5e55b', '03ec9ed4-1f2d-40fe-8232-f1b407ee3b2b', 'quint', 'غرفة خماسية عائلية رحبة', 5, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '822e9f9e-f900-43cd-8f34-b1ddbbf5e55b', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1780.0, 1460.0, 380.0, 310.0
);


-- --------------------------------------------------------------------
-- فندق: فندق كونراد مكة جبل عمر (MAK-HTL-0155)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'dc21e1b7-c549-480c-a4c0-45be7718dddf', 'MAK-HTL-0155', 'فندق كونراد مكة جبل عمر', 'Conrad Makkah Jabal Omar', 'makkah', 'جبل عمر', 'مشروع جبل عمر، شارع إبراهيم الخليل، مكة المكرمة',
    21.4215, 39.8231, 'https://www.google.com/maps/search/?api=1&query=21.4215,39.8231', 401, 'central_walking', TRUE,
    5, '+966 12 530 8777', '', 'https://images.unsplash.com/photo-1590381105924-c72589b9ef3f?auto=format&fit=crop&w=1200&q=80',
    'تصميم عصري مستوحى من العمارة الإسلامية التقليدية مع مدخل مباشر لساحات الحرم ومصلى صوتي متزامن مع صلوات الحرم.', '["دقيقة واحدة للحرم", "مصلى داخلي متصل بالحرم", "مطعم الشرفة المفتوح", "خدمة بتلر للأجنحة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('dc21e1b7-c549-480c-a4c0-45be7718dddf', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('dc21e1b7-c549-480c-a4c0-45be7718dddf', 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '5835caf5-8b52-4c02-a6eb-400d9d589520', 'dc21e1b7-c549-480c-a4c0-45be7718dddf', 'double', 'غرفة ديلوكس إطلالة حرم', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '5835caf5-8b52-4c02-a6eb-400d9d589520', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1450.0, 1220.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '7c268325-c51b-404c-82a7-5ee2832d3867', 'dc21e1b7-c549-480c-a4c0-45be7718dddf', 'quad', 'غرفة عائلية رباعية رحبة', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '7c268325-c51b-404c-82a7-5ee2832d3867', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1850.0, 1540.0, 490.0, 405.0
);


-- --------------------------------------------------------------------
-- فندق: فندق جبل عمر حياة ريجنسي (MAK-HTL-0156)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '487f28fd-398c-475e-912f-6d853f0c9ae7', 'MAK-HTL-0156', 'فندق جبل عمر حياة ريجنسي', 'Jabal Omar Hyatt Regency Makkah', 'makkah', 'جبل عمر', 'مشروع جبل عمر، شارع إبراهيم الخليل، مكة المكرمة',
    21.4211, 39.8228, 'https://www.google.com/maps/search/?api=1&query=21.4211,39.8228', 454, 'central_walking', TRUE,
    5, '+966 12 577 1234', '', 'https://images.unsplash.com/photo-1568495248636-6432b97bd949?auto=format&fit=crop&w=1200&q=80',
    'موقع استراتيجي بجبل عمر على بُعد دقيقة واحدة مشياً من ساحات المسجد الحرام الغربية وبوابة الملك فهد.', '["خطوات لبوابة الملك فهد", "صالة شاي ريجنسي", "مطعم الواحة", "مرافق كاملة لذوي الهمم"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('487f28fd-398c-475e-912f-6d853f0c9ae7', 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('487f28fd-398c-475e-912f-6d853f0c9ae7', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '38525012-8ab7-449d-b181-61a6ae033761', '487f28fd-398c-475e-912f-6d853f0c9ae7', 'double', 'غرفة ديلوكس كينج إطلالة حرم', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '38525012-8ab7-449d-b181-61a6ae033761', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1380.0, 1150.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'd509e9d5-16eb-461d-a356-4112def2339c', '487f28fd-398c-475e-912f-6d853f0c9ae7', 'quad', 'غرفة رباعية ديلوكس إطلالة مدينة', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'd509e9d5-16eb-461d-a356-4112def2339c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1720.0, 1420.0, 450.0, 375.0
);


-- --------------------------------------------------------------------
-- فندق: فندق أنجم مكة (MAK-HTL-0157)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '02da7557-2fa7-430a-ac7f-6a2bee472ea5', 'MAK-HTL-0157', 'فندق أنجم مكة', 'Anjum Hotel Makkah', 'makkah', 'الشبيكة', 'شارع أم القرى، منطقة التوسعة الشمالية للمسجد الحرام، مكة المكرمة',
    21.4262, 39.8198, 'https://www.google.com/maps/search/?api=1&query=21.4262,39.8198', 922, 'central_outer', TRUE,
    5, '+966 12 555 0000', '', 'https://images.unsplash.com/photo-1568495248636-6432b97bd949?auto=format&fit=crop&w=1200&q=80',
    'فندق ضخم يضم 1743 غرفة وجناحاً، يتميز بنفق خاص مكيف ومصاعد تصل مباشرة لساحات توسعة الملك عبد الله في أقل من دقيقتين.', '["نفق مكيف مباشر للساحات", "1743 غرفة وجناح", "تصميم أندلسي راقي", "صالة كونسيرج متطورة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('02da7557-2fa7-430a-ac7f-6a2bee472ea5', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('02da7557-2fa7-430a-ac7f-6a2bee472ea5', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'a6e19005-b5cf-4ec1-97f7-db207f12ea4d', '02da7557-2fa7-430a-ac7f-6a2bee472ea5', 'quad', 'غرفة رباعية كلاسيكية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'a6e19005-b5cf-4ec1-97f7-db207f12ea4d', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    980.0, 810.0, 260.0, 215.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '25029c81-5271-4b56-8ce6-7184c880dba0', '02da7557-2fa7-430a-ac7f-6a2bee472ea5', 'double', 'غرفة ثنائية إطلالة ساحات الحرم', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '25029c81-5271-4b56-8ce6-7184c880dba0', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    850.0, 710.0, NULL, NULL
);


-- --------------------------------------------------------------------
-- فندق: فندق الشهداء مكة (MAK-HTL-0158)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '79bad161-7f0a-4a85-a514-bfd79b9fa58d', 'MAK-HTL-0158', 'فندق الشهداء مكة', 'Al Shohada Hotel Makkah', 'makkah', 'أجياد', 'شارع أجياد العام، بئر بليلة، مكة المكرمة',
    21.415, 39.8285, 'https://www.google.com/maps/search/?api=1&query=21.415,39.8285', 1022, 'central_outer', TRUE,
    5, '+966 12 574 4401', '', 'https://images.unsplash.com/photo-1565552645632-d725f8bfc19a?auto=format&fit=crop&w=1200&q=80',
    'فندق راقي بطابع كلاسيكي فاخر في شارع أجياد، يبعد دقائق معدودة مشياً عن باب الملك عبد العزيز ومزود بأحدث سبل الراحة.', '["ممشى مشاة مباشر للحرم", "مطعم القصر الملكي", "مقهى كراميل", "مركز رجال أعمال"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('79bad161-7f0a-4a85-a514-bfd79b9fa58d', 'https://images.unsplash.com/photo-1564769625905-50e93615e769?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('79bad161-7f0a-4a85-a514-bfd79b9fa58d', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '9117e710-0735-4e74-9c14-8ec86ea07017', '79bad161-7f0a-4a85-a514-bfd79b9fa58d', 'double', 'غرفة ديلوكس كينج', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '9117e710-0735-4e74-9c14-8ec86ea07017', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    850.0, 710.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '52a02f35-d3f7-4081-a8b2-fd5dbce9c050', '79bad161-7f0a-4a85-a514-bfd79b9fa58d', 'quad', 'غرفة عائلية رباعية فاخرة', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '52a02f35-d3f7-4081-a8b2-fd5dbce9c050', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1150.0, 940.0, 305.0, 248.0
);


-- --------------------------------------------------------------------
-- فندق: فندق فوكو مكة (مجموعة فنادق إنتركونتيننتال) (MAK-HTL-0159)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '2df6230b-e576-48e6-b1f7-fce8f677774d', 'MAK-HTL-0159', 'فندق فوكو مكة (مجموعة فنادق إنتركونتيننتال)', 'voco Makkah, an IHG Hotel', 'makkah', 'إبراهيم الخليل', 'طريق إبراهيم الخليل، المسفلة، مكة المكرمة',
    21.4082, 39.8228, 'https://www.google.com/maps/search/?api=1&query=21.4082,39.8228', 1920, 'shuttle_bus', FALSE,
    4, '+966 12 549 8888', '', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=1200&q=80',
    'فندق حديث تابع لمجموعة IHG العالمية، يوفر باصات ترددية مجانية تعمل كل 3 دقائق على مدار 24 ساعة لنقل المعتمرين للحرم.', '["باصات شاتل مجانية 24/7", "مطاعم عائلية متعددة", "مواقف مجانية واسعة", "إنترنت فائق السرعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2df6230b-e576-48e6-b1f7-fce8f677774d', 'https://images.unsplash.com/photo-1568495248636-6432b97bd949?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2df6230b-e576-48e6-b1f7-fce8f677774d', 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '03441e38-2516-4fd3-a45c-586261b333c6', '2df6230b-e576-48e6-b1f7-fce8f677774d', 'double', 'غرفة بريميوم ثنائية', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '03441e38-2516-4fd3-a45c-586261b333c6', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    480.0, 390.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '515a23bd-2455-4e68-86eb-b1e7ebcddbee', '2df6230b-e576-48e6-b1f7-fce8f677774d', 'quad', 'غرفة عائلية رباعية فوكو', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '515a23bd-2455-4e68-86eb-b1e7ebcddbee', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    620.0, 510.0, 165.0, 135.0
);


-- --------------------------------------------------------------------
-- فندق: فندق أبراج الكسوة مكة (MAK-HTL-0160)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '324071e6-88ed-4167-a57b-72d9fb6d57ce', 'MAK-HTL-0160', 'فندق أبراج الكسوة مكة', 'Al Kiswah Towers Hotel', 'makkah', 'التيسير', 'حي التيسير، طريق أم القرى، مكة المكرمة',
    21.4312, 39.8145, 'https://www.google.com/maps/search/?api=1&query=21.4312,39.8145', 1831, 'shuttle_bus', FALSE,
    3, '+966 12 535 6666', '', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=1200&q=80',
    'أكبر مجمع فندقي اقتصادي في مكة يضم 5 أبراج متطورة مع أسطول باصات شاتل حديث ينزل المعتمرين في ساحات الحرم خلال دقائق.', '["أسطول باصات ترددية مجانية 24 ساعة", "محلات تجارية وسوبرماركت", "مغسلة ملابس", "مكتب استقبال ضخم"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('324071e6-88ed-4167-a57b-72d9fb6d57ce', 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('324071e6-88ed-4167-a57b-72d9fb6d57ce', 'https://images.unsplash.com/photo-1508253578933-20b529302151?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'd87ea20b-a99f-4a20-8b57-c1fa405b8b9b', '324071e6-88ed-4167-a57b-72d9fb6d57ce', 'quad', 'غرفة رباعية قياسية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'd87ea20b-a99f-4a20-8b57-c1fa405b8b9b', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    220.0, 175.0, 60.0, 48.0
);


-- --------------------------------------------------------------------
-- فندق: فندق أركان بكة مكة (MAK-HTL-0161)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'a8ad5bb5-317b-488a-8091-336452896103', 'MAK-HTL-0161', 'فندق أركان بكة مكة', 'Arkan Bakkah Hotel', 'makkah', 'محبس الجن', 'طريق الملك عبد العزيز، محبس الجن، مكة المكرمة',
    21.4158, 39.8521, 'https://www.google.com/maps/search/?api=1&query=21.4158,39.8521', 3282, 'shuttle_bus', FALSE,
    4, '+966 12 559 8888', '', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=1200&q=80',
    'يقع في محبس الجن بالقرب من أنفاق الملك عبد العزيز مع خط باصات مباشر ينزل المعتمر في محطة باب علي بالحرم في 3 دقائق فقط.', '["باصات سريعة عبر نفق الحرم", "قريب من نفق المشاة المظلل", "مطعم بوفيه مفتوح", "مواقف خاصة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a8ad5bb5-317b-488a-8091-336452896103', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a8ad5bb5-317b-488a-8091-336452896103', 'https://images.unsplash.com/photo-1568495248636-6432b97bd949?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'de15ed9d-15fa-41bc-ba84-cfc62a9a7c7c', 'a8ad5bb5-317b-488a-8091-336452896103', 'quad', 'غرفة رباعية اقتصادية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'de15ed9d-15fa-41bc-ba84-cfc62a9a7c7c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    320.0, 250.0, 85.0, 65.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'd9317cca-91fe-4af5-8926-eb183c059683', 'a8ad5bb5-317b-488a-8091-336452896103', 'triple', 'غرفة ثلاثية مريحة', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'd9317cca-91fe-4af5-8926-eb183c059683', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    290.0, 230.0, 100.0, 79.0
);


-- --------------------------------------------------------------------
-- فندق: فندق ميلينيوم مكة النسيم (MAK-HTL-0162)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'e69e62ea-d25b-43d1-8221-91ccf9dddbc1', 'MAK-HTL-0162', 'فندق ميلينيوم مكة النسيم', 'Millennium Makkah Al Naseem', 'makkah', 'النسيم', 'مجمع النسيم، حي النسيم، مكة المكرمة',
    21.3789, 39.8752, 'https://www.google.com/maps/search/?api=1&query=21.3789,39.8752', 8278, 'shuttle_bus', FALSE,
    5, '+966 12 550 9999', '', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=1200&q=80',
    'فندق 5 نجوم فاخر في حي النسيم الهادئ يقدم غرفاً فسيحة وباصات شاتل سريعة مجانية تنقلك للحرم المكي الشريف مدار الساعة.', '["باصات شاتل مجانية على مدار الساعة", "مطعم لوتس الفاخر", "نادي صحي وسبا", "مواقف سيارات مجانية"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e69e62ea-d25b-43d1-8221-91ccf9dddbc1', 'https://images.unsplash.com/photo-1590381105924-c72589b9ef3f?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e69e62ea-d25b-43d1-8221-91ccf9dddbc1', 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '2a608bcc-9acc-40d6-96a0-ee35b9b62e8d', 'e69e62ea-d25b-43d1-8221-91ccf9dddbc1', 'double', 'غرفة ديلوكس كينج', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '2a608bcc-9acc-40d6-96a0-ee35b9b62e8d', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    420.0, 340.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '74916694-144d-4fd6-a9ec-2d7028958701', 'e69e62ea-d25b-43d1-8221-91ccf9dddbc1', 'quad', 'غرفة عائلية رباعية فاخرة', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '74916694-144d-4fd6-a9ec-2d7028958701', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    580.0, 470.0, 150.0, 120.0
);


-- --------------------------------------------------------------------
-- فندق: فندق إيلاف المشاعر مكة (MAK-HTL-0163)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'f0ca8d43-ece4-439f-a97a-b215e7a56967', 'MAK-HTL-0163', 'فندق إيلاف المشاعر مكة', 'Elaf Al Mashaer Hotel', 'makkah', 'أجياد', 'شارع أجياد العام، مكة المكرمة',
    21.417, 39.829, 'https://www.google.com/maps/search/?api=1&query=21.417,39.829', 797, 'central_outer', TRUE,
    5, '+966 12 570 0004', '', 'https://images.unsplash.com/photo-1590381105924-c72589b9ef3f?auto=format&fit=crop&w=1200&q=80',
    'يقع في شارع أجياد على مسافة 400 متر من الحرم، ويتميز بإطلالات متميزة ومطاعم تقدم أشهى الوجبات للمعتمرين.', '["400 متر سيراً على الأقدام", "مطعم الملتزم", "خدمة غرف ممتازة", "واي فاي سريع"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f0ca8d43-ece4-439f-a97a-b215e7a56967', 'https://images.unsplash.com/photo-1568495248636-6432b97bd949?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f0ca8d43-ece4-439f-a97a-b215e7a56967', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '08b734ba-bba8-47fc-b149-09ce9c3bcfcb', 'f0ca8d43-ece4-439f-a97a-b215e7a56967', 'quad', 'غرفة رباعية كلاسيكية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '08b734ba-bba8-47fc-b149-09ce9c3bcfcb', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    780.0, 640.0, 210.0, 170.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'db927381-1eaf-4f58-a506-ec310d9371aa', 'f0ca8d43-ece4-439f-a97a-b215e7a56967', 'triple', 'غرفة ثلاثية مريحة', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'db927381-1eaf-4f58-a506-ec310d9371aa', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    690.0, 570.0, 245.0, 200.0
);


-- --------------------------------------------------------------------
-- فندق: فندق إيلاف كندة مكة (MAK-HTL-0164)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '57f7e4b2-aabd-4ef6-a047-2e52dd02082e', 'MAK-HTL-0164', 'فندق إيلاف كندة مكة', 'Elaf Kinda Hotel', 'makkah', 'الشبيكة', 'شارع المسيال، بجوار وقف الأشراف، مكة المكرمة',
    21.421, 39.824, 'https://www.google.com/maps/search/?api=1&query=21.421,39.824', 333, 'central_walking', TRUE,
    5, '+966 12 574 5555', '', 'https://images.unsplash.com/photo-1568495248636-6432b97bd949?auto=format&fit=crop&w=1200&q=80',
    'موقع استثنائي على بعد خطوات معدودة من ساحات الحرم وبوابة الملك عبد العزيز، غرف عائلية واسعة ومطعم بانورامي.', '["خطوات للحرم", "بوفيه مفتوح راقي", "خدمة استقبال 24 ساعة", "غرف عائلية واسعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('57f7e4b2-aabd-4ef6-a047-2e52dd02082e', 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('57f7e4b2-aabd-4ef6-a047-2e52dd02082e', 'https://images.unsplash.com/photo-1591088398332-8a7791972843?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'ede933bc-03aa-4e33-9f4e-0449f4203890', '57f7e4b2-aabd-4ef6-a047-2e52dd02082e', 'double', 'غرفة ديلوكس إطلالة حرم', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'ede933bc-03aa-4e33-9f4e-0449f4203890', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1100.0, 910.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '6582de4c-2218-410c-afe1-242fd1565c3f', '57f7e4b2-aabd-4ef6-a047-2e52dd02082e', 'quad', 'غرفة رباعية إطلالة ساحات الحرم', 4, TRUE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '6582de4c-2218-410c-afe1-242fd1565c3f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1480.0, 1220.0, 390.0, 320.0
);


-- --------------------------------------------------------------------
-- فندق: فندق لو ميريديان مكة (MAK-HTL-0165)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '004154f8-0b98-4428-86fa-c563022e3610', 'MAK-HTL-0165', 'فندق لو ميريديان مكة', 'Le Méridien Makkah', 'makkah', 'أجياد', 'شارع أجياد العام، مكة المكرمة',
    21.419, 39.828, 'https://www.google.com/maps/search/?api=1&query=21.419,39.828', 507, 'central_outer', TRUE,
    5, '+966 12 575 1111', '', 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=1200&q=80',
    'يطل مباشرة على الحرم المكي الشريف وبوابة الملك عبد العزيز ويوفر تجربة فندقية عالمية تابعة لمجموعة ماريوت.', '["إطلالة مباشرة على الحرم", "مطعم الشهد الآسيوي", "صالون شاي فاخر", "مصلى داخلي"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('004154f8-0b98-4428-86fa-c563022e3610', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('004154f8-0b98-4428-86fa-c563022e3610', 'https://images.unsplash.com/photo-1592229505726-ca121723b8ef?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '55276d90-40a7-4576-9d16-95a6fc043052', '004154f8-0b98-4428-86fa-c563022e3610', 'double', 'غرفة ديلوكس إطلالة حرم', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '55276d90-40a7-4576-9d16-95a6fc043052', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1250.0, 1040.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '7a4428df-da03-4699-87f7-653f7b48ecc5', '004154f8-0b98-4428-86fa-c563022e3610', 'quad', 'غرفة رباعية فاخرة', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '7a4428df-da03-4699-87f7-653f7b48ecc5', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1650.0, 1360.0, 435.0, 358.0
);


-- --------------------------------------------------------------------
-- فندق: فندق شيراتون مكة جبل الكعبة (MAK-HTL-0166)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '8ab1834b-bb9e-4ca5-b6e5-1da350190651', 'MAK-HTL-0166', 'فندق شيراتون مكة جبل الكعبة', 'Sheraton Makkah Jabal Al Kaaba', 'makkah', 'أجياد', 'جبل الكعبة، منطقة التوسعة الشمالية، مكة المكرمة',
    21.428, 39.818, 'https://www.google.com/maps/search/?api=1&query=21.428,39.818', 1236, 'shuttle_bus', FALSE,
    5, '+966 12 551 8900', '', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=1200&q=80',
    'يقع على سفح جبل الكعبة مع ممشى مشاة واسع وجسر مكي ينقلك مباشرة إلى ساحات توسعة الملك عبد الله في دقائق معدودة.', '["جسر مشاة متصل بالساحات", "إطلالات بانورامية", "مطعم الفردوس", "خدمات ضيافة عالمية"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('8ab1834b-bb9e-4ca5-b6e5-1da350190651', 'https://images.unsplash.com/photo-1591088398332-8a7791972843?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('8ab1834b-bb9e-4ca5-b6e5-1da350190651', 'https://images.unsplash.com/photo-1508253578933-20b529302151?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '0ef0acef-6e55-495a-8f71-2aa95d8479cc', '8ab1834b-bb9e-4ca5-b6e5-1da350190651', 'double', 'غرفة كينج إطلالة حرم', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '0ef0acef-6e55-495a-8f71-2aa95d8479cc', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1180.0, 980.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '087e0ec2-00e0-4d5d-a787-79afc7867c05', '8ab1834b-bb9e-4ca5-b6e5-1da350190651', 'quad', 'غرفة رباعية رحبة إطلالة مدينة', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '087e0ec2-00e0-4d5d-a787-79afc7867c05', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1480.0, 1220.0, 390.0, 320.0
);


-- --------------------------------------------------------------------
-- فندق: فندق الماسة مكة (MAK-HTL-0167)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '82c7420b-31ac-40a4-b5a6-22235cc942dd', 'MAK-HTL-0167', 'فندق الماسة مكة', 'Al Massa Hotel Makkah', 'makkah', 'أجياد', 'شارع أجياد العام، أمام ساحات الحرم وباب الملك عبد العزيز',
    21.4195, 39.8275, 'https://www.google.com/maps/search/?api=1&query=21.4195,39.8275', 423, 'central_walking', TRUE,
    4, '+966 12 574 6666', '', 'https://images.unsplash.com/photo-1591088398332-8a7791972843?auto=format&fit=crop&w=1200&q=80',
    'يقع مباشرة على بعد 90 متراً فقط من بوابة الملك عبد العزيز، ويعد من أكثر الفنادق شعبية لسرعة وسهولة الوصول للحرم.', '["90 متراً فقط لصحن الحرم", "مطعم بوفيه مفتوح", "خدمة استقبال 24 ساعة", "غرف عائلية مميزة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('82c7420b-31ac-40a4-b5a6-22235cc942dd', 'https://images.unsplash.com/photo-1592229505726-ca121723b8ef?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('82c7420b-31ac-40a4-b5a6-22235cc942dd', 'https://images.unsplash.com/photo-1541971875076-8f970d573be6?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '6aa4d8cb-82fd-4874-85ae-e12bac2e977d', '82c7420b-31ac-40a4-b5a6-22235cc942dd', 'quad', 'غرفة رباعية إطلالة جزئية للحرم', 4, TRUE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '6aa4d8cb-82fd-4874-85ae-e12bac2e977d', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1250.0, 1020.0, 330.0, 270.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'c1e74d43-f938-4320-9ba9-1969c05985b9', '82c7420b-31ac-40a4-b5a6-22235cc942dd', 'double', 'غرفة ثنائية كلاسيكية', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'c1e74d43-f938-4320-9ba9-1969c05985b9', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    850.0, 710.0, NULL, NULL
);


-- --------------------------------------------------------------------
-- فندق: فندق جراند مكة (MAK-HTL-0168)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '8f1b4da3-e331-4594-be73-746745e2a5de', 'MAK-HTL-0168', 'فندق جراند مكة', 'Grand Makkah Hotel', 'makkah', 'الغزة', 'شارع المسجد الحرام، حي الغزة، مكة المكرمة',
    21.4285, 39.831, 'https://www.google.com/maps/search/?api=1&query=21.4285,39.831', 983, 'central_outer', TRUE,
    5, '+966 12 534 0000', '', 'https://images.unsplash.com/photo-1564769625905-50e93615e769?auto=format&fit=crop&w=1200&q=80',
    'فندق 5 نجوم فاخر يبعد مسافة 600 متر مشياً عبر ممشى الغزة المظلل المؤدي مباشرة لباب المروة والمسعى الشريف.', '["ممشى مباشر لباب المروة والمسعى", "مطاعم راقية", "مركز لياقة بدنية", "خدمة استقبال ممتازة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('8f1b4da3-e331-4594-be73-746745e2a5de', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('8f1b4da3-e331-4594-be73-746745e2a5de', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '91711c56-7384-4979-b5f6-71df5468e00e', '8f1b4da3-e331-4594-be73-746745e2a5de', 'quad', 'غرفة رباعية كلاسيكية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '91711c56-7384-4979-b5f6-71df5468e00e', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    920.0, 760.0, 245.0, 200.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '31ec1bd3-a5aa-4181-9a4e-0ca6b5c329ca', '8f1b4da3-e331-4594-be73-746745e2a5de', 'double', 'غرفة ديلوكس كينج', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '31ec1bd3-a5aa-4181-9a4e-0ca6b5c329ca', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    750.0, 620.0, NULL, NULL
);


-- --------------------------------------------------------------------
-- فندق: فندق جبل عمر ماريوت مكة (MAK-HTL-0169)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '6cdfc458-7f56-4466-b860-4a10c3706254', 'MAK-HTL-0169', 'فندق جبل عمر ماريوت مكة', 'Jabal Omar Marriott Hotel Makkah', 'makkah', 'جبل عمر', 'مشروع جبل عمر، مكة المكرمة',
    21.422, 39.821, 'https://www.google.com/maps/search/?api=1&query=21.422,39.821', 639, 'central_outer', TRUE,
    5, '+966 12 577 8888', '', 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=1200&q=80',
    'يقدم أجنحة ضيافة عالمية فاخرة تابعة لمجموعة ماريوت الدولية، قبالة ساحات الحرم الغربية وبوابة الملك فهد.', '["مصلى خاص مرتبط بالحرم", "مطعم سبايس ماركت", "صالة ضيافة ماريوت التنفيذية", "مواقف خاصة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('6cdfc458-7f56-4466-b860-4a10c3706254', 'https://images.unsplash.com/photo-1598928506311-c55ded91a20c?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('6cdfc458-7f56-4466-b860-4a10c3706254', 'https://images.unsplash.com/photo-1568495248636-6432b97bd949?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '8167decd-03dd-4082-9623-fe123fed62d3', '6cdfc458-7f56-4466-b860-4a10c3706254', 'double', 'غرفة كينج إطلالة حرم', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '8167decd-03dd-4082-9623-fe123fed62d3', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1250.0, 1040.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'a2cd8b57-51bf-4821-9b53-2a7f1510eb19', '6cdfc458-7f56-4466-b860-4a10c3706254', 'quad', 'غرفة رباعية عائلية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'a2cd8b57-51bf-4821-9b53-2a7f1510eb19', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1650.0, 1360.0, 435.0, 358.0
);


-- --------------------------------------------------------------------
-- فندق: فندق العنوان مكة جبل عمر (MAK-HTL-0170)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '1d5b0991-2fca-44a4-bd9a-fe95c1406d92', 'MAK-HTL-0170', 'فندق العنوان مكة جبل عمر', 'Address Jabal Omar Makkah', 'makkah', 'جبل عمر', 'مشروع جبل عمر، أعلى برج بمدخل ساحات الحرم',
    21.4205, 39.8235, 'https://www.google.com/maps/search/?api=1&query=21.4205,39.8235', 421, 'central_walking', TRUE,
    5, '+966 12 541 7777', '', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=1200&q=80',
    'يضم أعلى مصلى معلق في العالم موجه للكعبة المشرفة، ويعد تحفة معمارية استثنائية على بُعد خطوات من الحرم.', '["أعلى مصلى معلق في العالم", "إطلالة كعبة بانورامية 360", "مطاعم حائزة على جوائز", "خدمة VIP فائقة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('1d5b0991-2fca-44a4-bd9a-fe95c1406d92', 'https://images.unsplash.com/photo-1568495248636-6432b97bd949?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('1d5b0991-2fca-44a4-bd9a-fe95c1406d92', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '1a8cea77-5ec0-4c7f-b971-391bb940f07c', '1d5b0991-2fca-44a4-bd9a-fe95c1406d92', 'double', 'غرفة كينج بريميوم إطلالة كعبة', 2, FALSE, 'kaaba_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '1a8cea77-5ec0-4c7f-b971-391bb940f07c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1950.0, 1620.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'ffbac573-81f2-41ce-b930-5b7df61b877e', '1d5b0991-2fca-44a4-bd9a-fe95c1406d92', 'quad', 'جناح عائلي رباعي إطلالة حرم', 4, TRUE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'ffbac573-81f2-41ce-b930-5b7df61b877e', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2600.0, 2150.0, 680.0, 560.0
);


-- --------------------------------------------------------------------
-- فندق: فندق جميرا مكة جبل عمر (MAK-HTL-0171)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '9d59aab4-4ade-401e-b47f-5515b37257d2', 'MAK-HTL-0171', 'فندق جميرا مكة جبل عمر', 'Jumeirah Jabal Omar Makkah', 'makkah', 'جبل عمر', 'مشروع جبل عمر، شارع إبراهيم الخليل، مكة المكرمة',
    21.4208, 39.8232, 'https://www.google.com/maps/search/?api=1&query=21.4208,39.8232', 429, 'central_walking', TRUE,
    5, '+966 12 577 9999', '', 'https://images.unsplash.com/photo-1590381105924-c72589b9ef3f?auto=format&fit=crop&w=1200&q=80',
    'يقدم ضيافة جميرا الإماراتية الأسطورية مع أجنحة فاخرة بإطلالات مباشرة على ساحات المسجد الحرام.', '["خطوات للحرم", "مطاعم جميرا العالمية", "مصلى داخلي", "خدمات كونسيرج خاصة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('9d59aab4-4ade-401e-b47f-5515b37257d2', 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('9d59aab4-4ade-401e-b47f-5515b37257d2', 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '149ce9c6-94f1-4ccc-99c7-5e623000cc05', '9d59aab4-4ade-401e-b47f-5515b37257d2', 'double', 'غرفة ديلوكس إطلالة حرم', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '149ce9c6-94f1-4ccc-99c7-5e623000cc05', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1750.0, 1450.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '1f77bf6b-d123-4199-95a4-4101f6725b61', '9d59aab4-4ade-401e-b47f-5515b37257d2', 'quad', 'جناح رباعي تنفيذي إطلالة حرم', 4, TRUE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '1f77bf6b-d123-4199-95a4-4101f6725b61', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2300.0, 1900.0, 600.0, 495.0
);


-- --------------------------------------------------------------------
-- فندق: فندق دار الإيمان جراند مكة (MAK-HTL-0172)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '263853b5-5c22-4b1f-a4ce-aeeffcd58db6', 'MAK-HTL-0172', 'فندق دار الإيمان جراند مكة', 'Dar Al Eiman Grand Hotel', 'makkah', 'إبراهيم الخليل', 'شارع إبراهيم الخليل، المسفلة، مكة المكرمة',
    21.411, 39.822, 'https://www.google.com/maps/search/?api=1&query=21.411,39.822', 1592, 'shuttle_bus', FALSE,
    4, '+966 12 536 0000', '', 'https://images.unsplash.com/photo-1598928506311-c55ded91a20c?auto=format&fit=crop&w=1200&q=80',
    'يقع في شارع إبراهيم الخليل الشهير، ويوفر غرفاً فسيحة ممتازة للمجموعات وحملات العمرة بأسعار اقتصادية وجودة 4 نجوم.', '["قريب من المطاعم والخدمات", "مكتب استقبال 24 ساعة", "غرف عائلية متعددة الأسرة", "مطعم بوفيه"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('263853b5-5c22-4b1f-a4ce-aeeffcd58db6', 'https://images.unsplash.com/photo-1596701062351-8c2c14d1fdd0?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('263853b5-5c22-4b1f-a4ce-aeeffcd58db6', 'https://images.unsplash.com/photo-1564769625905-50e93615e769?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'a4f1b9b6-3913-4fd1-99a9-038c1d6c2c9b', '263853b5-5c22-4b1f-a4ce-aeeffcd58db6', 'quad', 'غرفة رباعية كلاسيكية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'a4f1b9b6-3913-4fd1-99a9-038c1d6c2c9b', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    490.0, 400.0, 135.0, 108.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '7cf1801a-ef30-43aa-8029-3293e253b424', '263853b5-5c22-4b1f-a4ce-aeeffcd58db6', 'quint', 'غرفة خماسية للمجموعات', 5, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '7cf1801a-ef30-43aa-8029-3293e253b424', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    580.0, 470.0, 125.0, 100.0
);


-- --------------------------------------------------------------------
-- فندق: فندق الأصيل بلازا مكة (MAK-HTL-0173)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'e0fce461-ecc8-43d0-a500-5c303fe057ec', 'MAK-HTL-0173', 'فندق الأصيل بلازا مكة', 'Al Aseel Plaza Hotel', 'makkah', 'أجياد', 'شارع أجياد بئر بليلة، مكة المكرمة',
    21.4168, 39.8295, 'https://www.google.com/maps/search/?api=1&query=21.4168,39.8295', 848, 'central_outer', TRUE,
    3, '+966 12 574 5678', '', 'https://images.unsplash.com/photo-1596701062351-8c2c14d1fdd0?auto=format&fit=crop&w=1200&q=80',
    'فندق اقتصادي نظيف في شارع أجياد على مسافة 490 متراً مشياً من الحرم، مثالي للمعتمرين الراغبين في القرب بسعر اقتصادي.', '["ممشى مشاة مباشر للحرم", "تكييف مركزي", "مصاعد حديثة", "استقبال 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e0fce461-ecc8-43d0-a500-5c303fe057ec', 'https://images.unsplash.com/photo-1565552645632-d725f8bfc19a?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e0fce461-ecc8-43d0-a500-5c303fe057ec', 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'ce67b8a2-0a0d-4dcb-9575-f2a853e5e1d2', 'e0fce461-ecc8-43d0-a500-5c303fe057ec', 'quad', 'غرفة رباعية اقتصادية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'ce67b8a2-0a0d-4dcb-9575-f2a853e5e1d2', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    390.0, 315.0, 105.0, 84.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '0ce8f96e-506c-44ab-be9f-b58afd58a188', 'e0fce461-ecc8-43d0-a500-5c303fe057ec', 'triple', 'غرفة ثلاثية اقتصادية', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '0ce8f96e-506c-44ab-be9f-b58afd58a188', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    340.0, 275.0, 120.0, 96.0
);


-- --------------------------------------------------------------------
-- فندق: فندق صرح المنامة مكة (MAK-HTL-0174)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '98d9ace7-717e-4eae-9b5f-4f1a8b25b92e', 'MAK-HTL-0174', 'فندق صرح المنامة مكة', 'Sarh Al Manama Hotel', 'makkah', 'الغزة', 'طريق المسجد الحرام، مكة المكرمة',
    21.425, 39.839, 'https://www.google.com/maps/search/?api=1&query=21.425,39.839', 1597, 'shuttle_bus', FALSE,
    3, '+966 12 558 7777', '', 'https://images.unsplash.com/photo-1565552645632-d725f8bfc19a?auto=format&fit=crop&w=1200&q=80',
    'يوفر باصات ترددية مجانية للحرم مدار الساعة مع غرف عائلية حديثة ومطاعم قريبة.', '["باصات شاتل مجانية", "واي فاي سريع", "خدمة غرف", "استقبال على مدار الساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('98d9ace7-717e-4eae-9b5f-4f1a8b25b92e', 'https://images.unsplash.com/photo-1564769625905-50e93615e769?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('98d9ace7-717e-4eae-9b5f-4f1a8b25b92e', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '0c3c2f40-9f17-40e6-945a-c8fb9ce0e346', '98d9ace7-717e-4eae-9b5f-4f1a8b25b92e', 'quad', 'غرفة رباعية شاتل باص', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '0c3c2f40-9f17-40e6-945a-c8fb9ce0e346', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    290.0, 230.0, 78.0, 62.0
);


-- --------------------------------------------------------------------
-- فندق: فندق أثمان الحجاز مكة (MAK-HTL-0175)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'de9a8a79-4c8c-4af5-af8c-164ba7dd0737', 'MAK-HTL-0175', 'فندق أثمان الحجاز مكة', 'Athman Al Hijaz Hotel', 'makkah', 'جرول', 'حي التيسير، شارع جرول، مكة المكرمة',
    21.432, 39.815, 'https://www.google.com/maps/search/?api=1&query=21.432,39.815', 1852, 'shuttle_bus', FALSE,
    3, '+966 12 531 4444', '', 'https://images.unsplash.com/photo-1564769625905-50e93615e769?auto=format&fit=crop&w=1200&q=80',
    'فندق مجهز لحملات العمرة الكبرى مع باصات ترددية سريعة تنزل المعتمرين في ساحات الحرم الشمالية.', '["باصات شاتل سريعة", "مكتب خدمات معتمرين", "قاعة طعام واسعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('de9a8a79-4c8c-4af5-af8c-164ba7dd0737', 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('de9a8a79-4c8c-4af5-af8c-164ba7dd0737', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '7f9e3fa7-20a8-4776-8b80-a75ca71e94f6', 'de9a8a79-4c8c-4af5-af8c-164ba7dd0737', 'quad', 'غرفة رباعية للحملات', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '7f9e3fa7-20a8-4776-8b80-a75ca71e94f6', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    280.0, 220.0, 75.0, 58.0
);


-- --------------------------------------------------------------------
-- فندق: فندق بارك إن راديسون مكة العزيزية (MAK-HTL-0176)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '45282053-6689-40dd-8081-12105c063aa0', 'MAK-HTL-0176', 'فندق بارك إن راديسون مكة العزيزية', 'Park Inn by Radisson Makkah Aziziyah', 'makkah', 'العزيزية', 'شارع العزيزية العام، بالقرب من جامع الراجحي، مكة المكرمة',
    21.399, 39.865, 'https://www.google.com/maps/search/?api=1&query=21.399,39.865', 5653, 'shuttle_bus', FALSE,
    5, '+966 12 554 1578', '', 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=1200&q=80',
    'فندق 5 نجوم راقي في العزيزية بجوار جامع الراجحي، يوفر باصات شاتل فارهة ومكيفة للحرم كل 10 دقائق.', '["باصات شاتل VIP مجانية", "مطعم المأكولات الدولية", "نادي صحي منفصل للرجال والنساء", "مواقف خاصة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('45282053-6689-40dd-8081-12105c063aa0', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('45282053-6689-40dd-8081-12105c063aa0', 'https://images.unsplash.com/photo-1590381105924-c72589b9ef3f?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '65cb5454-2465-4804-bfb0-80f772555621', '45282053-6689-40dd-8081-12105c063aa0', 'double', 'غرفة ديلوكس كينج', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '65cb5454-2465-4804-bfb0-80f772555621', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    420.0, 345.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '08e484a3-af81-43e7-98b2-9ffae8633aa8', '45282053-6689-40dd-8081-12105c063aa0', 'quad', 'غرفة رباعية فاخرة', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '08e484a3-af81-43e7-98b2-9ffae8633aa8', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    590.0, 480.0, 155.0, 125.0
);


-- --------------------------------------------------------------------
-- فندق: فندق ريتاج الريان مكة (MAK-HTL-0177)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'cc40b69c-4a5e-4c7f-bc66-f8b4b48a4b0b', 'MAK-HTL-0177', 'فندق ريتاج الريان مكة', 'Retaj Al Rayyan Makkah', 'makkah', 'العزيزية الشمالية', 'حي الروضة، مكة المكرمة',
    21.41, 39.862, 'https://www.google.com/maps/search/?api=1&query=21.41,39.862', 4669, 'shuttle_bus', FALSE,
    4, '+966 12 550 2222', '', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=1200&q=80',
    'فندق عائلي مميز يوفر باصات شاتل سريعة تنقل النزلاء لمحطة باب علي بالحرم الشريف، مع غرف عائلية رحبة وبوفيه غني.', '["باصات شاتل للحرم 24 ساعة", "بوفيه إفطار خليجي", "غرف عائلية متصلة", "مواقف مجانية"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('cc40b69c-4a5e-4c7f-bc66-f8b4b48a4b0b', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('cc40b69c-4a5e-4c7f-bc66-f8b4b48a4b0b', 'https://images.unsplash.com/photo-1568495248636-6432b97bd949?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '677112a4-b245-4815-ad62-0aee18524ec4', 'cc40b69c-4a5e-4c7f-bc66-f8b4b48a4b0b', 'quad', 'غرفة رباعية عائلية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '677112a4-b245-4815-ad62-0aee18524ec4', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    380.0, 310.0, 100.0, 80.0
);


-- --------------------------------------------------------------------
-- فندق: فندق أنوار المشاعر مكة (MAK-HTL-0178)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '1a062571-2990-4816-b066-4419c5daf556', 'MAK-HTL-0178', 'فندق أنوار المشاعر مكة', 'Anwar Al Mashaer Hotel', 'makkah', 'محبس الجن', 'شارع المسجد الحرام، محبس الجن، مكة المكرمة',
    21.4245, 39.8492, 'https://www.google.com/maps/search/?api=1&query=21.4245,39.8492', 2821, 'shuttle_bus', FALSE,
    3, '+966 12 558 1111', '', 'https://images.unsplash.com/photo-1590381105924-c72589b9ef3f?auto=format&fit=crop&w=1200&q=80',
    'يقع في محبس الجن أمام محطة النقل الترددي المؤدية مباشرة إلى نفق باب علي بالمسجد الحرام في 3 دقائق.', '["باصات شاتل دقيقة واحدة للحرم", "واي فاي مجاني", "استقبال 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('1a062571-2990-4816-b066-4419c5daf556', 'https://images.unsplash.com/photo-1568495248636-6432b97bd949?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('1a062571-2990-4816-b066-4419c5daf556', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'b7567a7c-c3a5-4c11-9ea1-4b0bfbfce9a9', '1a062571-2990-4816-b066-4419c5daf556', 'quad', 'غرفة رباعية قياسية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'b7567a7c-c3a5-4c11-9ea1-4b0bfbfce9a9', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    290.0, 235.0, 80.0, 65.0
);


-- --------------------------------------------------------------------
-- فندق: فندق دلة مكة (MAK-HTL-0179)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'da8152fe-5eee-4387-b5ba-98a19ca7a2ab', 'MAK-HTL-0179', 'فندق دلة مكة', 'Dallah Makkah Hotel', 'makkah', 'أجياد', 'شارع أجياد العام، مكة المكرمة',
    21.4162, 39.8275, 'https://www.google.com/maps/search/?api=1&query=21.4162,39.8275', 840, 'central_outer', TRUE,
    4, '+966 12 534 0000', '', 'https://images.unsplash.com/photo-1564769625905-50e93615e769?auto=format&fit=crop&w=1200&q=80',
    'فندق مرموق في شارع أجياد يبعد حوالي 500 متر مشياً عن ساحات الحرم المكي الشريف وباب الملك عبد العزيز.', '["مشياً للحرم 6 دقائق", "مطعم المائدة", "مصلى داخلي", "خدمات غسيل سريعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('da8152fe-5eee-4387-b5ba-98a19ca7a2ab', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('da8152fe-5eee-4387-b5ba-98a19ca7a2ab', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '5d3f89ae-00fb-4d0d-b94b-b089d12488f8', 'da8152fe-5eee-4387-b5ba-98a19ca7a2ab', 'quad', 'غرفة رباعية كلاسيكية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '5d3f89ae-00fb-4d0d-b94b-b089d12488f8', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    750.0, 610.0, 198.0, 160.0
);


-- --------------------------------------------------------------------
-- فندق: فندق بركة برهان مكة (MAK-HTL-0180)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '8120e02b-9e1d-494f-9322-a90600f49135', 'MAK-HTL-0180', 'فندق بركة برهان مكة', 'Barakah Burhan Hotel', 'makkah', 'العزيزية الجنوبية', 'شارع عبد الله خياط، العزيزية الجنوبية، مكة المكرمة',
    21.3985, 39.8654, 'https://www.google.com/maps/search/?api=1&query=21.3985,39.8654', 5730, 'shuttle_bus', FALSE,
    3, '+966 12 559 4444', '', 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=1200&q=80',
    'فندق اقتصادي عالي الجودة يوفر إقامة ممتازة لحملات العمرة والمجموعات مع حافلات ترددية مستمرة للحرم.', '["باصات شاتل مجانية على مدار الساعة", "مطعم للمجموعات", "واي فاي سريع"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('8120e02b-9e1d-494f-9322-a90600f49135', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('8120e02b-9e1d-494f-9322-a90600f49135', 'https://images.unsplash.com/photo-1592229505726-ca121723b8ef?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '487cc071-b967-43c9-b169-62885008cff5', '8120e02b-9e1d-494f-9322-a90600f49135', 'quad', 'غرفة رباعية اقتصادية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '487cc071-b967-43c9-b169-62885008cff5', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    240.0, 190.0, 65.0, 50.0
);


-- --------------------------------------------------------------------
-- فندق: فندق جابر رويال مكة (MAK-HTL-0181)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '922dbd96-9c96-42c3-9b19-1d6b09b04baf', 'MAK-HTL-0181', 'فندق جابر رويال مكة', 'Jaber Royal Hotel Makkah', 'makkah', 'محبس الجن', 'شارع الروضة، محبس الجن، مكة المكرمة',
    21.4251, 39.8512, 'https://www.google.com/maps/search/?api=1&query=21.4251,39.8512', 3072, 'shuttle_bus', FALSE,
    3, '+966 12 556 7777', '', 'https://images.unsplash.com/photo-1591088398332-8a7791972843?auto=format&fit=crop&w=1200&q=80',
    'فندق متميز بجوار محطة أنفاق محبس الجن المؤدية إلى باب علي بالحرم، مع أسرة مريحة وخدمة سريعة.', '["نقل ترددي سريع للحرم", "استقبال 24 ساعة", "واي فاي مجاني"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('922dbd96-9c96-42c3-9b19-1d6b09b04baf', 'https://images.unsplash.com/photo-1592229505726-ca121723b8ef?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('922dbd96-9c96-42c3-9b19-1d6b09b04baf', 'https://images.unsplash.com/photo-1541971875076-8f970d573be6?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '9747c412-7385-4a9c-ba60-4198bde66295', '922dbd96-9c96-42c3-9b19-1d6b09b04baf', 'quad', 'غرفة رباعية مريحة', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '9747c412-7385-4a9c-ba60-4198bde66295', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    270.0, 215.0, 75.0, 58.0
);


-- --------------------------------------------------------------------
-- فندق: فندق مشاعر الحرم مكة (MAK-HTL-0182)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'e11a11db-80f4-4da7-bd5e-ac4d49356104', 'MAK-HTL-0182', 'فندق مشاعر الحرم مكة', 'Mashaer Al Haram Hotel', 'makkah', 'العزيزية الشمالية', 'طريق المسجد الحرام، العزيزية الشمالية، مكة المكرمة',
    21.4135, 39.859, 'https://www.google.com/maps/search/?api=1&query=21.4135,39.859', 4176, 'shuttle_bus', FALSE,
    4, '+966 12 557 6666', '', 'https://images.unsplash.com/photo-1592229505726-ca121723b8ef?auto=format&fit=crop&w=1200&q=80',
    'فندق 4 نجوم فاخر في العزيزية مع خدمة شاتل باص راقية وبوفيه إفطار خليجي وعربي ومطاعم متعددة.', '["باصات شاتل خاصة للحرم", "بوفيه إفطار فاخر", "صالة رياضية", "مواقف خاصة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e11a11db-80f4-4da7-bd5e-ac4d49356104', 'https://images.unsplash.com/photo-1508253578933-20b529302151?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e11a11db-80f4-4da7-bd5e-ac4d49356104', 'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '400bedf3-310e-4179-aa97-e13ec1008462', 'e11a11db-80f4-4da7-bd5e-ac4d49356104', 'quad', 'غرفة رباعية ديلوكس', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '400bedf3-310e-4179-aa97-e13ec1008462', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    420.0, 345.0, 115.0, 92.0
);


-- --------------------------------------------------------------------
-- فندق: فندق المرجان مكة (MAK-HTL-0183)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '4c812980-3a6e-4814-b06e-17dbcb3eab3e', 'MAK-HTL-0183', 'فندق المرجان مكة', 'Al Morjan Hotel Makkah', 'makkah', 'المسفلة', 'شارع الهجرة، المسفلة، مكة المكرمة',
    21.4095, 39.825, 'https://www.google.com/maps/search/?api=1&query=21.4095,39.825', 1710, 'shuttle_bus', FALSE,
    3, '+966 12 537 9999', '', 'https://images.unsplash.com/photo-1541971875076-8f970d573be6?auto=format&fit=crop&w=1200&q=80',
    'يقع في المسفلة على بعد مسافة مشي معتدلة من الحرم، ويتميز بنظافة فائقة وأسعار اقتصادية مناسبة للعائلات.', '["قريب من ساحات الحرم الجنوبية", "خدمة واي فاي", "مصاعد سريعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('4c812980-3a6e-4814-b06e-17dbcb3eab3e', 'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('4c812980-3a6e-4814-b06e-17dbcb3eab3e', 'https://images.unsplash.com/photo-1596701062351-8c2c14d1fdd0?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'daa4cb45-08bb-413a-b0df-1721f96ae782', '4c812980-3a6e-4814-b06e-17dbcb3eab3e', 'quad', 'غرفة رباعية كلاسيكية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'daa4cb45-08bb-413a-b0df-1721f96ae782', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    340.0, 275.0, 92.0, 74.0
);


-- --------------------------------------------------------------------
-- فندق: فندق مجد المحبس مكة (MAK-HTL-0184)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '4811b54e-781e-4afb-9e70-65303829e93e', 'MAK-HTL-0184', 'فندق مجد المحبس مكة', 'Majd Al Mahbas Hotel', 'makkah', 'محبس الجن', 'طريق الملك عبد العزيز، محبس الجن، مكة المكرمة',
    21.4239, 39.848, 'https://www.google.com/maps/search/?api=1&query=21.4239,39.848', 2668, 'shuttle_bus', FALSE,
    3, '+966 12 558 3333', '', 'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?auto=format&fit=crop&w=1200&q=80',
    'فندق نظيف ومعتمد بالقرب من أنفاق محبس الجن يتيح الوصول للحرم خلال 4 دقائق بالحافلات السريعة.', '["باصات شاتل سريعة للحرم", "استقبال 24 ساعة", "تكييف مركزي"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('4811b54e-781e-4afb-9e70-65303829e93e', 'https://images.unsplash.com/photo-1598928506311-c55ded91a20c?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('4811b54e-781e-4afb-9e70-65303829e93e', 'https://images.unsplash.com/photo-1565552645632-d725f8bfc19a?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '88a5e43f-7056-4c58-b514-0b8280f322fe', '4811b54e-781e-4afb-9e70-65303829e93e', 'quad', 'غرفة رباعية مريحة', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '88a5e43f-7056-4c58-b514-0b8280f322fe', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    260.0, 210.0, 70.0, 56.0
);


-- --------------------------------------------------------------------
-- فندق: فندق روز بارك مكة (MAK-HTL-0185)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'e6612b45-d21b-419c-8752-64daa2abab43', 'MAK-HTL-0185', 'فندق روز بارك مكة', 'Rose Park Hotel Makkah', 'makkah', 'العزيزية', 'شارع العزيزية العام، مكة المكرمة',
    21.402, 39.868, 'https://www.google.com/maps/search/?api=1&query=21.402,39.868', 5770, 'shuttle_bus', FALSE,
    4, '+966 12 559 8888', '', 'https://images.unsplash.com/photo-1598928506311-c55ded91a20c?auto=format&fit=crop&w=1200&q=80',
    'يوفر إقامة فندقية راقية بمستوى 4 نجوم في حي العزيزية التجاري مع باصات شاتل مجانية على مدار 24 ساعة.', '["باصات شاتل مجانية للحرم", "بوفيه إفطار", "مطعم عالمي", "واي فاي"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e6612b45-d21b-419c-8752-64daa2abab43', 'https://images.unsplash.com/photo-1596701062351-8c2c14d1fdd0?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e6612b45-d21b-419c-8752-64daa2abab43', 'https://images.unsplash.com/photo-1564769625905-50e93615e769?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '8245511c-0849-4032-94ad-194cfbcc5bbd', 'e6612b45-d21b-419c-8752-64daa2abab43', 'quad', 'غرفة رباعية فسيحة', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '8245511c-0849-4032-94ad-194cfbcc5bbd', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    390.0, 320.0, 105.0, 85.0
);


-- --------------------------------------------------------------------
-- فندق: فندق قصر الماسة مكة (MAK-HTL-0186)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '2d7f61de-31d9-4420-80fc-6e97f4faf5cb', 'MAK-HTL-0186', 'فندق قصر الماسة مكة', 'Qasr Al Massa Hotel', 'makkah', 'أجياد', 'شارع أجياد السد، مكة المكرمة',
    21.417, 39.828, 'https://www.google.com/maps/search/?api=1&query=21.417,39.828', 753, 'central_outer', TRUE,
    4, '+966 12 573 1111', '', 'https://images.unsplash.com/photo-1596701062351-8c2c14d1fdd0?auto=format&fit=crop&w=1200&q=80',
    'يبعد مسافة 400 متر مشياً عن ساحات الحرم وباب الملك عبد العزيز، ويتميز بموقعه المركزي في أجياد السد.', '["400م مشياً للحرم", "بوفيه إفطار", "مصلى داخلي", "استقبال 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2d7f61de-31d9-4420-80fc-6e97f4faf5cb', 'https://images.unsplash.com/photo-1565552645632-d725f8bfc19a?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2d7f61de-31d9-4420-80fc-6e97f4faf5cb', 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'ceb82b8d-e877-405f-9ce2-7d4b62abaa47', '2d7f61de-31d9-4420-80fc-6e97f4faf5cb', 'quad', 'غرفة رباعية ديلوكس', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'ceb82b8d-e877-405f-9ce2-7d4b62abaa47', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    780.0, 635.0, 205.0, 165.0
);


-- --------------------------------------------------------------------
-- فندق: فندق فلاح الشبيكة مكة (MAK-HTL-0187)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '00ee26f1-9d82-4d62-a642-3072050383a9', 'MAK-HTL-0187', 'فندق فلاح الشبيكة مكة', 'Falah Al Shubaika Hotel', 'makkah', 'جبل عمر', 'حي الشبيكة، بالقرب من جبل عمر، مكة المكرمة',
    21.421, 39.819, 'https://www.google.com/maps/search/?api=1&query=21.421,39.819', 902, 'central_outer', TRUE,
    3, '+966 12 543 2222', '', 'https://images.unsplash.com/photo-1565552645632-d725f8bfc19a?auto=format&fit=crop&w=1200&q=80',
    'يقع خلف مشروع جبل عمر على بعد مسافة مشي قصيرة لساحات الحرم الغربية وبوابة الملك فهد.', '["مشياً للحرم 8 دقائق", "واي فاي مجاني", "خدمة غرف"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('00ee26f1-9d82-4d62-a642-3072050383a9', 'https://images.unsplash.com/photo-1564769625905-50e93615e769?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('00ee26f1-9d82-4d62-a642-3072050383a9', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '72f4c8eb-022f-4b56-8062-cb7e59345205', '00ee26f1-9d82-4d62-a642-3072050383a9', 'quad', 'غرفة رباعية قياسية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '72f4c8eb-022f-4b56-8062-cb7e59345205', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    420.0, 340.0, 112.0, 90.0
);


-- --------------------------------------------------------------------
-- فندق: فندق بتراء مكة (MAK-HTL-0188)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '5f5ffef7-fe8c-42c8-ba1e-bb711d52c661', 'MAK-HTL-0188', 'فندق بتراء مكة', 'Batra Hotel Makkah', 'makkah', 'أجياد', 'شارع أجياد العام، مكة المكرمة',
    21.4178, 39.827, 'https://www.google.com/maps/search/?api=1&query=21.4178,39.827', 623, 'central_outer', TRUE,
    4, '+966 12 572 6666', '', 'https://images.unsplash.com/photo-1564769625905-50e93615e769?auto=format&fit=crop&w=1200&q=80',
    'فندق مشهور ومحبوب في شارع أجياد يبعد 350 متراً فقط عن ساحات الحرم الشريف مع وصول سهل وبوفيه يومي.', '["350م مشياً للحرم", "بوفيه إفطار", "مصلى داخلي", "خدمات كونسيرج"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5f5ffef7-fe8c-42c8-ba1e-bb711d52c661', 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5f5ffef7-fe8c-42c8-ba1e-bb711d52c661', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '3e629b49-acff-43dc-8ed3-e9504abd4be8', '5f5ffef7-fe8c-42c8-ba1e-bb711d52c661', 'quad', 'غرفة رباعية كلاسيكية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '3e629b49-acff-43dc-8ed3-e9504abd4be8', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    820.0, 670.0, 215.0, 175.0
);


-- --------------------------------------------------------------------
-- فندق: فندق البلد مكة (MAK-HTL-0189)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '83846c63-2da6-4017-9b48-36bf365f0727', 'MAK-HTL-0189', 'فندق البلد مكة', 'Al Balad Hotel Makkah', 'makkah', 'إبراهيم الخليل', 'حي الهجلة، بالقرب من شارع إبراهيم الخليل، مكة المكرمة',
    21.4168, 39.8235, 'https://www.google.com/maps/search/?api=1&query=21.4168,39.8235', 816, 'central_outer', TRUE,
    3, '+966 12 542 7777', '', 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=1200&q=80',
    'يقع في حي الهجلة على بعد 450 متراً مشياً من ساحات المسجد الحرام الجنوبية في موقع هادئ ومريح.', '["450م مشياً للحرم", "واي فاي سريع", "استقبال على مدار 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('83846c63-2da6-4017-9b48-36bf365f0727', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('83846c63-2da6-4017-9b48-36bf365f0727', 'https://images.unsplash.com/photo-1590381105924-c72589b9ef3f?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '8b5c4ec8-dd08-4167-8fe3-fe4219188da6', '83846c63-2da6-4017-9b48-36bf365f0727', 'quad', 'غرفة رباعية مريحة', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '8b5c4ec8-dd08-4167-8fe3-fe4219188da6', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    520.0, 420.0, 140.0, 112.0
);


-- --------------------------------------------------------------------
-- فندق: فندق سمانة مكة (MAK-HTL-0190)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '3d36081f-7441-4f3a-afdf-98f29ba014f1', 'MAK-HTL-0190', 'فندق سمانة مكة', 'Samana Hotel Makkah', 'makkah', 'كدي', 'حي كدي، الطريق الدائري الثالث، مكة المكرمة',
    21.399, 39.832, 'https://www.google.com/maps/search/?api=1&query=21.399,39.832', 3162, 'shuttle_bus', FALSE,
    3, '+966 12 534 8888', '', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=1200&q=80',
    'يوفر إقامة مريحة في منطقة كدي بالقرب من محطة حافلات كدي المباشرة للحرم بأسعار اقتصادية ممتازة.', '["قريب من محطة حافلات كدي", "مواقف سيارات واسعة", "تكييف ممتاز"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('3d36081f-7441-4f3a-afdf-98f29ba014f1', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('3d36081f-7441-4f3a-afdf-98f29ba014f1', 'https://images.unsplash.com/photo-1568495248636-6432b97bd949?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'eacdbad5-92d5-463d-be98-6d9941136b78', '3d36081f-7441-4f3a-afdf-98f29ba014f1', 'quad', 'غرفة رباعية اقتصادية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'eacdbad5-92d5-463d-be98-6d9941136b78', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    250.0, 200.0, 68.0, 54.0
);


-- --------------------------------------------------------------------
-- فندق: فندق وحدات أجياد مكة (MAK-HTL-0191)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'e0d2c9ea-1ccb-48bd-bf4c-0101731de5ea', 'MAK-HTL-0191', 'فندق وحدات أجياد مكة', 'Wehdat Ajyad Hotel', 'makkah', 'أجياد', 'شارع أجياد العام، مكة المكرمة',
    21.4182, 39.8268, 'https://www.google.com/maps/search/?api=1&query=21.4182,39.8268', 567, 'central_outer', TRUE,
    4, '+966 12 571 3333', '', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=1200&q=80',
    'يقع في أجياد على مسافة 300 متر فقط من ساحات المسجد الحرام، ويتميز بخدمة راقية وسرعة الوصول للحرم.', '["300م فقط للحرم", "بوفيه إفطار", "مصلى داخلي", "واي فاي سريع"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e0d2c9ea-1ccb-48bd-bf4c-0101731de5ea', 'https://images.unsplash.com/photo-1590381105924-c72589b9ef3f?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e0d2c9ea-1ccb-48bd-bf4c-0101731de5ea', 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'b5bd7cae-5888-42d2-9388-7076c61f903a', 'e0d2c9ea-1ccb-48bd-bf4c-0101731de5ea', 'quad', 'غرفة رباعية ديلوكس', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'b5bd7cae-5888-42d2-9388-7076c61f903a', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    890.0, 730.0, 235.0, 190.0
);


-- --------------------------------------------------------------------
-- فندق: فندق سندس التيسير مكة (MAK-HTL-0192)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'e89bc21f-93df-48e3-a1a5-71887318af23', 'MAK-HTL-0192', 'فندق سندس التيسير مكة', 'Sondos Al Tayseer Hotel', 'makkah', 'التيسير', 'حي التيسير، شارع المنصور، مكة المكرمة',
    21.4325, 39.813, 'https://www.google.com/maps/search/?api=1&query=21.4325,39.813', 2080, 'shuttle_bus', FALSE,
    3, '+966 12 530 5555', '', 'https://images.unsplash.com/photo-1590381105924-c72589b9ef3f?auto=format&fit=crop&w=1200&q=80',
    'فندق عائلي اقتصادي في التيسير يوفر حافلات ترددية تنقل النزلاء إلى ساحات التوسعة الشمالية في دقائق معدودة.', '["باصات شاتل سريعة للحرم", "استقبال 24 ساعة", "مطعم للمجموعات"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e89bc21f-93df-48e3-a1a5-71887318af23', 'https://images.unsplash.com/photo-1568495248636-6432b97bd949?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e89bc21f-93df-48e3-a1a5-71887318af23', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '4ccaef6d-383c-4832-8705-9ef725ab3b30', 'e89bc21f-93df-48e3-a1a5-71887318af23', 'quad', 'غرفة رباعية اقتصادية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '4ccaef6d-383c-4832-8705-9ef725ab3b30', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    230.0, 185.0, 62.0, 50.0
);


-- --------------------------------------------------------------------
-- فندق: فندق رواق مكة (MAK-HTL-0193)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'fd019290-d6a2-4869-9c70-dfaef44990c8', 'MAK-HTL-0193', 'فندق رواق مكة', 'Rawaq Makkah Hotel', 'makkah', 'أجياد', 'حي المعابدة، طريق المسجد الحرام، مكة المكرمة',
    21.436, 39.841, 'https://www.google.com/maps/search/?api=1&query=21.436,39.841', 2532, 'shuttle_bus', FALSE,
    3, '+966 12 534 0000', '', 'https://images.unsplash.com/photo-1564769625905-50e93615e769?auto=format&fit=crop&w=1200&q=80',
    'يقع في المعابدة ويوفر إقامة هادئة مع مواصلات سريعة لساحات الحرم ومقبرة المعلاة وباب علي.', '["مواصلات للحرم", "واي فاي مجاني", "غرف عائلية فسيحة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('fd019290-d6a2-4869-9c70-dfaef44990c8', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('fd019290-d6a2-4869-9c70-dfaef44990c8', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'c675ce3a-4684-429a-9032-f7e8e14644b9', 'fd019290-d6a2-4869-9c70-dfaef44990c8', 'quad', 'غرفة رباعية مريحة', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'c675ce3a-4684-429a-9032-f7e8e14644b9', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    260.0, 210.0, 70.0, 56.0
);


-- --------------------------------------------------------------------
-- فندق: فندق الخزامى مكة (MAK-HTL-0194)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'a88a31d6-6efa-42b5-be6c-ea2b356cddff', 'MAK-HTL-0194', 'فندق الخزامى مكة', 'Al Khozama Makkah Hotel', 'makkah', 'أجياد', 'حي ريع بخش، مكة المكرمة',
    21.413, 39.831, 'https://www.google.com/maps/search/?api=1&query=21.413,39.831', 1376, 'shuttle_bus', FALSE,
    3, '+966 12 534 0000', '', 'https://images.unsplash.com/photo-1564769625905-50e93615e769?auto=format&fit=crop&w=1200&q=80',
    'يبعد مسافة مشي معتدلة حوالي 750 متراً عن ساحات الحرم وباب الملك عبد العزيز، مع أسعار اقتصادية ونظافة ممتازة.', '["مشياً للحرم 10 دقائق", "استقبال 24 ساعة", "واي فاي"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a88a31d6-6efa-42b5-be6c-ea2b356cddff', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('a88a31d6-6efa-42b5-be6c-ea2b356cddff', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '9efc78ac-e8bc-4d6a-ba3d-258a4c2f1a50', 'a88a31d6-6efa-42b5-be6c-ea2b356cddff', 'quad', 'غرفة رباعية كلاسيكية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '9efc78ac-e8bc-4d6a-ba3d-258a4c2f1a50', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    360.0, 290.0, 98.0, 78.0
);


-- --------------------------------------------------------------------
-- فندق: فندق نور الصفا مكة (MAK-HTL-0195)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'dd065d4a-3fb7-4a92-b2f5-ba2bde048796', 'MAK-HTL-0195', 'فندق نور الصفا مكة', 'Nour Al Safa Hotel', 'makkah', 'أجياد', 'شارع أجياد السد، مكة المكرمة',
    21.4165, 39.8272, 'https://www.google.com/maps/search/?api=1&query=21.4165,39.8272', 795, 'central_outer', TRUE,
    3, '+966 12 572 4444', '', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=1200&q=80',
    'يقع في أجياد السد على مسافة 450 متراً مشياً من ساحات الحرم الشريف في موقع هادئ وقريب من الخدمات.', '["450م مشياً للحرم", "خدمة استقبال 24 ساعة", "واي فاي مجاني"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('dd065d4a-3fb7-4a92-b2f5-ba2bde048796', 'https://images.unsplash.com/photo-1591088398332-8a7791972843?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('dd065d4a-3fb7-4a92-b2f5-ba2bde048796', 'https://images.unsplash.com/photo-1508253578933-20b529302151?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '7b00a106-b4a3-4813-a3e6-03735903db53', 'dd065d4a-3fb7-4a92-b2f5-ba2bde048796', 'quad', 'غرفة رباعية قياسية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '7b00a106-b4a3-4813-a3e6-03735903db53', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    480.0, 390.0, 130.0, 105.0
);


-- --------------------------------------------------------------------
-- فندق: فندق لؤلؤة التوحيد مكة (MAK-HTL-0196)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '4da75da4-e75d-4b93-81af-375888ef680f', 'MAK-HTL-0196', 'فندق لؤلؤة التوحيد مكة', 'Loloat Al Tawheed Hotel', 'makkah', 'إبراهيم الخليل', 'شارع إبراهيم الخليل، المسفلة، مكة المكرمة',
    21.4118, 39.8225, 'https://www.google.com/maps/search/?api=1&query=21.4118,39.8225', 1474, 'shuttle_bus', FALSE,
    3, '+966 12 536 7777', '', 'https://images.unsplash.com/photo-1591088398332-8a7791972843?auto=format&fit=crop&w=1200&q=80',
    'يقع في بداية شارع إبراهيم الخليل بالمسفلة على بعد حوالي 800 متر مشياً عن ساحات الحرم الشريف وبوابة الملك عبد العزيز.', '["مشياً للحرم في شارع إبراهيم الخليل", "مطاعم مجاورة", "واي فاي سريع"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('4da75da4-e75d-4b93-81af-375888ef680f', 'https://images.unsplash.com/photo-1592229505726-ca121723b8ef?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('4da75da4-e75d-4b93-81af-375888ef680f', 'https://images.unsplash.com/photo-1541971875076-8f970d573be6?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'c530545e-b7bf-417f-a937-625d96962abe', '4da75da4-e75d-4b93-81af-375888ef680f', 'quad', 'غرفة رباعية كلاسيكية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'c530545e-b7bf-417f-a937-625d96962abe', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    380.0, 305.0, 102.0, 82.0
);


-- --------------------------------------------------------------------
-- فندق: فندق الحمراء مكة (MAK-HTL-0197)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'ac73203d-0bcd-451f-b1bb-2f2306a4aec1', 'MAK-HTL-0197', 'فندق الحمراء مكة', 'Al Hamra Hotel Makkah', 'makkah', 'الشبيكة', 'حي الشبيكة، بالقرب من طريق أم القرى، مكة المكرمة',
    21.4225, 39.818, 'https://www.google.com/maps/search/?api=1&query=21.4225,39.818', 1002, 'central_outer', TRUE,
    3, '+966 12 544 5555', '', 'https://images.unsplash.com/photo-1592229505726-ca121723b8ef?auto=format&fit=crop&w=1200&q=80',
    'فندق مميز في منطقة الشبيكة يبعد مسافة مشي مريحة عن ساحات التوسعة الغربية وباب الملك فهد.', '["مشياً للحرم 7 دقائق", "استقبال 24 ساعة", "واي فاي مجاني"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('ac73203d-0bcd-451f-b1bb-2f2306a4aec1', 'https://images.unsplash.com/photo-1508253578933-20b529302151?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('ac73203d-0bcd-451f-b1bb-2f2306a4aec1', 'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'acb5df83-1280-4648-a4e7-2fb84a7e13b8', 'ac73203d-0bcd-451f-b1bb-2f2306a4aec1', 'quad', 'غرفة رباعية قياسية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'acb5df83-1280-4648-a4e7-2fb84a7e13b8', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    410.0, 330.0, 110.0, 88.0
);


-- --------------------------------------------------------------------
-- فندق: فندق آفاق مكة (MAK-HTL-0198)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'b5c7e9eb-3918-4316-b3b2-c2f2fb7790dc', 'MAK-HTL-0198', 'فندق آفاق مكة', 'Afaq Makkah Hotel', 'makkah', 'العزيزية الجنوبية', 'شارع عبد الله خياط، العزيزية الجنوبية، مكة المكرمة',
    21.401, 39.866, 'https://www.google.com/maps/search/?api=1&query=21.401,39.866', 5619, 'shuttle_bus', FALSE,
    3, '+966 12 534 0000', '', 'https://images.unsplash.com/photo-1564769625905-50e93615e769?auto=format&fit=crop&w=1200&q=80',
    'فندق شاتل باص متميز في العزيزية مع حافلات تنقل النزلاء بانتظام إلى الحرم ومحطة باب علي على مدار الساعة.', '["حافلات شاتل مجانية 24 ساعة", "بوفيه للمجموعات", "واي فاي"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b5c7e9eb-3918-4316-b3b2-c2f2fb7790dc', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b5c7e9eb-3918-4316-b3b2-c2f2fb7790dc', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '5e2dee36-8021-4e2d-aaeb-7ca45a35d7de', 'b5c7e9eb-3918-4316-b3b2-c2f2fb7790dc', 'quad', 'غرفة رباعية اقتصادية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '5e2dee36-8021-4e2d-aaeb-7ca45a35d7de', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    250.0, 200.0, 68.0, 54.0
);


-- --------------------------------------------------------------------
-- فندق: فندق الخليل جراند مكة (MAK-HTL-0199)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'd66b5840-7013-4919-a392-dd752370038c', 'MAK-HTL-0199', 'فندق الخليل جراند مكة', 'Al Khalil Grand Hotel', 'makkah', 'إبراهيم الخليل', 'شارع إبراهيم الخليل، دحلة الرشد، مكة المكرمة',
    21.414, 39.823, 'https://www.google.com/maps/search/?api=1&query=21.414,39.823', 1180, 'central_outer', TRUE,
    4, '+966 12 539 1111', '', 'https://images.unsplash.com/photo-1541971875076-8f970d573be6?auto=format&fit=crop&w=1200&q=80',
    'يقع مباشرة في شارع إبراهيم الخليل الحيوي على مسافة مشي حوالي 600 متر عن الحرم المكي الشريف.', '["600م مشياً للحرم", "بوفيه إفطار مفتوح", "مصلى داخلي", "استقبال 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('d66b5840-7013-4919-a392-dd752370038c', 'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('d66b5840-7013-4919-a392-dd752370038c', 'https://images.unsplash.com/photo-1596701062351-8c2c14d1fdd0?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '751fed2e-b935-432a-81ee-38ffff354472', 'd66b5840-7013-4919-a392-dd752370038c', 'quad', 'غرفة رباعية ديلوكس', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '751fed2e-b935-432a-81ee-38ffff354472', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    650.0, 525.0, 175.0, 140.0
);


-- --------------------------------------------------------------------
-- فندق: فندق أوبروي المدينة (MED-HTL-0001)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '0fb8f20d-891e-4482-a42c-3011d939195b', 'MED-HTL-0001', 'فندق أوبروي المدينة', 'The Oberoi, Madina', 'madinah', 'المنطقة المركزية الشمالية', 'المنطقة المركزية الشمالية، قبالة الحرم النبوي وباب النساء',
    24.4711, 39.6105, 'https://www.google.com/maps/search/?api=1&query=24.4711,39.6105', 512, 'central_outer', TRUE,
    5, '+966 14 828 2222', '', 'https://images.unsplash.com/photo-1591604129939-f1efa4d9f7fa?auto=format&fit=crop&w=1200&q=80',
    'أفخم وأعرق فنادق طيبة الطيبة؛ ملاصق لساحات المسجد النبوي الشريف وقبالة الروضة الشريفة وباب السلام وباب النساء.', '["ملاصق لساحات الحرم النبوي", "إطلالة على القبة الخضراء", "خدمة بتلر خاصة", "مطعم المائدة الأندلسي"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('0fb8f20d-891e-4482-a42c-3011d939195b', 'https://images.unsplash.com/photo-1590381105924-c72589b9ef3f?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('0fb8f20d-891e-4482-a42c-3011d939195b', 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '8554bead-cf71-41d7-866d-fb7d9edc639d', '0fb8f20d-891e-4482-a42c-3011d939195b', 'double', 'غرفة جونيور إطلالة مباشرة للحرم النبوي', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '8554bead-cf71-41d7-866d-fb7d9edc639d', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2150.0, 1800.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '5e44d538-4571-42f1-8429-9cb34e7010bf', '0fb8f20d-891e-4482-a42c-3011d939195b', 'triple', 'غرفة ديلوكس ثلاثية فاخرة', 3, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '5e44d538-4571-42f1-8429-9cb34e7010bf', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2550.0, 2120.0, NULL, NULL
);


-- --------------------------------------------------------------------
-- فندق: فندق دار التقوى المدينة (MED-HTL-0002)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '40019850-f864-49a7-918e-4a2012d882af', 'MED-HTL-0002', 'فندق دار التقوى المدينة', 'Dar Al Taqwa Hotel Madinah', 'madinah', 'المنطقة المركزية الشمالية', 'ساحات الحرم النبوي الشمالية، بوابة الملك فهد، المدينة المنورة',
    24.4705, 39.6118, 'https://www.google.com/maps/search/?api=1&query=24.4705,39.6118', 446, 'central_walking', TRUE,
    5, '+966 14 829 1111', '', 'https://images.unsplash.com/photo-1591604129939-f1efa4d9f7fa?auto=format&fit=crop&w=1200&q=80',
    'يقع مباشرة أمام مصلى النساء بالحرم النبوي الشريف وبوابة الملك فهد، ويعد الخيار الأول للعائلات الباحثة عن الراحة التامة.', '["أمام مصلى النساء مباشرة", "شاي الضيافة النبوي", "مطعم المروة الراقي", "مصلى داخلي"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('40019850-f864-49a7-918e-4a2012d882af', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('40019850-f864-49a7-918e-4a2012d882af', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'bd9b66cf-ff25-46d3-8293-8350af463c9f', '40019850-f864-49a7-918e-4a2012d882af', 'double', 'غرفة ديلوكس إطلالة حرم نبوي', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'bd9b66cf-ff25-46d3-8293-8350af463c9f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1600.0, 1320.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '49bef663-746d-480a-823b-925bb54be373', '40019850-f864-49a7-918e-4a2012d882af', 'quad', 'غرفة رباعية عائلية مميزة', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '49bef663-746d-480a-823b-925bb54be373', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1950.0, 1600.0, 510.0, 415.0
);


-- --------------------------------------------------------------------
-- فندق: فندق أنوار المدينة موفنبيك (MED-HTL-0003)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '6f36439d-d63d-418e-9a32-5adc1d2d379c', 'MED-HTL-0003', 'فندق أنوار المدينة موفنبيك', 'Anwar Al Madinah Mövenpick Hotel', 'madinah', 'المنطقة المركزية الشمالية', 'المنطقة المركزية الشمالية، قبالة ساحات الحرم النبوي الشريف',
    24.4718, 39.6102, 'https://www.google.com/maps/search/?api=1&query=24.4718,39.6102', 607, 'central_outer', TRUE,
    5, '+966 14 818 1000', '', 'https://images.unsplash.com/photo-1591604129939-f1efa4d9f7fa?auto=format&fit=crop&w=1200&q=80',
    'أكبر فندق في المدينة المنورة بواباته متصلة مباشرة بمركز التسوق وتطل مباشرة على ساحة الحرم النبوي الشمالية وباب الملك فهد.', '["متصل بمول تجاري ضخم", "أكبر مجمع مطاعم", "مصاعد سريعة للساحات", "خدمات VIP متطورة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('6f36439d-d63d-418e-9a32-5adc1d2d379c', 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('6f36439d-d63d-418e-9a32-5adc1d2d379c', 'https://images.unsplash.com/photo-1508253578933-20b529302151?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'e44568aa-fcb5-43fd-b85e-4a8ccb6ed150', '6f36439d-d63d-418e-9a32-5adc1d2d379c', 'double', 'غرفة كينج إطلالة حرم نبوي', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'e44568aa-fcb5-43fd-b85e-4a8ccb6ed150', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1450.0, 1220.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '2acfc0ee-0df7-4566-be25-94b41c60c194', '6f36439d-d63d-418e-9a32-5adc1d2d379c', 'quad', 'غرفة رباعية عائلية ممتازة', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '2acfc0ee-0df7-4566-be25-94b41c60c194', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1850.0, 1520.0, 490.0, 400.0
);


-- --------------------------------------------------------------------
-- فندق: فندق واجهة طيبة (طيبة أراك سابقاً) (MED-HTL-0004)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'aa638fcb-7dab-4c99-b65b-ce0f099f56dc', 'MED-HTL-0004', 'فندق واجهة طيبة (طيبة أراك سابقاً)', 'Maden Hotel Madinah', 'madinah', 'المنطقة المركزية الشمالية', 'المنطقة المركزية الشمالية، على بعد خطوات من باب الملك فهد',
    24.4715, 39.6101, 'https://www.google.com/maps/search/?api=1&query=24.4715,39.6101', 570, 'central_outer', TRUE,
    5, '+966 14 820 4444', '', 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=1200&q=80',
    'فندق حديث وفخم للغاية يبعد خطوات معدودة عن ساحات الحرم النبوي، ويتميز بأجنحة ملكية فسيحة وإطلالات مباشرة على القبة الخضراء.', '["خطوات قليلة لساحات الحرم", "إطلالة على القبة الخضراء", "بوفيه مفتوح راقي", "خدمة غرف سريعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('aa638fcb-7dab-4c99-b65b-ce0f099f56dc', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('aa638fcb-7dab-4c99-b65b-ce0f099f56dc', 'https://images.unsplash.com/photo-1592229505726-ca121723b8ef?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'da1f3926-35d9-4ed6-a86d-5e6c1af6e3e5', 'aa638fcb-7dab-4c99-b65b-ce0f099f56dc', 'quad', 'غرفة رباعية ممتازة إطلالة حرم', 4, TRUE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'da1f3926-35d9-4ed6-a86d-5e6c1af6e3e5', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1200.0, 980.0, 325.0, 260.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '86baa033-4d89-452e-942f-3976105b555f', 'aa638fcb-7dab-4c99-b65b-ce0f099f56dc', 'quint', 'غرفة خماسية عائلية', 5, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '86baa033-4d89-452e-942f-3976105b555f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1350.0, 1090.0, 290.0, 230.0
);


-- --------------------------------------------------------------------
-- فندق: فندق بولمان زمزم المدينة (MED-HTL-0005)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '2ae941c4-c28b-4f0e-afbc-b1ddc06bdc6e', 'MED-HTL-0005', 'فندق بولمان زمزم المدينة', 'Pullman Zamzam Madina', 'madinah', 'المنطقة المركزية الجنوبية', 'المنطقة المركزية الجنوبية، شارع عمرو بن العاص، المدينة المنورة',
    24.4635, 39.6102, 'https://www.google.com/maps/search/?api=1&query=24.4635,39.6102', 493, 'central_walking', TRUE,
    5, '+966 14 821 0500', '', 'https://images.unsplash.com/photo-1591604129939-f1efa4d9f7fa?auto=format&fit=crop&w=1200&q=80',
    'فندق راقي جداً في الجهة الجنوبية من الحرم النبوي الشريف، على بُعد 150 متراً من باب السلام وروضة النبي ﷺ.', '["150 متر فقط لباب السلام", "مطاعم مأكولات شرقية وغربية", "صالة شاي فاخرة", "خدمة استقبال VIP"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2ae941c4-c28b-4f0e-afbc-b1ddc06bdc6e', 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2ae941c4-c28b-4f0e-afbc-b1ddc06bdc6e', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'e7d316ac-7385-4e40-9445-cfbc588d0ec4', '2ae941c4-c28b-4f0e-afbc-b1ddc06bdc6e', 'double', 'غرفة كلاسيكية مزدوجة', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'e7d316ac-7385-4e40-9445-cfbc588d0ec4', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    980.0, 810.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '857de354-f5ae-4053-86a1-057412629881', '2ae941c4-c28b-4f0e-afbc-b1ddc06bdc6e', 'quad', 'غرفة رباعية واسعة', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '857de354-f5ae-4053-86a1-057412629881', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1280.0, 1050.0, 340.0, 275.0
);


-- --------------------------------------------------------------------
-- فندق: فندق شذا المدينة (MED-HTL-0006)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '1eb28720-a431-4115-9cf8-16052ffedf95', 'MED-HTL-0006', 'فندق شذا المدينة', 'Shaza Madinah Hotel', 'madinah', 'المنطقة المركزية الشمالية', 'المنطقة المركزية الشمالية، قبالة ساحات الحرم، المدينة المنورة',
    24.4725, 39.6095, 'https://www.google.com/maps/search/?api=1&query=24.4725,39.6095', 713, 'central_outer', TRUE,
    5, '+966 14 829 0001', '', 'https://images.unsplash.com/photo-1592229505726-ca121723b8ef?auto=format&fit=crop&w=1200&q=80',
    'تصميم شرقي ساحر مستوحى من طريق الحرير والضيافة الأندلسية، خطوات قليلة تفصله عن ساحات المسجد النبوي الشريف.', '["تصميم شرقي ساحر", "مطعم أرابيسك الراقي", "صالة شاليمار للاسترخاء", "خدمة كونسيرج خاصة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('1eb28720-a431-4115-9cf8-16052ffedf95', 'https://images.unsplash.com/photo-1568495248636-6432b97bd949?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('1eb28720-a431-4115-9cf8-16052ffedf95', 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '7844a027-c3fe-417a-9d50-80850f5070b8', '1eb28720-a431-4115-9cf8-16052ffedf95', 'double', 'غرفة ديلوكس كينج', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '7844a027-c3fe-417a-9d50-80850f5070b8', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1100.0, 910.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'a710a36c-b7ba-4966-ac6d-0051f9221f35', '1eb28720-a431-4115-9cf8-16052ffedf95', 'quad', 'غرفة عائلية رباعية إطلالة حرم', 4, TRUE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'a710a36c-b7ba-4966-ac6d-0051f9221f35', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1550.0, 1280.0, 410.0, 335.0
);


-- --------------------------------------------------------------------
-- فندق: فندق الروضة رويال المدينة (MED-HTL-0007)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'ef89db22-946c-41b3-aebc-89237ad6ccd3', 'MED-HTL-0007', 'فندق الروضة رويال المدينة', 'Al Rawda Royal Hotel Madinah', 'madinah', 'المنطقة المركزية الشمالية', 'المنطقة المركزية الشمالية، المدينة المنورة',
    24.4716, 39.611, 'https://www.google.com/maps/search/?api=1&query=24.4716,39.611', 576, 'central_outer', TRUE,
    5, '+966 14 829 9999', '', 'https://images.unsplash.com/photo-1592229505726-ca121723b8ef?auto=format&fit=crop&w=1200&q=80',
    'فخامة فرنسية ممزوجة بكرم الضيافة العربية الأصيلة قبالة ساحات الحرم النبوي الشريف مع أجنحة فاخرة مطلة على القبة الخضراء.', '["مباشر على ساحات الحرم", "مطعم أرابيسك الفرنسي", "خدمة VIP", "واي فاي مجاني سريع"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('ef89db22-946c-41b3-aebc-89237ad6ccd3', 'https://images.unsplash.com/photo-1508253578933-20b529302151?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('ef89db22-946c-41b3-aebc-89237ad6ccd3', 'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '11b22c7b-f244-4748-b964-bf31d32e0058', 'ef89db22-946c-41b3-aebc-89237ad6ccd3', 'quad', 'غرفة رباعية بريميوم', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '11b22c7b-f244-4748-b964-bf31d32e0058', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    850.0, 690.0, 225.0, 180.0
);


-- --------------------------------------------------------------------
-- فندق: فندق كراون بلازا المدينة (MED-HTL-0008)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'e579f25c-c868-4eac-82d8-7e4314d542ed', 'MED-HTL-0008', 'فندق كراون بلازا المدينة', 'Crowne Plaza Madinah', 'madinah', 'المنطقة المركزية الجنوبية', 'المنطقة المركزية الجنوبية، شارع الملك فيصل، المدينة المنورة',
    24.4628, 39.6115, 'https://www.google.com/maps/search/?api=1&query=24.4628,39.6115', 584, 'central_outer', TRUE,
    5, '+966 14 818 8888', '', 'https://images.unsplash.com/photo-1508253578933-20b529302151?auto=format&fit=crop&w=1200&q=80',
    'يطل على ساحات الحرم النبوي الجنوبية وباب السلام ومقبرة البقيع، ومجهز بالكامل لخدمة كبار الشخصيات وحملات العمرة المتميزة.', '["إطلالة على الحرم والبقيع", "مطاعم دولية", "مركز مؤتمرات", "مواقف خاصة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e579f25c-c868-4eac-82d8-7e4314d542ed', 'https://images.unsplash.com/photo-1541971875076-8f970d573be6?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e579f25c-c868-4eac-82d8-7e4314d542ed', 'https://images.unsplash.com/photo-1598928506311-c55ded91a20c?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '3a800d91-6896-4f6f-bf32-3ab0037ae596', 'e579f25c-c868-4eac-82d8-7e4314d542ed', 'double', 'غرفة ديلوكس كينج', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '3a800d91-6896-4f6f-bf32-3ab0037ae596', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    920.0, 760.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'd3999943-a186-4210-8c62-5412fc1f0292', 'e579f25c-c868-4eac-82d8-7e4314d542ed', 'quad', 'غرفة رباعية إطلالة حرم', 4, TRUE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'd3999943-a186-4210-8c62-5412fc1f0292', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1350.0, 1110.0, 355.0, 290.0
);


-- --------------------------------------------------------------------
-- فندق: فندق فرونتيل الحارثية المدينة (MED-HTL-0009)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'fb683a02-e592-4a78-99c3-3b0845060c95', 'MED-HTL-0009', 'فندق فرونتيل الحارثية المدينة', 'Frontel Al Harithia Hotel Madinah', 'madinah', 'المنطقة المركزية الشمالية', 'المنطقة المركزية الشمالية، خلف دار التقوى، المدينة المنورة',
    24.4716, 39.6122, 'https://www.google.com/maps/search/?api=1&query=24.4716,39.6122', 598, 'central_outer', TRUE,
    5, '+966 14 820 1111', '', 'https://images.unsplash.com/photo-1541971875076-8f970d573be6?auto=format&fit=crop&w=1200&q=80',
    'على بُعد خطوات معدودة من الحرم النبوي الشريف، يتميز بخدمات راقية ومطاعم تقدم أشهى المأكولات العربية والآسيوية.', '["خطوات للحرم النبوي", "نادي صحي وساونا", "مطعم الحارثية الدولي", "خدمة غرف 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('fb683a02-e592-4a78-99c3-3b0845060c95', 'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('fb683a02-e592-4a78-99c3-3b0845060c95', 'https://images.unsplash.com/photo-1596701062351-8c2c14d1fdd0?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '7b9a3b7c-131b-40ee-bce7-fe6567156b80', 'fb683a02-e592-4a78-99c3-3b0845060c95', 'quad', 'غرفة رباعية ديلوكس', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '7b9a3b7c-131b-40ee-bce7-fe6567156b80', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1050.0, 860.0, 280.0, 225.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '7e514bce-eaf9-4803-b674-3e0a5ce61c3b', 'fb683a02-e592-4a78-99c3-3b0845060c95', 'triple', 'غرفة ثلاثية مريحة', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '7e514bce-eaf9-4803-b674-3e0a5ce61c3b', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    920.0, 750.0, 325.0, 265.0
);


-- --------------------------------------------------------------------
-- فندق: فندق دلة طيبة المدينة (MED-HTL-0010)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '241be0a9-86e6-4b57-94dd-c34540c879b2', 'MED-HTL-0010', 'فندق دلة طيبة المدينة', 'Dallah Taibah Hotel', 'madinah', 'المنطقة المركزية الشمالية', 'المنطقة المركزية الشمالية، شارع أبي ذر الغفاري، المدينة المنورة',
    24.4719, 39.6125, 'https://www.google.com/maps/search/?api=1&query=24.4719,39.6125', 646, 'central_outer', TRUE,
    4, '+966 14 820 3333', '', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=1200&q=80',
    'يقع على مسافة 100 متر فقط من ساحات المسجد النبوي الشريف ومصلى النساء، ويتميز بجودة عالية وأسعار منافسة للغاية.', '["100 متر عن ساحات الحرم", "قريب من مصلى النساء", "بوفيه إفطار متنوع", "مقهى ومطعم عائلي"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('241be0a9-86e6-4b57-94dd-c34540c879b2', 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('241be0a9-86e6-4b57-94dd-c34540c879b2', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '2c894d59-d5f2-4af2-9319-c64a3e0e804b', '241be0a9-86e6-4b57-94dd-c34540c879b2', 'quad', 'غرفة رباعية كلاسيكية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '2c894d59-d5f2-4af2-9319-c64a3e0e804b', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    820.0, 670.0, 220.0, 178.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '6db9afa3-710e-45a3-8b85-4c7c8edcfab3', '241be0a9-86e6-4b57-94dd-c34540c879b2', 'triple', 'غرفة ثلاثية ديلوكس', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '6db9afa3-710e-45a3-8b85-4c7c8edcfab3', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    740.0, 600.0, 260.0, 210.0
);


-- --------------------------------------------------------------------
-- فندق: فندق سجى المدينة (MED-HTL-0011)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '9a9f0fb4-6eb4-4c78-8479-8363b8ebd1c9', 'MED-HTL-0011', 'فندق سجى المدينة', 'Saja Al Madinah Hotel', 'madinah', 'المنطقة المركزية الشمالية', 'المنطقة المركزية الشمالية، المدينة المنورة',
    24.473, 39.6105, 'https://www.google.com/maps/search/?api=1&query=24.473,39.6105', 761, 'central_outer', TRUE,
    4, '+966 14 820 8888', '', 'https://images.unsplash.com/photo-1598928506311-c55ded91a20c?auto=format&fit=crop&w=1200&q=80',
    'فندق عصري متألق يبعد 3 دقائق مشياً عن ساحات الحرم النبوي، يقدم غرفاً عائلية متعددة الأسرة تناسب جميع رحلات العمرة.', '["3 دقائق مشياً للحرم", "غرف عائلية ممتازة", "مطعم بوفيه مفتوح", "خدمة استقبال على مدار الساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('9a9f0fb4-6eb4-4c78-8479-8363b8ebd1c9', 'https://images.unsplash.com/photo-1596701062351-8c2c14d1fdd0?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('9a9f0fb4-6eb4-4c78-8479-8363b8ebd1c9', 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '4c3240da-94bd-4518-8623-afb2d4183ae8', '9a9f0fb4-6eb4-4c78-8479-8363b8ebd1c9', 'quad', 'غرفة رباعية ممتازة', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '4c3240da-94bd-4518-8623-afb2d4183ae8', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    790.0, 640.0, 210.0, 168.0
);


-- --------------------------------------------------------------------
-- فندق: فندق ديار المدينة (MED-HTL-0012)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'e666c58c-45a7-4548-ae72-21e21d13c1d6', 'MED-HTL-0012', 'فندق ديار المدينة', 'Diyar Al Madinah Hotel', 'madinah', 'المنطقة المركزية الشمالية', 'المنطقة المركزية الشمالية، خلف دار الإيمان، المدينة المنورة',
    24.4725, 39.612, 'https://www.google.com/maps/search/?api=1&query=24.4725,39.612', 707, 'central_outer', TRUE,
    4, '+966 14 838 9999', '', 'https://images.unsplash.com/photo-1596701062351-8c2c14d1fdd0?auto=format&fit=crop&w=1200&q=80',
    'فندق اقتصادي نظيف ومريح على مسافة 400 متر من الساحات، مفضل لحملات العمرة والمجموعات الباحثة عن توازن مثالي بين السعر والموقع.', '["400 متر مشياً للحرم", "غرف عائلية متعددة الأسرة", "مطعم بوفيه", "خدمة غسيل وكي"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e666c58c-45a7-4548-ae72-21e21d13c1d6', 'https://images.unsplash.com/photo-1591604129939-f1efa4d9f7fa?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e666c58c-45a7-4548-ae72-21e21d13c1d6', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'bcc0aba6-cb6d-4d65-b66f-5fe03a979713', 'e666c58c-45a7-4548-ae72-21e21d13c1d6', 'quad', 'غرفة رباعية ديلوكس', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'bcc0aba6-cb6d-4d65-b66f-5fe03a979713', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    760.0, 615.0, 200.0, 160.0
);


-- --------------------------------------------------------------------
-- فندق: فندق دار الإيمان إنتركونتيننتال المدينة (MED-HTL-0013)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'c620c077-d5c5-49d6-9c4b-40ee6e0f7592', 'MED-HTL-0013', 'فندق دار الإيمان إنتركونتيننتال المدينة', 'InterContinental Madinah-Dar Al Iman', 'madinah', 'المنطقة المركزية الشمالية', 'المنطقة المركزية الشمالية، قبالة ساحات الحرم النبوي الشريف',
    24.471, 39.611, 'https://www.google.com/maps/search/?api=1&query=24.471,39.611', 498, 'central_walking', TRUE,
    5, '+966 14 820 6666', '', 'https://images.unsplash.com/photo-1591604129939-f1efa4d9f7fa?auto=format&fit=crop&w=1200&q=80',
    'يقع مباشرة على ساحة الحرم النبوي الشمالية، ويعد من أرقى وجهات الإقامة لكبار الزوار وضيوف الرحمن.', '["ملاصق للساحات مباشرة", "مطعم الروضة الدولي", "خدمة ليموزين VIP", "مصلى داخلي"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('c620c077-d5c5-49d6-9c4b-40ee6e0f7592', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('c620c077-d5c5-49d6-9c4b-40ee6e0f7592', 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'b561c91b-9426-4cd2-9695-bdbb8140d0d3', 'c620c077-d5c5-49d6-9c4b-40ee6e0f7592', 'double', 'غرفة كينج إطلالة حرم نبوي', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'b561c91b-9426-4cd2-9695-bdbb8140d0d3', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1800.0, 1500.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '4a439d53-8715-43c7-a71a-8b8520282c87', 'c620c077-d5c5-49d6-9c4b-40ee6e0f7592', 'triple', 'غرفة ثلاثية إطلالة حرم', 3, TRUE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '4a439d53-8715-43c7-a71a-8b8520282c87', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    2150.0, 1780.0, 750.0, 620.0
);


-- --------------------------------------------------------------------
-- فندق: فندق دار الهجرة إنتركونتيننتال المدينة (MED-HTL-0014)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '04ab4957-721d-446d-a243-192c4393bfb1', 'MED-HTL-0014', 'فندق دار الهجرة إنتركونتيننتال المدينة', 'InterContinental Madinah-Dar Al Hijra', 'madinah', 'المنطقة المركزية الشمالية', 'المنطقة المركزية الشمالية، شارع الملك فهد، المدينة المنورة',
    24.47, 39.609, 'https://www.google.com/maps/search/?api=1&query=24.47,39.609', 428, 'central_walking', TRUE,
    5, '+966 14 820 7777', '', 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=1200&q=80',
    'يتميز بتصميم كلاسيكي رائع وضيافة 5 نجوم على بعد دقيقتين مشياً من الحرم النبوي الشريف.', '["دقيقتان مشياً للحرم", "مطعم الصفا الفاخر", "مواقف خاصة", "مركز أعمال"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('04ab4957-721d-446d-a243-192c4393bfb1', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('04ab4957-721d-446d-a243-192c4393bfb1', 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'f8f07691-4a46-4c09-88c5-85f51fc12497', '04ab4957-721d-446d-a243-192c4393bfb1', 'double', 'غرفة ديلوكس كينج', 2, FALSE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'f8f07691-4a46-4c09-88c5-85f51fc12497', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1250.0, 1040.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '132096ea-5d37-4bec-be25-450adb422553', '04ab4957-721d-446d-a243-192c4393bfb1', 'quad', 'غرفة رباعية فسيحة', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '132096ea-5d37-4bec-be25-450adb422553', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1650.0, 1360.0, 435.0, 358.0
);


-- --------------------------------------------------------------------
-- فندق: فندق ميلينيوم العقيق المدينة (MED-HTL-0015)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '2ee631fd-6a73-4b48-9f58-d64ac8719ef9', 'MED-HTL-0015', 'فندق ميلينيوم العقيق المدينة', 'Millennium Al Aqeeq Hotel', 'madinah', 'المنطقة المركزية الشمالية', 'المنطقة المركزية الشمالية، قبالة ساحات الحرم، المدينة المنورة',
    24.472, 39.6098, 'https://www.google.com/maps/search/?api=1&query=24.472,39.6098', 641, 'central_outer', TRUE,
    5, '+966 14 820 5555', '', 'https://images.unsplash.com/photo-1591604129939-f1efa4d9f7fa?auto=format&fit=crop&w=1200&q=80',
    'فندق 5 نجوم يقع في الصفوف الأمامية للمنطقة المركزية الشمالية، دقيقة واحدة تفصله عن الساحات ومصلى النساء.', '["دقيقة واحدة للساحات", "مطعم المدينة الدولي", "محلات هدايا وتسوّق", "خدمة كونسيرج"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2ee631fd-6a73-4b48-9f58-d64ac8719ef9', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('2ee631fd-6a73-4b48-9f58-d64ac8719ef9', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '31607a0b-d755-47aa-bcb7-05c6e3ee601f', '2ee631fd-6a73-4b48-9f58-d64ac8719ef9', 'double', 'غرفة ديلوكس إطلالة حرم', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '31607a0b-d755-47aa-bcb7-05c6e3ee601f', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1350.0, 1120.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '363a6059-012b-4036-ba9e-60dbd0a60cdb', '2ee631fd-6a73-4b48-9f58-d64ac8719ef9', 'quad', 'غرفة رباعية بريميوم', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '363a6059-012b-4036-ba9e-60dbd0a60cdb', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1750.0, 1440.0, 460.0, 380.0
);


-- --------------------------------------------------------------------
-- فندق: فندق المدينة هيلتون (MED-HTL-0016)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'f4bb6bf5-0709-4b4a-ae60-eb0fd4328ff2', 'MED-HTL-0016', 'فندق المدينة هيلتون', 'Madinah Hilton Hotel', 'madinah', 'المنطقة المركزية الشمالية', 'المنطقة المركزية، شارع الملك فهد، المدينة المنورة',
    24.4708, 39.6095, 'https://www.google.com/maps/search/?api=1&query=24.4708,39.6095', 498, 'central_walking', TRUE,
    5, '+966 14 820 1000', '', 'https://images.unsplash.com/photo-1591604129939-f1efa4d9f7fa?auto=format&fit=crop&w=1200&q=80',
    'أحد أشهر فنادق المدينة المنورة التابعة لهيلتون؛ خطوات معدودة من ساحة الحرم النبوي ومطاعم تقدم أشهى الأطباق العربية والعالمية.', '["خطوات قليلة للحرم", "مطعم المضايف", "صالة رجال الأعمال", "مواقف خاصة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f4bb6bf5-0709-4b4a-ae60-eb0fd4328ff2', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('f4bb6bf5-0709-4b4a-ae60-eb0fd4328ff2', 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '02745c36-bbbd-4dc3-800b-9404109dc470', 'f4bb6bf5-0709-4b4a-ae60-eb0fd4328ff2', 'double', 'غرفة كينج ديلوكس إطلالة حرم', 2, FALSE, 'haram_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '02745c36-bbbd-4dc3-800b-9404109dc470', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1400.0, 1180.0, NULL, NULL
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'ff79bb7f-0d6b-4cef-8212-690a4de2367e', 'f4bb6bf5-0709-4b4a-ae60-eb0fd4328ff2', 'quad', 'غرفة عائلية رباعية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'ff79bb7f-0d6b-4cef-8212-690a4de2367e', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    1800.0, 1480.0, 475.0, 390.0
);


-- --------------------------------------------------------------------
-- فندق: فندق روف المدينة (MED-HTL-0017)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '496aed21-472e-4fbd-a239-5a7ab260aa69', 'MED-HTL-0017', 'فندق روف المدينة', 'Rove Al Madinah Hotel', 'madinah', 'المنطقة المركزية الشمالية', 'المنطقة المركزية الشمالية، شارع الستين، المدينة المنورة',
    24.4724, 39.6112, 'https://www.google.com/maps/search/?api=1&query=24.4724,39.6112', 682, 'central_outer', TRUE,
    4, '+966 14 829 2222', '', 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=1200&q=80',
    'فندق متميز ذو تصميم شبابي وعصري يبعد 120 متراً فقط عن الحرم النبوي مع أسرة مريحة وبوفيه إفطار عالمي.', '["120 متراً عن الحرم", "تصميم عصري متطور", "بوفيه إفطار مفتوح", "واي فاي مجاني سريع"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('496aed21-472e-4fbd-a239-5a7ab260aa69', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('496aed21-472e-4fbd-a239-5a7ab260aa69', 'https://images.unsplash.com/photo-1592229505726-ca121723b8ef?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '1966067f-b73b-45f7-a4fb-0bf14a57b038', '496aed21-472e-4fbd-a239-5a7ab260aa69', 'quad', 'غرفة رباعية حديثة', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '1966067f-b73b-45f7-a4fb-0bf14a57b038', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    750.0, 610.0, 198.0, 160.0
);


INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '1b09f15d-d5da-4943-82eb-ce0555c4a6ff', '496aed21-472e-4fbd-a239-5a7ab260aa69', 'triple', 'غرفة ثلاثية مريحة', 3, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '1b09f15d-d5da-4943-82eb-ce0555c4a6ff', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    680.0, 550.0, 240.0, 195.0
);


-- --------------------------------------------------------------------
-- فندق: فندق إعمار رويال المدينة (MED-HTL-0018)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'b9063d6d-5c43-4611-8b1b-49d59d204066', 'MED-HTL-0018', 'فندق إعمار رويال المدينة', 'Emaar Royal Hotel Al Madina', 'madinah', 'المنطقة المركزية الشمالية', 'المنطقة المركزية الشمالية، المدينة المنورة',
    24.4722, 39.6108, 'https://www.google.com/maps/search/?api=1&query=24.4722,39.6108', 655, 'central_outer', TRUE,
    5, '+966 14 824 2361', '', 'https://images.unsplash.com/photo-1591088398332-8a7791972843?auto=format&fit=crop&w=1200&q=80',
    'فندق 5 نجوم يقع على بعد 160 متراً من الحرم النبوي الشريف، يوفر إطلالات على مقبرة أحد والحرم النبوي ومطاعم آسيوية وعربية.', '["160 متراً من الحرم", "مطاعم بدر وأحد", "خدمات رجال أعمال", "استقبال 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b9063d6d-5c43-4611-8b1b-49d59d204066', 'https://images.unsplash.com/photo-1592229505726-ca121723b8ef?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('b9063d6d-5c43-4611-8b1b-49d59d204066', 'https://images.unsplash.com/photo-1541971875076-8f970d573be6?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'c2c825ae-d6b3-4f8b-bf66-0d125d267f7b', 'b9063d6d-5c43-4611-8b1b-49d59d204066', 'quad', 'غرفة رباعية رويال', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'c2c825ae-d6b3-4f8b-bf66-0d125d267f7b', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    950.0, 780.0, 250.0, 205.0
);


-- --------------------------------------------------------------------
-- فندق: فندق جولدن توليب الذهبي المدينة (MED-HTL-0019)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '9eb7d8a2-5d98-4555-bb93-879c2c2e4f55', 'MED-HTL-0019', 'فندق جولدن توليب الذهبي المدينة', 'Golden Tulip Al Zahabi', 'madinah', 'المنطقة المركزية الشمالية', 'المنطقة المركزية الشمالية، المدينة المنورة',
    24.4728, 39.6115, 'https://www.google.com/maps/search/?api=1&query=24.4728,39.6115', 737, 'central_outer', TRUE,
    4, '+966 14 820 2200', '', 'https://images.unsplash.com/photo-1592229505726-ca121723b8ef?auto=format&fit=crop&w=1200&q=80',
    'يقع في المنطقة المركزية الشمالية على بعد 170 متراً من الحرم، ويحظى بشعبية واسعة بين معتمري دول الخليج والعالم الإسلامي.', '["170 متراً من الحرم", "مطعم المائدة الذهبية", "غرف عائلية ممتازة", "واي فاي سريع"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('9eb7d8a2-5d98-4555-bb93-879c2c2e4f55', 'https://images.unsplash.com/photo-1508253578933-20b529302151?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('9eb7d8a2-5d98-4555-bb93-879c2c2e4f55', 'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '43670452-21fc-4597-b817-8c44679ec5d3', '9eb7d8a2-5d98-4555-bb93-879c2c2e4f55', 'quad', 'غرفة رباعية كلاسيكية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '43670452-21fc-4597-b817-8c44679ec5d3', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    720.0, 590.0, 190.0, 155.0
);


-- --------------------------------------------------------------------
-- فندق: فندق بدر التوحيد المدينة (MED-HTL-0020)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '5151a6b4-9a87-4057-818e-a5236fa77dc4', 'MED-HTL-0020', 'فندق بدر التوحيد المدينة', 'Badr Al Tawheed Hotel', 'madinah', 'المنطقة المركزية الغربية', 'المنطقة المركزية الغربية، المدينة المنورة',
    24.4695, 39.6075, 'https://www.google.com/maps/search/?api=1&query=24.4695,39.6075', 501, 'central_outer', TRUE,
    4, '+966 14 821 3333', '', 'https://images.unsplash.com/photo-1541971875076-8f970d573be6?auto=format&fit=crop&w=1200&q=80',
    'يقع في المنطقة المركزية الغربية على مسافة 250 متراً من ساحات الحرم النبوي مع غرف مريحة وبوفيه إفطار غني.', '["250م مشياً للحرم", "بوفيه إفطار", "مصلى داخلي", "واي فاي سريع"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5151a6b4-9a87-4057-818e-a5236fa77dc4', 'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5151a6b4-9a87-4057-818e-a5236fa77dc4', 'https://images.unsplash.com/photo-1596701062351-8c2c14d1fdd0?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '87011ecc-1249-4e9c-86f7-0108a1a27f7e', '5151a6b4-9a87-4057-818e-a5236fa77dc4', 'quad', 'غرفة رباعية كلاسيكية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '87011ecc-1249-4e9c-86f7-0108a1a27f7e', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    680.0, 550.0, 180.0, 145.0
);


-- --------------------------------------------------------------------
-- فندق: فندق نواف المدينة (MED-HTL-0021)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '1002f431-dd2b-4fd3-a426-ca6efda2995b', 'MED-HTL-0021', 'فندق نواف المدينة', 'Nawaf Al Madinah Hotel', 'madinah', 'المنطقة المركزية الجنوبية', 'المنطقة المركزية الجنوبية، شارع قباء، المدينة المنورة',
    24.4645, 39.6105, 'https://www.google.com/maps/search/?api=1&query=24.4645,39.6105', 358, 'central_walking', TRUE,
    3, '+966 14 822 4444', '', 'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?auto=format&fit=crop&w=1200&q=80',
    'يبعد حوالي 300 متر مشياً عن ساحات الحرم النبوي الجنوبية ومقبرة البقيع، ويتميز بأسعار اقتصادية وجودة عالية.', '["300م مشياً للحرم والبقيع", "استقبال 24 ساعة", "واي فاي مجاني"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('1002f431-dd2b-4fd3-a426-ca6efda2995b', 'https://images.unsplash.com/photo-1598928506311-c55ded91a20c?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('1002f431-dd2b-4fd3-a426-ca6efda2995b', 'https://images.unsplash.com/photo-1591604129939-f1efa4d9f7fa?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '696444f1-8de2-4438-94fa-34a00a987fcf', '1002f431-dd2b-4fd3-a426-ca6efda2995b', 'quad', 'غرفة رباعية اقتصادية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '696444f1-8de2-4438-94fa-34a00a987fcf', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    480.0, 390.0, 130.0, 105.0
);


-- --------------------------------------------------------------------
-- فندق: فندق قدس بلازا المدينة (MED-HTL-0022)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'd5d364da-4343-4b48-9a1d-232020c63833', 'MED-HTL-0022', 'فندق قدس بلازا المدينة', 'Quds Plaza Hotel Madinah', 'madinah', 'المنطقة المركزية الغربية', 'المنطقة المركزية الغربية، شارع السلام، المدينة المنورة',
    24.4688, 39.6068, 'https://www.google.com/maps/search/?api=1&query=24.4688,39.6068', 528, 'central_outer', TRUE,
    3, '+966 14 823 5555', '', 'https://images.unsplash.com/photo-1598928506311-c55ded91a20c?auto=format&fit=crop&w=1200&q=80',
    'يقع على امتداد شارع السلام على بعد 280 متراً مشياً من ساحات المسجد النبوي الشريف.', '["280م مشياً لساحة السلام", "غرف عائلية", "واي فاي"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('d5d364da-4343-4b48-9a1d-232020c63833', 'https://images.unsplash.com/photo-1596701062351-8c2c14d1fdd0?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('d5d364da-4343-4b48-9a1d-232020c63833', 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '8cb39b91-3da5-4387-bca2-25afa0aedd3e', 'd5d364da-4343-4b48-9a1d-232020c63833', 'quad', 'غرفة رباعية كلاسيكية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '8cb39b91-3da5-4387-bca2-25afa0aedd3e', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    520.0, 420.0, 140.0, 112.0
);


-- --------------------------------------------------------------------
-- فندق: فندق وقود السلام المدينة (MED-HTL-0023)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '22a93998-0174-4f29-a31f-bf164a51483c', 'MED-HTL-0023', 'فندق وقود السلام المدينة', 'Waqood Al Salam Hotel', 'madinah', 'المنطقة المركزية الغربية', 'المركزية الغربية، المدينة المنورة',
    24.469, 39.608, 'https://www.google.com/maps/search/?api=1&query=24.469,39.608', 415, 'central_walking', TRUE,
    3, '+966 14 825 7777', '', 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=1200&q=80',
    'يبعد مسافة 220 متراً مشياً عن ساحات المسجد النبوي الشريف، ويوفر غرفاً نظيفة ومريحة بأسعار تنافسية للمعتمرين.', '["220م مشياً للحرم", "استقبال 24 ساعة", "واي فاي مجاني"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('22a93998-0174-4f29-a31f-bf164a51483c', 'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('22a93998-0174-4f29-a31f-bf164a51483c', 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '35efea8d-b9fb-4d5b-96c9-7782b64334c3', '22a93998-0174-4f29-a31f-bf164a51483c', 'quad', 'غرفة رباعية كلاسيكية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '35efea8d-b9fb-4d5b-96c9-7782b64334c3', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    540.0, 435.0, 145.0, 115.0
);


-- --------------------------------------------------------------------
-- فندق: فندق المنارة المدينة (MED-HTL-0024)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '1d594e61-3f6b-46e7-bf73-46e9cc4b79b0', 'MED-HTL-0024', 'فندق المنارة المدينة', 'Al Manara Hotel Madinah', 'madinah', 'المنطقة المركزية الغربية', 'المنطقة المركزية الغربية، المدينة المنورة',
    24.4682, 39.6072, 'https://www.google.com/maps/search/?api=1&query=24.4682,39.6072', 456, 'central_walking', TRUE,
    3, '+966 14 827 9999', '', 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=1200&q=80',
    'يقع في المنطقة المركزية الغربية على بعد 260 متراً مشياً من الحرم النبوي في موقع هادئ يسهل الدخول والخروج منه.', '["260م مشياً للحرم", "واي فاي", "خدمة غرف"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('1d594e61-3f6b-46e7-bf73-46e9cc4b79b0', 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('1d594e61-3f6b-46e7-bf73-46e9cc4b79b0', 'https://images.unsplash.com/photo-1591088398332-8a7791972843?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '57db5914-4446-4204-a393-57462b3601ee', '1d594e61-3f6b-46e7-bf73-46e9cc4b79b0', 'quad', 'غرفة رباعية قياسية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '57db5914-4446-4204-a393-57462b3601ee', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    490.0, 395.0, 132.0, 106.0
);


-- --------------------------------------------------------------------
-- فندق: فندق برج المودة المدينة (MED-HTL-0025)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '8f8eb91c-9490-47a1-9e69-8d1c4bc4bbdb', 'MED-HTL-0025', 'فندق برج المودة المدينة', 'Burj Al Mawaddah Hotel', 'madinah', 'المنطقة المركزية الجنوبية', 'المنطقة المركزية الجنوبية، المدينة المنورة',
    24.465, 39.611, 'https://www.google.com/maps/search/?api=1&query=24.465,39.611', 290, 'central_walking', TRUE,
    3, '+966 14 820 2570', '', 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=1200&q=80',
    'يبعد مسافة 240 متراً مشياً عن ساحات الحرم النبوي الجنوبية ومقبرة البقيع مع أسعار ممتازة للمجموعات.', '["240م مشياً للحرم والبقيع", "استقبال 24 ساعة", "واي فاي مجاني"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('8f8eb91c-9490-47a1-9e69-8d1c4bc4bbdb', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('8f8eb91c-9490-47a1-9e69-8d1c4bc4bbdb', 'https://images.unsplash.com/photo-1592229505726-ca121723b8ef?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'd5080dc3-ede4-4028-a44a-37525c4eee91', '8f8eb91c-9490-47a1-9e69-8d1c4bc4bbdb', 'quad', 'غرفة رباعية كلاسيكية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'd5080dc3-ede4-4028-a44a-37525c4eee91', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    470.0, 380.0, 128.0, 102.0
);


-- --------------------------------------------------------------------
-- فندق: فندق الفلاح المدينة (MED-HTL-0026)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '658dcf51-d0d4-4eb1-9e4c-67808cf6fe5b', 'MED-HTL-0026', 'فندق الفلاح المدينة', 'Al Falah Hotel Madinah', 'madinah', 'المنطقة المركزية الغربية', 'المركزية الغربية، المدينة المنورة',
    24.4678, 39.6065, 'https://www.google.com/maps/search/?api=1&query=24.4678,39.6065', 526, 'central_outer', TRUE,
    3, '+966 14 829 1122', '', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=1200&q=80',
    'يبعد مسافة 290 متراً عن ساحات المسجد النبوي الشريف في شارع هادئ مع وصول مباشر لشارع السلام.', '["290م مشياً للحرم", "واي فاي سريع", "استقبال 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('658dcf51-d0d4-4eb1-9e4c-67808cf6fe5b', 'https://images.unsplash.com/photo-1591088398332-8a7791972843?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('658dcf51-d0d4-4eb1-9e4c-67808cf6fe5b', 'https://images.unsplash.com/photo-1508253578933-20b529302151?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'c1a6371f-d47b-4e37-8a9c-55695fba3c3c', '658dcf51-d0d4-4eb1-9e4c-67808cf6fe5b', 'quad', 'غرفة رباعية اقتصادية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'c1a6371f-d47b-4e37-8a9c-55695fba3c3c', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    460.0, 370.0, 125.0, 100.0
);


-- --------------------------------------------------------------------
-- فندق: فندق الإيمان أحد المدينة (MED-HTL-0027)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '50c80de2-d92b-4915-8434-709b33065d19', 'MED-HTL-0027', 'فندق الإيمان أحد المدينة', 'Al Eiman Ohud Hotel', 'madinah', 'المنطقة المركزية الشمالية', 'المنطقة المركزية الشمالية، طريق الملك فهد، المدينة المنورة',
    24.4735, 39.611, 'https://www.google.com/maps/search/?api=1&query=24.4735,39.611', 825, 'central_outer', TRUE,
    3, '+966 14 820 6666', '', 'https://images.unsplash.com/photo-1591604129939-f1efa4d9f7fa?auto=format&fit=crop&w=1200&q=80',
    'يقع في المنطقة المركزية الشمالية على بعد 250 متراً من الحرم النبوي مع مطاعم قريبة وخدمات متكاملة.', '["250م مشياً للحرم", "استقبال 24 ساعة", "واي فاي مجاني"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('50c80de2-d92b-4915-8434-709b33065d19', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('50c80de2-d92b-4915-8434-709b33065d19', 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=800&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '4c14ace2-1e6f-43d1-a31c-ee92bce621da', '50c80de2-d92b-4915-8434-709b33065d19', 'quad', 'غرفة رباعية مريحة', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '4c14ace2-1e6f-43d1-a31c-ee92bce621da', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    510.0, 410.0, 138.0, 110.0
);


-- --------------------------------------------------------------------
-- فندق: فندق زوار العالمي المدينة (MED-HTL-0028)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'bb3e1b0e-42b6-42b8-b374-e8aabcf9f036', 'MED-HTL-0028', 'فندق زوار العالمي المدينة', 'Zowar International Hotel', 'madinah', 'المنطقة المركزية الشمالية', 'المنطقة المركزية الشمالية، المدينة المنورة',
    24.472, 39.6118, 'https://www.google.com/maps/search/?api=1&query=24.472,39.6118', 638, 'central_outer', TRUE,
    4, '+966 14 820 8555', '', 'https://images.unsplash.com/photo-1592229505726-ca121723b8ef?auto=format&fit=crop&w=1200&q=80',
    'فندق 4 نجوم معروف يبعد 180 متراً عن الحرم النبوي الشريف ويقدم غرفاً عائلية فسيحة وبوفيه إفطار متميز.', '["180م مشياً للحرم", "بوفيه إفطار", "مصلى داخلي", "استقبال 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('bb3e1b0e-42b6-42b8-b374-e8aabcf9f036', 'https://images.unsplash.com/photo-1508253578933-20b529302151?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('bb3e1b0e-42b6-42b8-b374-e8aabcf9f036', 'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'a882671a-b00e-49cf-b9ee-58508a3688be', 'bb3e1b0e-42b6-42b8-b374-e8aabcf9f036', 'quad', 'غرفة رباعية ديلوكس', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'a882671a-b00e-49cf-b9ee-58508a3688be', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'bed_breakfast',
    710.0, 575.0, 190.0, 152.0
);


-- --------------------------------------------------------------------
-- فندق: فندق مرجان المدينة (MED-HTL-0029)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    'e9970575-f7ed-485f-9d96-8f3a2ca4b411', 'MED-HTL-0029', 'فندق مرجان المدينة', 'Morjan Al Madinah Hotel', 'madinah', 'المنطقة المركزية الغربية', 'المنطقة المركزية الغربية، المدينة المنورة',
    24.4685, 39.6078, 'https://www.google.com/maps/search/?api=1&query=24.4685,39.6078', 403, 'central_walking', TRUE,
    3, '+966 14 829 3344', '', 'https://images.unsplash.com/photo-1508253578933-20b529302151?auto=format&fit=crop&w=1200&q=80',
    'يبعد 230 متراً مشياً عن ساحات المسجد النبوي الشريف في موقع هادئ مع استقبال دافئ وخدمة غرف سريعة.', '["230م مشياً للحرم", "واي فاي مجاني", "استقبال 24 ساعة"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e9970575-f7ed-485f-9d96-8f3a2ca4b411', 'https://images.unsplash.com/photo-1541971875076-8f970d573be6?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('e9970575-f7ed-485f-9d96-8f3a2ca4b411', 'https://images.unsplash.com/photo-1598928506311-c55ded91a20c?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    'd7525001-b4e8-4571-8395-be83b735d909', 'e9970575-f7ed-485f-9d96-8f3a2ca4b411', 'quad', 'غرفة رباعية كلاسيكية', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    'd7525001-b4e8-4571-8395-be83b735d909', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    490.0, 395.0, 132.0, 106.0
);


-- --------------------------------------------------------------------
-- فندق: فندق برهان المدينة (MED-HTL-0030)
-- --------------------------------------------------------------------
INSERT INTO hotels (
    id, hotel_code, name_ar, name_en, city, neighborhood_ar, address_ar,
    latitude, longitude, google_maps_url, distance_to_haram_m, zone_type, is_central,
    star_rating, contact_phone, contact_whatsapp, cover_image_url,
    description_ar, amenities, is_active
) VALUES (
    '5e9cfcb3-ef69-45a3-a472-1ce5d97023c1', 'MED-HTL-0030', 'فندق برهان المدينة', 'Burhan Al Madinah Hotel', 'madinah', 'المنطقة المركزية الجنوبية', 'المنطقة المركزية الجنوبية، المدينة المنورة',
    24.464, 39.6115, 'https://www.google.com/maps/search/?api=1&query=24.464,39.6115', 428, 'central_walking', TRUE,
    3, '+966 14 822 9900', '', 'https://images.unsplash.com/photo-1541971875076-8f970d573be6?auto=format&fit=crop&w=1200&q=80',
    'يقع في المركزية الجنوبية على مسافة 280 متراً مشياً من الحرم النبوي مع أسعار ممتازة للمعتمرين وحملات العمرة.', '["280م مشياً للحرم", "استقبال 24 ساعة", "واي فاي سريع"]'::jsonb, TRUE
) ON CONFLICT (hotel_code) DO UPDATE SET
    name_ar = EXCLUDED.name_ar,
    distance_to_haram_m = EXCLUDED.distance_to_haram_m,
    zone_type = EXCLUDED.zone_type,
    is_central = EXCLUDED.is_central,
    updated_at = NOW();

INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5e9cfcb3-ef69-45a3-a472-1ce5d97023c1', 'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 1);
INSERT INTO hotel_images (hotel_id, image_url, category, is_cover, display_order)
VALUES ('5e9cfcb3-ef69-45a3-a472-1ce5d97023c1', 'https://images.unsplash.com/photo-1596701062351-8c2c14d1fdd0?auto=format&fit=crop&w=1200&q=80', 'room', FALSE, 2);

INSERT INTO hotel_room_types (
    id, hotel_id, room_category, title_ar, bed_count, allow_bed_booking, room_view
) VALUES (
    '0eaa6047-64f6-4136-9b94-887ba2c17aaa', '5e9cfcb3-ef69-45a3-a472-1ce5d97023c1', 'quad', 'غرفة رباعية مريحة', 4, TRUE, 'city_view'
);

INSERT INTO room_rate_plans (
    room_type_id, start_date, end_date, season_tag, meal_plan,
    price_full_room_b2c, price_full_room_b2b, price_per_bed_b2c, price_per_bed_b2b
) VALUES (
    '0eaa6047-64f6-4136-9b94-887ba2c17aaa', CURRENT_DATE, CURRENT_DATE + INTERVAL '180 days', 'standard_season', 'room_only',
    480.0, 390.0, 130.0, 105.0
);


COMMIT;
