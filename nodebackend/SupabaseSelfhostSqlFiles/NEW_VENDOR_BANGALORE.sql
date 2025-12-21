-- New Vendor Entry for Bangalore
-- Vendor: Spice of Bangalore
-- Location: Indiranagar, Bangalore

-- 1. Insert Vendor
WITH new_vendor_data (
    name, description, location, rating, image, 
    delivery_time, minimum_order, delivery_fee, cuisine_type, 
    phone, is_active, is_featured, tags, is_open,
    latitude, longitude
) AS (
  VALUES 
    (
        'Spice of Bangalore',
        'Authentic Bangalore style home meals',
        'Indiranagar',
        4.6,
        'https://images.unsplash.com/photo-1589301760014-d92964560951?auto=format&fit=crop&w=400&q=80',
        '30-40 mins',
        200,
        25,
        'South Indian',
        '+919876543210',
        true,
        true,
        ARRAY['South Indian', 'Bangalore Special', 'Home Style'],
        true,
        12.9716, -- Latitude for Indiranagar
        77.6412  -- Longitude for Indiranagar
    )
)
INSERT INTO public.vendors (
    name, description, address, rating, image, 
    delivery_time, minimum_order, delivery_fee, cuisine_type, 
    phone, is_active, is_featured, tags, is_open,
    latitude, longitude
)
SELECT 
    nv.name, nv.description, nv.location, nv.rating, nv.image, 
    nv.delivery_time, nv.minimum_order, nv.delivery_fee, nv.cuisine_type, 
    nv.phone, nv.is_active, nv.is_featured, nv.tags, nv.is_open,
    nv.latitude, nv.longitude
FROM new_vendor_data nv
WHERE NOT EXISTS (
    SELECT 1 FROM public.vendors v WHERE v.name = nv.name
);

-- 2. Insert Products (Instant Picks)
WITH new_products (
    vendor_name,
    product_name,
    description,
    price,
    image_url,
    category,
    tags,
    is_available,
    is_veg,
    preparation_time
) AS (
  VALUES 
    (
        'Spice of Bangalore',
        'Bisi Bele Bath',
        'Spicy rice dish made of lentils, rice, mixed vegetables and aromatic spice powder',
        180,
        'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=400&q=80',
        'Rice Bowls',
        ARRAY['Spicy', 'Lunch'],
        true,
        true,
        25
    ),
    (
        'Spice of Bangalore',
        'Benne Dosa',
        'Crispy butter dosa served with chutney and sambar',
        140,
        'https://images.unsplash.com/photo-1626074353765-517a681e40be?auto=format&fit=crop&w=400&q=80',
        'Breakfast',
        ARRAY['Breakfast', 'Popular'],
        true,
        true,
        15
    )
)
INSERT INTO public.products (
    vendor_id,
    name,
    description,
    price,
    image_url,
    category,
    tags,
    is_available,
    type,
    preparation_time,
    created_at,
    updated_at
)
SELECT 
    v.id,
    np.product_name,
    np.description,
    np.price,
    np.image_url,
    np.category,
    np.tags,
    np.is_available,
    CASE WHEN np.is_veg THEN 'veg' ELSE 'non-veg' END,
    np.preparation_time,
    NOW(),
    NOW()
FROM new_products np
JOIN public.vendors v ON v.name = np.vendor_name
WHERE NOT EXISTS (
    SELECT 1 
    FROM public.products p 
    WHERE p.name = np.product_name 
    AND p.vendor_id = v.id
);

-- 3. Insert Meal Plan
WITH new_meal_plan (
    vendor_name, title, description, price_display, thumbnail, features, dietary_type, plan_type, schedule, price_lunch
) AS (
    VALUES (
        'Spice of Bangalore',
        'Karnataka Home Meals',
        'Authentic homemade meals delivered to your doorstep',
        '₹150/meal',
        'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?auto=format&fit=crop&w=400&q=80',
        ARRAY['Home Cooked', 'No Preservatives', 'Daily Menu Change'],
        'veg',
        'balanced',
        'Mon-Sat',
        150
    )
)
INSERT INTO public.meal_plans (
    vendor_id, 
    title, 
    description, 
    price_display, 
    thumbnail, 
    features, 
    dietary_type, 
    plan_type, 
    schedule,
    vendor_name,
    price_lunch,
    trust_text,
    created_at, 
    updated_at
)
SELECT
    v.id, 
    np.title, 
    np.description, 
    np.price_display, 
    np.thumbnail, 
    np.features, 
    np.dietary_type, 
    np.plan_type::text,
    np.schedule,
    np.vendor_name,
    np.price_lunch,
    '98%', 
    NOW(), 
    NOW()
FROM new_meal_plan np
JOIN public.vendors v ON v.name = np.vendor_name
WHERE NOT EXISTS (
    SELECT 1 FROM public.meal_plans mp WHERE mp.title = np.title AND mp.vendor_id = v.id
);
