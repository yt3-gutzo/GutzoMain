-- 1. Add is_blacklisted column if it doesn't exist (default false initially)
ALTER TABLE public.vendors
ADD COLUMN IF NOT EXISTS is_blacklisted boolean DEFAULT false;

-- 2. Security: Blacklist ALL vendors by default
UPDATE public.vendors
SET is_blacklisted = true;

-- 3. Whitelist: Un-blacklist vendors containing 'bangalore' in their name
UPDATE public.vendors
SET is_blacklisted = false
WHERE name ILIKE '%bangalore%';
