-- Add rating and review_count columns to products table if they don't exist
DO $$ 
BEGIN 
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema = 'public' AND table_name = 'products' AND column_name = 'rating') THEN 
        ALTER TABLE public.products ADD COLUMN rating numeric(2,1); 
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema = 'public' AND table_name = 'products' AND column_name = 'review_count') THEN 
        ALTER TABLE public.products ADD COLUMN review_count integer DEFAULT 0; 
    END IF;
END $$;

-- Update existing products with random dummy data
-- Ratings between 3.8 and 5.0
-- Review counts between 10 and 500
UPDATE public.products
SET 
  rating = (floor(random() * (50 - 38 + 1) + 38) / 10)::numeric(2,1),
  review_count = floor(random() * (500 - 10 + 1) + 10)::integer
WHERE rating IS NULL;
