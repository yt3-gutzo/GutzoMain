-- ============================================================================
-- ADD SINGLE ENTRY: January 25 with Lunch Only
-- ============================================================================
-- Vendor ID: 3109c7d3-95e0-4a7a-86dd-9783e778d50c
-- Date: 2026-01-25
-- Only lunch meal, no breakfast/dinner/snack
-- ============================================================================

BEGIN;

-- Get the meal plan ID for this vendor
DO $$
DECLARE
  v_meal_plan_id UUID;
BEGIN
  -- Get first meal plan for this vendor
  SELECT id INTO v_meal_plan_id 
  FROM meal_plans 
  WHERE vendor_id = '3109c7d3-95e0-4a7a-86dd-9783e778d50c' 
  LIMIT 1;

  IF v_meal_plan_id IS NULL THEN
    RAISE NOTICE 'No meal plan found for this vendor!';
  ELSE
    -- Insert ONLY lunch for Jan 25
    INSERT INTO meal_plan_calendar (
      meal_plan_id, 
      menu_date, 
      lunch_template_code,
      is_available
    )
    VALUES (
      v_meal_plan_id, 
      '2026-01-25',
      'GZ_7',  -- Fish Curry (you can change this to any GZ_X you want)
      true
    )
    ON CONFLICT (meal_plan_id, menu_date) 
    DO UPDATE SET
      lunch_template_code = 'GZ_7',
      breakfast_template_code = NULL,
      dinner_template_code = NULL,
      snack_template_code = NULL,
      breakfast_template_id = NULL,
      dinner_template_id = NULL,
      snack_template_id = NULL,
      lunch_template_id = (
        SELECT id FROM meal_templates 
        WHERE vendor_id = '3109c7d3-95e0-4a7a-86dd-9783e778d50c' 
        AND template_code = 'GZ_7'
      );

    RAISE NOTICE '✅ Added Jan 25 with ONLY lunch (GZ_7)';
  END IF;
END $$;

COMMIT;

-- Verify
SELECT 
  menu_date,
  breakfast_template_code,
  lunch_template_code,
  dinner_template_code,
  snack_template_code
FROM meal_plan_menu_view
WHERE vendor_id = '3109c7d3-95e0-4a7a-86dd-9783e778d50c'
  AND menu_date = '2026-01-25';
