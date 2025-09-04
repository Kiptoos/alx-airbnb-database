-- joins_queries.sql — Full
SELECT b.id AS booking_id,
       b.property_id,
       b.start_date, b.end_date, b.status,
       u.id AS user_id, u.name AS user_name, u.email
FROM bookings b
INNER JOIN users u ON u.id = b.user_id;
SELECT p.id AS property_id, p.title,
       r.id AS review_id, r.rating, r.comment, r.created_at AS review_date
FROM properties p
LEFT JOIN reviews r ON r.property_id = p.id
ORDER BY p.id, r.created_at NULLS LAST;
SELECT u.id AS user_id, u.name AS user_name, b.id AS booking_id, b.status
FROM users u
FULL OUTER JOIN bookings b ON b.user_id = u.id;
-- MySQL emulation: LEFT JOIN UNION ALL RIGHT JOIN ... WHERE u.id IS NULL
