
-- Seed data for products table
-- Links products to vendors by looking up the vendor name
-- Uses WHERE NOT EXISTS to avoid duplicates

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
    -- Zero cals
    (
        'Zero cals',
        'Grilled Chicken Salad',
        'High protein grilled chicken with fresh veggies',
        220,
        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=400&q=80',
        'Salads',
        ARRAY['High Protein', 'Low Carb'],
        true,
        false,
        20
    ),
    (
        'Zero cals',
        'Quinoa Bowl',
        'Healthy quinoa with avocado and beans',
        180,
        'https://images.unsplash.com/photo-1505576391880-b3f9d713dc4f?auto=format&fit=crop&w=400&q=80',
        'Bowls',
        ARRAY['Vegan', 'Gluten Free'],
        true,
        true,
        15
    ),

    -- The fruit bowl co
    (
        'The fruit bowl co',
        'Tropical Paradise',
        'Mango, pineapple, and papaya mix',
        150,
        'https://images.unsplash.com/photo-1490474418585-ba9bad8fd0ea?auto=format&fit=crop&w=400&q=80',
        'Fruit Bowl',
        ARRAY['Fresh', 'Tropical', 'Vegan'],
        true,
        true,
        10
    ),
    (
        'The fruit bowl co',
        'Berry Blast',
        'Mixed berries with yogurt topping',
        170,
        'https://images.unsplash.com/photo-1438927958189-9b634358897c?auto=format&fit=crop&w=400&q=80',
        'Fruit Bowl',
        ARRAY['Antioxidant', 'Fresh'],
        true,
        true,
        10
    ),

    -- The buddha bowl
    (
        'The buddha bowl',
        'Zen Bowl',
        'Brown rice, tofu, and steamed veggies',
        200,
        'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=400&q=80',
        'Buddha Bowl',
        ARRAY['Vegan', 'Balanced'],
        true,
        true,
        25
    ),

    -- Daily grubs
    (
        'Daily grubs',
        'Millet Dosa Trio',
        'Healthy millet dosas with mint chutney',
        120,
        'https://images.unsplash.com/photo-1589301760014-d92964560951?auto=format&fit=crop&w=400&q=80',
        'South Indian Diet',
        ARRAY['Healthy', 'Breakfast'],
        true,
        true,
        15
    ),
    (
        'Daily grubs',
        'Ragi Idli Set',
        'Iron-rich finger millet idlis',
        90,
        'https://images.unsplash.com/photo-1589301760014-d92964560951?auto=format&fit=crop&w=400&q=80',
        'South Indian Diet',
        ARRAY['Healthy', 'Steam Cooked'],
        true,
        true,
        12
    ),

    -- Mealzy
    (
        'Mealzy',
        'Keto Beef Burger',
        'Lettuce wrap burger with cheese',
        250,
        'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=400&q=80',
        'Low Carb',
        ARRAY['Keto', 'High Protein'],
        true,
        false,
        25
    ),

    -- Incredibowl Coimbatore
    (
        'Incredibowl Coimbatore',
        'Burrito Bowl',
        'Mexican style rice and beans bowl',
        210,
        'https://images.unsplash.com/photo-1543339308-43e59d6b73a6?auto=format&fit=crop&w=400&q=80',
        'Bowl Meals',
        ARRAY['Spicy', 'Filling'],
        true,
        false,
        20
    ),

    -- Padayal NO OIL NO BOIL
    (
        'Padayal NO OIL NO BOIL Restaurant',
        'Raw Veggie Platter',
        'Assorted raw vegetables with dip',
        140,
        'https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=400&q=80',
        'South Indian Diet',
        ARRAY['Raw', 'Vegan', 'No Oil'],
        true,
        true,
        10
    ),

    -- FooDelights
    (
        'FooDelights',
        'Steamed Fish',
        'Lemon garlic steamed fish fillet',
        280,
        'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?auto=format&fit=crop&w=400&q=80',
        'Balanced Diet',
        ARRAY['Lean Protein', 'Low Calorie'],
        true,
        false,
        25
    ),

    -- food darzee
    (
        'food darzee',
        'Chicken Breast Meal',
        'Grilled chicken breast with sauteed veggies',
        230,
        'https://images.unsplash.com/photo-1532550907401-a500c9a57435?auto=format&fit=crop&w=400&q=80',
        'High Protein',
        ARRAY['High Protein', 'Keto'],
        true,
        false,
        20
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
