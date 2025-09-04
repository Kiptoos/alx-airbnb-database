-- perfomance.sql

-- Initial query: all bookings + user + property + payment details
SELECT b.id AS booking_id, b.start_date, b.end_date, b.status,
       u.id AS user_id, u.name AS user_name, u.email,
       p.id AS property_id, p.title, p.nightly_price, p.city,
       pay.id AS payment_id, pay.amount, pay.currency, pay.status AS payment_status, pay.paid_at
FROM bookings b
JOIN users u      ON u.id = b.user_id
JOIN properties p ON p.id = b.property_id
LEFT JOIN payments pay ON pay.booking_id = b.id;

-- Analyze performance of the initial query
EXPLAIN ANALYZE
SELECT b.id AS booking_id, b.start_date, b.end_date, b.status,
       u.id AS user_id, u.name AS user_name, u.email,
       p.id AS property_id, p.title, p.nightly_price, p.city,
       pay.id AS payment_id, pay.amount, pay.currency, pay.status AS payment_status, pay.paid_at
FROM bookings b
JOIN users u      ON u.id = b.user_id
JOIN properties p ON p.id = b.property_id
LEFT JOIN payments pay ON pay.booking_id = b.id;

-- Refactored optimized query
SELECT b.id AS booking_id, b.start_date, b.end_date, b.status, b.created_at,
       u.name AS user_name, u.email,
       p.title AS property_title, p.nightly_price,
       pay.amount, pay.currency, pay.status AS payment_status, pay.paid_at
FROM bookings b
JOIN users u      ON u.id = b.user_id
JOIN properties p ON p.id = b.property_id
LEFT JOIN payments pay ON pay.booking_id = b.id
WHERE b.created_at >= NOW() - INTERVAL '180 days'
ORDER BY b.created_at DESC;
