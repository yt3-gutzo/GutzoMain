-- Update script for 'Pitchammal''s Kitchen'
-- Usage: Contains dummy data. Replace with actual values if needed.

UPDATE public.vendors
SET 
    company_reg_no = 'U12345TN2024PTC123456',
    owner_aadhar_no = '1234 5678 9012',
    pan_card_no = 'ABCDE1234F',
    bank_account_no = '123456789012',
    ifsc_code = 'HDFC0001234',
    -- Suggested fields
    bank_name = 'HDFC Bank',
    account_holder_name = 'Pitchammal S',
    owner_name = 'Pitchammal',
    owner_name = 'Pitchammal',
    company_type = 'Sole Proprietorship',
    gst_number = '33ABCDE1234F1Z5',
    fssai_license = '12345678901234'
WHERE name ILIKE '%Pitchammal%';

-- Verify the update
-- SELECT * FROM public.vendors WHERE name ILIKE '%Pitchammal%';
