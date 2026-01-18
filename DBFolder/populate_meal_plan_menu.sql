-- ============================================================================
-- POPULATE MEAL PLAN DAY MENU
-- ============================================================================
-- This populates the weekly menu for the meal plan you created
-- Run this AFTER creating the meal plan in meal_plans table
-- ============================================================================

-- Insert weekly menu for the meal plan (Mon-Sat, Sunday is rest day)
-- Replace meal_plan_id with your actual meal plan ID from the meal_plans table

INSERT INTO public.meal_plan_day_menu (
    id,
    meal_plan_id,
    day_of_week,
    day_name,
    breakfast_item,
    lunch_item,
    dinner_item,
    snack_item,
    total_calories,
    created_at
) VALUES 
-- Monday
(
    gen_random_uuid(),
    (SELECT id FROM meal_plans ORDER BY created_at DESC LIMIT 1),
    1,
    'Monday',
    'Protein Pancakes with Greek Yogurt',
    'Grilled Chicken Breast with Quinoa & Veggies',
    'Salmon with Sweet Potato & Broccoli',
    NULL,
    2000,
    now()
),
-- Tuesday
(
    gen_random_uuid(),
    (SELECT id FROM meal_plans ORDER BY created_at DESC LIMIT 1),
    2,
    'Tuesday',
    'Egg White Omelette with Spinach & Mushrooms',
    'Turkey Meatballs with Brown Rice',
    'Grilled Fish with Asparagus & Cauliflower Rice',
    NULL,
    1950,
    now()
),
-- Wednesday
(
    gen_random_uuid(),
    (SELECT id FROM meal_plans ORDER BY created_at DESC LIMIT 1),
    3,
    'Wednesday',
    'Overnight Oats with Berries & Almonds',
    'Lean Beef Stir-fry with Mixed Vegetables',
    'Chicken Tikka with Cucumber Salad',
    NULL,
    2050,
    now()
),
-- Thursday
(
    gen_random_uuid(),
    (SELECT id FROM meal_plans ORDER BY created_at DESC LIMIT 1),
    4,
    'Thursday',
    'Smoothie Bowl with Protein Powder & Chia Seeds',
    'Grilled Prawns with Zucchini Noodles',
    'Lamb Chops with Roasted Brussels Sprouts',
    NULL,
    2100,
    now()
),
-- Friday
(
    gen_random_uuid(),
    (SELECT id FROM meal_plans ORDER BY created_at DESC LIMIT 1),
    5,
    'Friday',
    'Scrambled Eggs with Avocado Toast',
    'Chicken Caesar Salad (Low Carb)',
    'Grilled Steak with Green Beans & Mushrooms',
    NULL,
    2020,
    now()
),
-- Saturday
(
    gen_random_uuid(),
    (SELECT id FROM meal_plans ORDER BY created_at DESC LIMIT 1),
    6,
    'Saturday',
    'Greek Yogurt Parfait with Granola',
    'Fish Tacos with Cabbage Slaw',
    'BBQ Chicken with Roasted Vegetables',
    NULL,
    1980,
    now()
);

-- Sunday (day 0) is automatically a rest day - no entry needed
-- The UI will show "Sunday is a rest day 😴" automatically

-- ============================================================================
-- VERIFICATION QUERY
-- ============================================================================
-- Run this to see the weekly menu you just created:

-- SELECT 
--     mp.title as meal_plan_name,
--     dm.day_name,
--     dm.breakfast_item,
--     dm.lunch_item,
--     dm.dinner_item,
--     dm.total_calories
-- FROM meal_plan_day_menu dm
-- JOIN meal_plans mp ON dm.meal_plan_id = mp.id
-- ORDER BY dm.day_of_week;
