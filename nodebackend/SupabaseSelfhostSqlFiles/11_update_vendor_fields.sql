-- Migration: Add missing fields to vendors table
-- Description: Adds company_reg_no, owner_aadhar_no, pan_card_no, bank_account_no, ifsc_code, and suggested fields.

-- 1. Add missing requested columns
ALTER TABLE public.vendors
ADD COLUMN IF NOT EXISTS company_reg_no text,
ADD COLUMN IF NOT EXISTS owner_aadhar_no text,
ADD COLUMN IF NOT EXISTS pan_card_no text,
ADD COLUMN IF NOT EXISTS bank_account_no text,
ADD COLUMN IF NOT EXISTS ifsc_code text;

-- 2. Add suggested useful columns
ALTER TABLE public.vendors
ADD COLUMN IF NOT EXISTS bank_name text,
ADD COLUMN IF NOT EXISTS account_holder_name text,
ADD COLUMN IF NOT EXISTS owner_name text,
ADD COLUMN IF NOT EXISTS company_type text CHECK (company_type IN ('Sole Proprietorship', 'Partnership', 'LLP', 'Pvt Ltd', 'OPC'));

-- 3. Add comments for clarity
COMMENT ON COLUMN public.vendors.company_reg_no IS 'Company Registration Number / CIN';
COMMENT ON COLUMN public.vendors.owner_aadhar_no IS 'Aadhar Number of the owner';
COMMENT ON COLUMN public.vendors.pan_card_no IS 'PAN Card Number';
COMMENT ON COLUMN public.vendors.bank_account_no IS 'Bank Account Number for payouts';
COMMENT ON COLUMN public.vendors.ifsc_code IS 'IFSC Code for the bank account';
COMMENT ON COLUMN public.vendors.bank_name IS 'Name of the Bank';
COMMENT ON COLUMN public.vendors.account_holder_name IS 'Name of the account holder as per bank records';
COMMENT ON COLUMN public.vendors.owner_name IS 'Full name of the business owner';
COMMENT ON COLUMN public.vendors.company_type IS 'Type of company registration';

-- Note: 
-- Existing fields mapped:
-- fssai -> fssai_license (Already exists)
-- gst -> gst_number (Already exists)
