-- =====================================================
-- GUTZO DATABASE - ADDITIONAL SEED DATA
-- Populates empty tables with sample data
-- Run this in Supabase SQL Editor
-- =====================================================

-- =====================================================
-- 1. VENDOR SCHEDULES (Weekly operating hours)
-- =====================================================
INSERT INTO public.vendor_schedules (vendor_id, day_of_week, opening_time, closing_time, is_closed)
SELECT v.id, d.day, 
  CASE WHEN d.day = 0 THEN NULL ELSE '08:00'::TIME END,
  CASE WHEN d.day = 0 THEN NULL ELSE '22:00'::TIME END,
  CASE WHEN d.day = 0 THEN true ELSE false END
FROM public.vendors v
CROSS JOIN (SELECT generate_series(0, 6) AS day) d
WHERE NOT EXISTS (
  SELECT 1 FROM public.vendor_schedules vs 
  WHERE vs.vendor_id = v.id AND vs.day_of_week = d.day
);

-- =====================================================
-- 2. VENDOR SPECIAL HOURS (Holidays/Special dates)
-- =====================================================
INSERT INTO public.vendor_special_hours (vendor_id, special_date, opening_time, closing_time, is_closed, reason)
SELECT v.id, '2025-12-25'::DATE, NULL, NULL, true, 'Christmas Holiday'
FROM public.vendors v
WHERE v.is_active = true
ON CONFLICT DO NOTHING;

INSERT INTO public.vendor_special_hours (vendor_id, special_date, opening_time, closing_time, is_closed, reason)
SELECT v.id, '2025-01-01'::DATE, NULL, NULL, true, 'New Year Holiday'
FROM public.vendors v
WHERE v.is_active = true
ON CONFLICT DO NOTHING;

INSERT INTO public.vendor_special_hours (vendor_id, special_date, opening_time, closing_time, is_closed, reason)
SELECT v.id, '2025-01-14'::DATE, '10:00'::TIME, '20:00'::TIME, false, 'Pongal - Special Hours'
FROM public.vendors v
WHERE v.is_active = true
ON CONFLICT DO NOTHING;

-- =====================================================
-- 3. PAYMENTS (Link to existing orders)
-- =====================================================
INSERT INTO public.payments (id, order_id, mode, gateway, transaction_id, merchant_order_id, amount, currency, status, gateway_response, created_at, updated_at)
SELECT 
  gen_random_uuid(),
  o.id,
  'upi',
  'paytm',
  o.payment_id,
  o.order_number,
  o.total_amount,
  'INR',
  CASE WHEN o.payment_status = 'paid' THEN 'success' ELSE o.payment_status END,
  '{"status": "TXN_SUCCESS"}'::jsonb,
  o.created_at,
  o.updated_at
FROM public.orders o
WHERE o.payment_id IS NOT NULL
AND NOT EXISTS (SELECT 1 FROM public.payments p WHERE p.order_id = o.id);

-- =====================================================
-- 4. COUPON USAGE (Sample usage records)
-- =====================================================
INSERT INTO public.coupon_usage (coupon_id, user_id, order_id, discount_applied, used_at)
SELECT 
  c.id,
  u.id,
  o.id,
  CASE 
    WHEN c.discount_type = 'percentage' THEN LEAST(o.subtotal * c.discount_value / 100, COALESCE(c.maximum_discount, 9999))
    ELSE c.discount_value
  END,
  o.created_at
FROM public.coupons c
CROSS JOIN public.users u
JOIN public.orders o ON o.user_id = u.id
WHERE c.code = 'WELCOME50' AND c.first_order_only = true
AND NOT EXISTS (SELECT 1 FROM public.coupon_usage cu WHERE cu.coupon_id = c.id AND cu.user_id = u.id)
LIMIT 3;

