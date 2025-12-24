-- Migration to update vendor_leads table schema
-- 1. Add remarks column
ALTER TABLE vendor_leads ADD COLUMN IF NOT EXISTS remarks TEXT;

-- 2. Update status check constraint
-- First drop existing constraint if possible (name might vary but Supabase usually names it table_column_check)
ALTER TABLE vendor_leads DROP CONSTRAINT IF EXISTS vendor_leads_status_check;

-- Add new constraint
ALTER TABLE vendor_leads ADD CONSTRAINT vendor_leads_status_check 
    CHECK (status IN ('open', 'in-progress', 'approved', 'rejected'));

-- 3. Set new default
ALTER TABLE vendor_leads ALTER COLUMN status SET DEFAULT 'open';

-- 4. Update existing rows (optional, but good for consistency)
-- Map old statuses to new ones if necessary. 
-- 'new' -> 'open'
-- 'contacted' -> 'in-progress'
UPDATE vendor_leads SET status = 'open' WHERE status = 'new';
UPDATE vendor_leads SET status = 'in-progress' WHERE status = 'contacted';
-- Others might strictly fail the check if not updated, but we dropped the check first.
-- Wait, if we have data with 'kyc_requested' and we apply the check, it will fail if we don't update them.
-- So we should migrate data BEFORE adding the constraint.

-- Let's reorder:
-- A. Add column
-- B. Drop constraint
-- C. Migrate data
-- D. Add new constraint
-- E. Set default

-- REVISED ORDER:

ALTER TABLE vendor_leads ADD COLUMN IF NOT EXISTS remarks TEXT;

ALTER TABLE vendor_leads DROP CONSTRAINT IF EXISTS vendor_leads_status_check;

UPDATE vendor_leads SET status = 'open' WHERE status = 'new';
UPDATE vendor_leads SET status = 'in-progress' WHERE status IN ('contacted', 'kyc_requested', 'kyc_verified');
UPDATE vendor_leads SET status = 'approved' WHERE status = 'active_managed';
-- 'rejected' stays 'rejected'

ALTER TABLE vendor_leads ADD CONSTRAINT vendor_leads_status_check 
    CHECK (status IN ('open', 'in-progress', 'approved', 'rejected'));

ALTER TABLE vendor_leads ALTER COLUMN status SET DEFAULT 'open';
