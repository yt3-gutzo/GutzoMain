-- Migration script to populate public.categories with inspiration items
-- Base URL: https://storage.googleapis.com/gutzo/category/

INSERT INTO public.categories (name, image_url, sort_order, is_active)
VALUES
  ('Salads', 'https://storage.googleapis.com/gutzo/category/salads.png', 1, true),
  ('Smoothies', 'https://storage.googleapis.com/gutzo/category/smoothies.png', 2, true),
  ('Bowls', 'https://storage.googleapis.com/gutzo/category/bowls.png', 3, true),
  ('Protein', 'https://storage.googleapis.com/gutzo/category/protein.png', 4, true),
  ('Wraps', 'https://storage.googleapis.com/gutzo/category/wraps.png', 5, true),
  ('Juices', 'https://storage.googleapis.com/gutzo/category/juices.png', 6, true),
  ('Oats', 'https://storage.googleapis.com/gutzo/category/oats.png', 7, true),
  ('Breakfast', 'https://storage.googleapis.com/gutzo/category/breakfast.png', 8, true),
  ('Low-Cal', 'https://storage.googleapis.com/gutzo/category/lowcal.png', 9, true),
  ('Soups', 'https://storage.googleapis.com/gutzo/category/soups.png', 10, true),
  ('Snacks', 'https://storage.googleapis.com/gutzo/category/snacks.png', 11, true),
  ('Fruits', 'https://storage.googleapis.com/gutzo/category/fruits.png', 12, true),
  ('Detox', 'https://storage.googleapis.com/gutzo/category/detox.png', 13, true),
  ('Fit Meals', 'https://storage.googleapis.com/gutzo/category/fitmeals.png', 14, true),
  ('Keto', 'https://storage.googleapis.com/gutzo/category/keto.png', 15, true),
  ('Vegan', 'https://storage.googleapis.com/gutzo/category/vegan.png', 16, true),
  ('Specials', 'https://storage.googleapis.com/gutzo/category/specials.png', 17, true),
  ('Combos', 'https://storage.googleapis.com/gutzo/category/combos.png', 18, true)
ON CONFLICT DO NOTHING;
