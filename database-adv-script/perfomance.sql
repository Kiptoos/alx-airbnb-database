-- perfomance.sql — Full
SELECT *
FROM bookings b
LEFT JOIN users u      ON u.id = b.user_id
LEFT JOIN properties p ON p.id = b.property_id
LEFT JOIN payments pay ON pay.booking_id = b.id
ORDER BY b.created_at DESC;
SELECT
  b.id AS booking_id, b.property_id, b.user_id,
  b.start_date, b.end_date, b.status, b.created_at,
  u.name AS user_name, u.email AS user_email,
  p.title AS property_title, p.nightly_price,
  pay.amount, pay.currency, pay.status AS payment_status, pay.paid_at
FROM bookings b
JOIN users u      ON u.id = b.user_id
JOIN properties p ON p.id = b.property_id
LEFT JOIN payments pay ON pay.booking_id = b.id
WHERE b.created_at >= NOW() - INTERVAL '180 days'
ORDER BY b.created_at DESC;