-- =====================================================
-- 5. PRODUCT SUBSCRIPTIONS (Sample subscriptions)
-- =====================================================
INSERT INTO public.product_subscriptions (
  id, user_id, vendor_id, subscription_name, frequency, duration_weeks, 
  start_date, end_date, total_amount, amount_per_delivery, status,
  delivery_time, delivery_days, delivery_address, payment_status, 
  next_delivery_date, auto_renew
)
SELECT 
  gen_random_uuid(),
  u.id,
  '550e8400-e29b-41d4-a716-446655440010'::uuid,
  'Weekly Fruit Bowl Subscription',
  'weekly',
  4,
  CURRENT_DATE,
  CURRENT_DATE + INTERVAL '4 weeks',
  756.00,
  189.00,
  'active',
  '10:00 AM',
  ARRAY[1, 3, 5],
  '{"street": "RS Puram", "city": "Coimbatore"}'::jsonb,
  'paid',
  CURRENT_DATE + INTERVAL '2 days',
  true
FROM public.users u
WHERE u.verified = true
LIMIT 2;

INSERT INTO public.product_subscriptions (
  id, user_id, vendor_id, subscription_name, frequency, duration_weeks, 
  start_date, end_date, total_amount, amount_per_delivery, status,
  delivery_time, delivery_days, delivery_address, payment_status, 
  next_delivery_date, auto_renew
)
SELECT 
  gen_random_uuid(),
  u.id,
  '550e8400-e29b-41d4-a716-446655440012'::uuid,
  'Daily Smoothie Subscription',
  'daily',
  2,
  CURRENT_DATE - INTERVAL '1 week',
  CURRENT_DATE + INTERVAL '1 week',
  2800.00,
  200.00,
  'paused',
  '08:00 AM',
  ARRAY[1, 2, 3, 4, 5],
  '{"street": "Gandhipuram", "city": "Coimbatore"}'::jsonb,
  'paid',
  NULL,
  false
FROM public.users u
WHERE u.verified = true
LIMIT 1
OFFSET 2;

-- =====================================================
-- 6. SUBSCRIPTION ITEMS (Link products to subscriptions)
-- =====================================================
INSERT INTO public.subscription_items (subscription_id, product_id, product_name, quantity, unit_price)
SELECT 
  ps.id,
  '650e8400-e29b-41d4-a716-446655440001'::uuid,
  'Tropical Paradise Bowl',
  1,
  189.00
FROM public.product_subscriptions ps
WHERE ps.subscription_name LIKE '%Fruit Bowl%';

INSERT INTO public.subscription_items (subscription_id, product_id, product_name, quantity, unit_price)
SELECT 
  ps.id,
  '650e8400-e29b-41d4-a716-446655440008'::uuid,
  'Protein Power Smoothie',
  1,
  200.00
FROM public.product_subscriptions ps
WHERE ps.subscription_name LIKE '%Smoothie%';

-- =====================================================
-- 7. SUBSCRIPTION DELIVERIES (Scheduled deliveries)
-- =====================================================
INSERT INTO public.subscription_deliveries (subscription_id, scheduled_date, delivery_status, notes)
SELECT 
  ps.id,
  gs.date,
  CASE 
    WHEN gs.date < CURRENT_DATE THEN 'delivered'
    WHEN gs.date = CURRENT_DATE THEN 'out_for_delivery'
    ELSE 'scheduled'
  END,
  NULL
FROM public.product_subscriptions ps
CROSS JOIN (
  SELECT generate_series(CURRENT_DATE - INTERVAL '5 days', CURRENT_DATE + INTERVAL '10 days', INTERVAL '1 day')::DATE AS date
) gs
WHERE ps.status IN ('active', 'paused')
AND EXTRACT(DOW FROM gs.date) = ANY(ps.delivery_days);

