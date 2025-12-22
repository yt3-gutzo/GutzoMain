import nodemailer from 'nodemailer';
import dotenv from 'dotenv';

dotenv.config();

// Create reusable transporter object using the default SMTP transport
const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: process.env.EMAIL_USER,
    pass: process.env.EMAIL_PASS
  }
});

/**
 * Send notification email to Gutzo Ops about a new vendor lead
 * @param {Object} leadData - The vendor lead data
 * @returns {Promise<void>}
 */
export const sendVendorLeadNotification = async (leadData) => {
  const { kitchen_name, contact_name, phone, email, city, food_type } = leadData;

  const mailOptions = {
    from: process.env.EMAIL_USER,
    to: process.env.OPS_EMAIL || process.env.EMAIL_USER, // Default to sender if OPS_EMAIL not set
    subject: `🚨 New Vendor Interest: ${kitchen_name}`,
    html: `
      <h2>New Vendor Lead Received</h2>
      <p><strong>Kitchen Name:</strong> ${kitchen_name}</p>
      <p><strong>Contact Person:</strong> ${contact_name}</p>
      <p><strong>Phone:</strong> <a href="tel:${phone}">${phone}</a></p>
      <p><strong>Email:</strong> <a href="mailto:${email}">${email}</a></p>
      <p><strong>City:</strong> ${city}</p>
      <p><strong>Food Type:</strong> ${food_type}</p>
      <hr />
      <p>Please review this lead in the database and contact them shortly.</p>
    `
  };

  try {
    const info = await transporter.sendMail(mailOptions);
    console.log('📧 Lead notification email sent:', info.messageId);
  } catch (error) {
    console.error('❌ Error sending lead notification email:', error);
    // Don't throw, so we don't block the API response if email fails (it's secondary to DB save)
  }
};

/**
 * Send acknowledgment email to the vendor
 * @param {Object} leadData - The vendor lead data
 * @returns {Promise<void>}
 */
export const sendVendorAcknowledgment = async (leadData) => {
  const { kitchen_name, contact_name, phone, email, city } = leadData;

  const mailOptions = {
    from: process.env.EMAIL_USER,
    to: email,
    subject: "Thank you for your interest in partnering with Gutzo",
    html: `
      <h2>We received your request!</h2>
      <p>Hi ${contact_name},</p>
      <p>Thank you for expressing interest in becoming a specialized kitchen partner with Gutzo.</p>
      <p>Our team will review your details and get back to you shortly.</p>
      <br>
      <p><strong>Your Details:</strong></p>
      <ul>
        <li><strong>Kitchen Name:</strong> ${kitchen_name}</li>
        <li><strong>Phone:</strong> ${phone}</li>
        <li><strong>City:</strong> ${city}</li>
      </ul>
      <br>
      <p>Best regards,</p>
      <p><strong>The Gutzo Team</strong></p>
    `,
  };

  try {
    const info = await transporter.sendMail(mailOptions);
    console.log("📧 Vendor acknowledgment email sent:", info.messageId);
  } catch (error) {
    console.error("❌ Error sending vendor acknowledgment email:", error);
    // Don't throw here to avoid failing the whole request if just the ack email fails
  }
};
