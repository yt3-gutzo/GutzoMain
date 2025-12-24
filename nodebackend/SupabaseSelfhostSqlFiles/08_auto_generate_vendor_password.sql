-- Migration to auto-generate vendor passwords
-- Set default value for password column to a random UUID
-- This requires pgcrypto extension, which is usually enabled by default on Supabase/Postgres 13+
-- If not, enable it: CREATE EXTENSION IF NOT EXISTS "pgcrypto";

ALTER TABLE public.vendors 
ALTER COLUMN password SET DEFAULT SUBSTRING(gen_random_uuid()::text, 1, 8);

-- Optional: If you want to backfill existing NULL passwords (careful!)
-- UPDATE public.vendors SET password = gen_random_uuid()::text WHERE password IS NULL;