-- =====================================================
-- 8. MEAL PLAN SUBSCRIPTIONS (Sample meal plan subs)
-- =====================================================
INSERT INTO public.meal_plan_subscriptions (
  user_id, meal_plan_id, chosen_meals, chosen_days, duration,
  start_date, end_date, total_amount, delivery_address, status,
  payment_status
)
SELECT 
  u.id,
  'a1000001-0000-4000-8000-000000000001'::uuid,
  ARRAY['lunch', 'dinner'],
  ARRAY[1, 2, 3, 4, 5, 6],
  'weekly',
  CURRENT_DATE,
  CURRENT_DATE + INTERVAL '7 days',
  534.00,
  '{"street": "RS Puram", "city": "Coimbatore", "pincode": "641002"}'::jsonb,
  'active',
  'paid'
FROM public.users u
WHERE u.verified = true
LIMIT 2;

INSERT INTO public.meal_plan_subscriptions (
  user_id, meal_plan_id, chosen_meals, chosen_days, duration,
  start_date, end_date, total_amount, delivery_address, status,
  payment_status
)
SELECT 
  u.id,
  'a1000002-0000-4000-8000-000000000002'::uuid,
  ARRAY['lunch', 'dinner'],
  ARRAY[1, 2, 3, 4, 5],
  'monthly',
  CURRENT_DATE - INTERVAL '15 days',
  CURRENT_DATE + INTERVAL '15 days',
  2670.00,
  '{"street": "Peelamedu", "city": "Coimbatore", "pincode": "641004"}'::jsonb,
  'active',
  'paid'
FROM public.users u
WHERE u.verified = true
LIMIT 1
OFFSET 3;

-- =====================================================
-- 9. SUPPORT TICKETS (Sample support tickets)
-- =====================================================
INSERT INTO public.support_tickets (user_id, order_id, subject, description, category, priority, status)
SELECT 
  o.user_id,
  o.id,
  'Order Delivery Issue - ' || o.order_number,
  'My order was delivered late. Expected by 12:30 PM but received at 2:15 PM.',
  'delivery',
  'medium',
  'resolved'
FROM public.orders o
LIMIT 1;

INSERT INTO public.support_tickets (user_id, subject, description, category, priority, status)
SELECT 
  u.id,
  'Payment Failed but Amount Deducted',
  'I tried to make a payment but it failed. However, the amount was deducted from my account. Please help.',
  'payment',
  'high',
  'in_progress'
FROM public.users u
WHERE u.verified = true
LIMIT 1
OFFSET 2;

INSERT INTO public.support_tickets (user_id, subject, description, category, priority, status)
SELECT 
  u.id,
  'Request for Refund',
  'I would like to request a refund for my cancelled subscription. Order ID: ORD_12345',
  'refund',
  'high',
  'open'
FROM public.users u
WHERE u.verified = true
LIMIT 1
OFFSET 3;

INSERT INTO public.support_tickets (user_id, subject, description, category, priority, status)
SELECT 
  u.id,
  'App Feedback',
  'The app is great! Would love to see more vegan options in the meal plans.',
  'other',
  'low',
  'closed'
FROM public.users u
WHERE u.verified = true
LIMIT 1
OFFSET 4;

-- =====================================================
-- 10. REVIEW VOTES (Sample helpful votes)
-- =====================================================
INSERT INTO public.review_votes (review_id, user_id, is_helpful)
SELECT 
  r.id,
  u.id,
  true
FROM public.reviews r
CROSS JOIN public.users u
WHERE r.helpful_count > 5
AND r.user_id != u.id
AND NOT EXISTS (SELECT 1 FROM public.review_votes rv WHERE rv.review_id = r.id AND rv.user_id = u.id)
LIMIT 20;

-- =====================================================
-- 11. WAITLIST (Sample waitlist entries)
-- =====================================================
INSERT INTO public.waitlist (user_id, type, target_id, user_phone, user_email, notified)
SELECT 
  u.id,
  'product',
  '650e8400-e29b-41d4-a716-446655440001'::uuid,
  u.phone,
  u.email,
  false
