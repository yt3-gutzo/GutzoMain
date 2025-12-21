-- Enable RLS
ALTER TABLE public.categories ENABLE ROW LEVEL SECURITY;

-- Policy (drop if exists to avoid error, then create)
DROP POLICY IF EXISTS "Enable read access for all users" ON public.categories;
CREATE POLICY "Enable read access for all users" ON public.categories
    FOR SELECT
    USING (true);

-- Robust Insert: Check for existence by name before inserting
INSERT INTO public.categories (name, image_url, sort_order, is_active)
SELECT 'Salads', 'https://storage.googleapis.com/gutzo/category/salads.png', 1, true
WHERE NOT EXISTS (SELECT 1 FROM public.categories WHERE name = 'Salads');

INSERT INTO public.categories (name, image_url, sort_order, is_active)
SELECT 'Smoothies', 'https://storage.googleapis.com/gutzo/category/smoothies.png', 2, true
WHERE NOT EXISTS (SELECT 1 FROM public.categories WHERE name = 'Smoothies');

INSERT INTO public.categories (name, image_url, sort_order, is_active)
SELECT 'Bowls', 'https://storage.googleapis.com/gutzo/category/bowls.png', 3, true
WHERE NOT EXISTS (SELECT 1 FROM public.categories WHERE name = 'Bowls');

INSERT INTO public.categories (name, image_url, sort_order, is_active)
SELECT 'Protein', 'https://storage.googleapis.com/gutzo/category/protein.png', 4, true
WHERE NOT EXISTS (SELECT 1 FROM public.categories WHERE name = 'Protein');

INSERT INTO public.categories (name, image_url, sort_order, is_active)
SELECT 'Wraps', 'https://storage.googleapis.com/gutzo/category/wraps.png', 5, true
WHERE NOT EXISTS (SELECT 1 FROM public.categories WHERE name = 'Wraps');

INSERT INTO public.categories (name, image_url, sort_order, is_active)
SELECT 'Juices', 'https://storage.googleapis.com/gutzo/category/juices.png', 6, true
WHERE NOT EXISTS (SELECT 1 FROM public.categories WHERE name = 'Juices');

INSERT INTO public.categories (name, image_url, sort_order, is_active)
SELECT 'Oats', 'https://storage.googleapis.com/gutzo/category/oats.png', 7, true
WHERE NOT EXISTS (SELECT 1 FROM public.categories WHERE name = 'Oats');

INSERT INTO public.categories (name, image_url, sort_order, is_active)
SELECT 'Breakfast', 'https://storage.googleapis.com/gutzo/category/breakfast.png', 8, true
WHERE NOT EXISTS (SELECT 1 FROM public.categories WHERE name = 'Breakfast');

INSERT INTO public.categories (name, image_url, sort_order, is_active)
SELECT 'Low-Cal', 'https://storage.googleapis.com/gutzo/category/lowcal.png', 9, true
WHERE NOT EXISTS (SELECT 1 FROM public.categories WHERE name = 'Low-Cal');

INSERT INTO public.categories (name, image_url, sort_order, is_active)
SELECT 'Soups', 'https://storage.googleapis.com/gutzo/category/soups.png', 10, true
WHERE NOT EXISTS (SELECT 1 FROM public.categories WHERE name = 'Soups');

INSERT INTO public.categories (name, image_url, sort_order, is_active)
SELECT 'Snacks', 'https://storage.googleapis.com/gutzo/category/snacks.png', 11, true
WHERE NOT EXISTS (SELECT 1 FROM public.categories WHERE name = 'Snacks');

INSERT INTO public.categories (name, image_url, sort_order, is_active)
SELECT 'Fruits', 'https://storage.googleapis.com/gutzo/category/fruits.png', 12, true
WHERE NOT EXISTS (SELECT 1 FROM public.categories WHERE name = 'Fruits');

INSERT INTO public.categories (name, image_url, sort_order, is_active)
SELECT 'Detox', 'https://storage.googleapis.com/gutzo/category/detox.png', 13, true
WHERE NOT EXISTS (SELECT 1 FROM public.categories WHERE name = 'Detox');

INSERT INTO public.categories (name, image_url, sort_order, is_active)
SELECT 'Fit Meals', 'https://storage.googleapis.com/gutzo/category/fitmeals.png', 14, true
WHERE NOT EXISTS (SELECT 1 FROM public.categories WHERE name = 'Fit Meals');

INSERT INTO public.categories (name, image_url, sort_order, is_active)
SELECT 'Keto', 'https://storage.googleapis.com/gutzo/category/keto.png', 15, true
WHERE NOT EXISTS (SELECT 1 FROM public.categories WHERE name = 'Keto');

INSERT INTO public.categories (name, image_url, sort_order, is_active)
SELECT 'Vegan', 'https://storage.googleapis.com/gutzo/category/vegan.png', 16, true
WHERE NOT EXISTS (SELECT 1 FROM public.categories WHERE name = 'Vegan');

INSERT INTO public.categories (name, image_url, sort_order, is_active)
SELECT 'Specials', 'https://storage.googleapis.com/gutzo/category/specials.png', 17, true
WHERE NOT EXISTS (SELECT 1 FROM public.categories WHERE name = 'Specials');

INSERT INTO public.categories (name, image_url, sort_order, is_active)
SELECT 'Combos', 'https://storage.googleapis.com/gutzo/category/combos.png', 18, true
WHERE NOT EXISTS (SELECT 1 FROM public.categories WHERE name = 'Combos');
