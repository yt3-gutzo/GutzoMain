import express from 'express';
import { supabaseAdmin } from '../config/supabase.js';
import { asyncHandler, successResponse, ApiError } from '../middleware/errorHandler.js';
import { sendVendorLeadNotification, sendVendorAcknowledgment } from '../utils/emailService.js';

const router = express.Router();

// ============================================
// CREATE VENDOR LEAD
// POST /api/vendor-leads
// ============================================
router.post('/', asyncHandler(async (req, res) => {
  const { kitchen_name, contact_name, phone, email, city, food_type } = req.body;

  // Basic validation
  if (!kitchen_name || !contact_name || !phone || !city) {
    throw new ApiError(400, 'Missing required fields');
  }

  // Insert into DB
  const { data: lead, error } = await supabaseAdmin
    .from('vendor_leads')
    .insert({
      kitchen_name,
      contact_name,
      phone,
      email,
      city,
      food_type,
      status: 'new'
    })
    .select()
    .single();

  if (error) {
    console.error('DB Insert Error:', error);
    throw new ApiError(500, 'Failed to save vendor lead');
  }

  // Trigger Email Notification (Non-blocking)
  sendVendorLeadNotification(lead).catch(err => console.error('Email trigger failed', err));
  if (email) {
    sendVendorAcknowledgment(lead).catch(err => console.error('Ack Email trigger failed', err));
  }

  successResponse(res, lead, 'Thank you! We will contact you shortly.', 201);
}));

export default router;