FROM public.users u
WHERE u.verified = true
LIMIT 2;

INSERT INTO public.waitlist (type, target_id, user_phone, user_email, notified)
VALUES 
  ('zone', 'd1000001-0000-4000-8000-000000000001', '+919800000001', 'waitlist1@example.com', false),
  ('zone', 'd1000002-0000-4000-8000-000000000002', '+919800000002', 'waitlist2@example.com', false),
  ('vendor', '550e8400-e29b-41d4-a716-446655440010', '+919800000003', 'waitlist3@example.com', true);

-- =====================================================
-- 12. INVENTORY LOGS (Sample stock changes)
-- =====================================================
INSERT INTO public.inventory_logs (product_id, vendor_id, change_type, quantity_change, quantity_before, quantity_after, reason, created_by)
SELECT 
  p.id,
  p.vendor_id,
  'restock',
  50,
  0,
  50,
  'Initial stock',
  'admin'
FROM public.products p
LIMIT 5;

INSERT INTO public.inventory_logs (product_id, vendor_id, change_type, quantity_change, quantity_before, quantity_after, reason, created_by)
SELECT 
  p.id,
  p.vendor_id,
  'sale',
  -5,
  50,
  45,
  'Order fulfillment',
  'system'
FROM public.products p
LIMIT 5;

-- =====================================================
-- 13. VENDOR PAYOUTS (Sample payout records)
-- =====================================================
INSERT INTO public.vendor_payouts (vendor_id, period_start, period_end, gross_amount, commission, tax_deducted, net_amount, order_count, status, payment_reference, paid_at)
SELECT 
  v.id,
  CURRENT_DATE - INTERVAL '14 days',
  CURRENT_DATE - INTERVAL '7 days',
  5000.00,
  750.00,
  85.50,
  4164.50,
  25,
  'completed',
  'UTR' || FLOOR(RANDOM() * 900000000 + 100000000)::TEXT,
  CURRENT_TIMESTAMP - INTERVAL '3 days'
FROM public.vendors v
WHERE v.is_active = true
LIMIT 3;

INSERT INTO public.vendor_payouts (vendor_id, period_start, period_end, gross_amount, commission, tax_deducted, net_amount, order_count, status)
SELECT 
  v.id,
  CURRENT_DATE - INTERVAL '7 days',
  CURRENT_DATE,
  3500.00,
  525.00,
  59.85,
  2915.15,
  18,
  'pending'
FROM public.vendors v
WHERE v.is_active = true
LIMIT 3
OFFSET 3;

-- =====================================================
-- VERIFY COUNTS
-- =====================================================
SELECT 'vendor_schedules' as table_name, COUNT(*) as count FROM public.vendor_schedules
UNION ALL SELECT 'vendor_special_hours', COUNT(*) FROM public.vendor_special_hours
UNION ALL SELECT 'payments', COUNT(*) FROM public.payments
UNION ALL SELECT 'coupon_usage', COUNT(*) FROM public.coupon_usage
UNION ALL SELECT 'product_subscriptions', COUNT(*) FROM public.product_subscriptions
UNION ALL SELECT 'subscription_items', COUNT(*) FROM public.subscription_items
UNION ALL SELECT 'subscription_deliveries', COUNT(*) FROM public.subscription_deliveries
UNION ALL SELECT 'meal_plan_subscriptions', COUNT(*) FROM public.meal_plan_subscriptions
UNION ALL SELECT 'support_tickets', COUNT(*) FROM public.support_tickets
UNION ALL SELECT 'review_votes', COUNT(*) FROM public.review_votes
UNION ALL SELECT 'waitlist', COUNT(*) FROM public.waitlist
UNION ALL SELECT 'inventory_logs', COUNT(*) FROM public.inventory_logs
UNION ALL SELECT 'vendor_payouts', COUNT(*) FROM public.vendor_payouts
ORDER BY table_name;
