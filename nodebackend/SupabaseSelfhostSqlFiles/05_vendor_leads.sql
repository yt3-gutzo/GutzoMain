-- Create vendor_leads table
CREATE TABLE IF NOT EXISTS vendor_leads (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    kitchen_name TEXT NOT NULL,
    contact_name TEXT NOT NULL,
    phone TEXT NOT NULL,
    email TEXT,
    city TEXT NOT NULL,
    food_type TEXT,
    remarks TEXT,
    status TEXT CHECK (status IN ('open', 'in-progress', 'approved', 'rejected')) DEFAULT 'open',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Add comments for documentation
COMMENT ON TABLE vendor_leads IS 'Stores potential vendor interest leads';
COMMENT ON COLUMN vendor_leads.status IS 'Current status of the lead in the onboarding pipeline';
