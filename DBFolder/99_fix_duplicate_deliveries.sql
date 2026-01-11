-- 1. Cleaning up Duplicates
-- We keep the "best" row for each order_id (Prioritizing rows that have OTPs or External IDs)
DELETE FROM deliveries
WHERE id IN (
    SELECT id
    FROM (
        SELECT id,
               ROW_NUMBER() OVER (
                   PARTITION BY order_id 
                   ORDER BY 
                       CASE WHEN pickup_otp IS NOT NULL THEN 1 ELSE 2 END ASC,     -- Keep rows with OTP first
                       CASE WHEN external_order_id IS NOT NULL THEN 1 ELSE 2 END ASC, -- Keep rows with External ID first
                       created_at DESC -- If equal, keep latest
               ) as rnum
        FROM deliveries
    ) t
    WHERE t.rnum > 1
);

-- 2. Add UNIQUE constraint to prevent future duplicates
ALTER TABLE deliveries ADD CONSTRAINT deliveries_order_id_key UNIQUE (order_id);
