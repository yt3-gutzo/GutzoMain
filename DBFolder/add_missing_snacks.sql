-- ============================================================================
-- UPDATE: Add Missing Snack Assignments to Calendar
-- ============================================================================
-- This script adds snack template assignments to existing calendar entries
-- Vendor ID: 3109c7d3-95e0-4a7a-86dd-9783e778d50c
-- ============================================================================

BEGIN;

-- Update existing calendar entries to add snacks where missing
UPDATE meal_plan_calendar
SET 
  snack_template_id = (
    SELECT id FROM meal_templates 
    WHERE vendor_id = '3109c7d3-95e0-4a7a-86dd-9783e778d50c' 
    AND template_code = CASE 
      WHEN EXTRACT(DOW FROM menu_date) % 3 = 0 THEN 'GZ_13'  -- Mixed Nuts
      WHEN EXTRACT(DOW FROM menu_date) % 3 = 1 THEN 'GZ_14'  -- Protein Smoothie
      ELSE 'GZ_15'  -- Hummus & Veggies
    END
    LIMIT 1
  ),
  snack_template_code = CASE 
    WHEN EXTRACT(DOW FROM menu_date) % 3 = 0 THEN 'GZ_13'
    WHEN EXTRACT(DOW FROM menu_date) % 3 = 1 THEN 'GZ_14'
    ELSE 'GZ_15'
  END
WHERE meal_plan_id IN (
  SELECT id FROM meal_plans 
  WHERE vendor_id = '3109c7d3-95e0-4a7a-86dd-9783e778d50c'
)
AND snack_template_code IS NULL
AND is_available = true;  -- Only add snacks to open days

COMMIT;

-- Verify the update
SELECT 
  menu_date,
  breakfast_template_code,
  lunch_template_code,
  dinner_template_code,
  snack_template_code,
  is_available
FROM meal_plan_menu_view
WHERE vendor_id = '3109c7d3-95e0-4a7a-86dd-9783e778d50c'
  AND menu_date >= CURRENT_DATE
ORDER BY menu_date
LIMIT 14;
