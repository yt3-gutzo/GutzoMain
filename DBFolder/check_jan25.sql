-- Check if Jan 25 entry exists in database
SELECT 
  id,
  meal_plan_id,
  menu_date,
  breakfast_template_code,
  lunch_template_code,
  dinner_template_code,
  snack_template_code,
  is_available
FROM meal_plan_calendar
WHERE menu_date = '2026-01-25'
  AND meal_plan_id IN (
    SELECT id FROM meal_plans 
    WHERE vendor_id = '3109c7d3-95e0-4a7a-86dd-9783e778d50c'
  );
  
-- Also check the view
SELECT *
FROM meal_plan_menu_view
WHERE menu_date = '2026-01-25'
  AND vendor_id = '3109c7d3-95e0-4a7a-86dd-9783e778d50c';
