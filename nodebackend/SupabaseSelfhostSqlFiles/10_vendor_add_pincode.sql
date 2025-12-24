-- Add pincode column to vendors table
ALTER TABLE public.vendors
ADD COLUMN pincode text;

COMMENT ON COLUMN public.vendors.pincode IS 'Postal code of the vendor location';
