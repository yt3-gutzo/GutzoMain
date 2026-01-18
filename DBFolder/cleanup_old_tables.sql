-- ============================================================================
-- CLEANUP: Remove Old Week-Based Meal Plan Tables
-- ============================================================================
-- This script removes the backup table that's no longer needed
-- Current DB has the new item-level template system working
-- ============================================================================

BEGIN;

-- ============================================================================
-- TABLES TO REMOVE
-- ============================================================================

-- ❌ meal_plan_day_menu_backup
-- This is a backup of the OLD week-based system (day_of_week: 0-6)
-- We migrated to the new item-level template system
-- This backup table is no longer needed

DROP TABLE IF EXISTS public.meal_plan_day_menu_backup CASCADE;

-- ============================================================================
-- WHAT TO KEEP (DO NOT REMOVE)
-- ============================================================================

-- ✅ meal_templates
-- New table for individual food items (GZ_1, GZ_2, etc.)

-- ✅ meal_plan_calendar
-- New table for date assignments (breakfast/lunch/dinner/snack slots)

-- ✅ meal_plans
-- Core meal plans table (still needed)

-- ✅ meal_plan_subscriptions
-- User subscriptions (still needed)

-- ✅ meal_plan_menu_view
-- View that joins calendar with templates

-- ✅ assign_template_to_meal function
-- Helper function for assigning templates

COMMIT;

-- ============================================================================
-- SUCCESS MESSAGE
-- ============================================================================

DO $$
BEGIN
    RAISE NOTICE '✅ Cleanup complete!';
    RAISE NOTICE 'Removed: meal_plan_day_menu_backup (old backup table)';
    RAISE NOTICE '';
    RAISE NOTICE 'Active Tables:';
    RAISE NOTICE '  ✅ meal_templates (GZ_X items)';
    RAISE NOTICE '  ✅ meal_plan_calendar (date assignments)';
    RAISE NOTICE '  ✅ meal_plans (main plans)';
    RAISE NOTICE '  ✅ meal_plan_subscriptions (user subs)';
END $$;
