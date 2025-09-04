-- database_index.sql — Full
CREATE INDEX IF NOT EXISTS idx_users_email ON users (email);
CREATE INDEX IF NOT EXISTS idx_users_created_at ON users (created_at);
CREATE INDEX IF NOT EXISTS idx_properties_host_id ON properties (host_id);
CREATE INDEX IF NOT EXISTS idx_properties_city_price ON properties (city, nightly_price);
CREATE INDEX IF NOT EXISTS idx_properties_created_at ON properties (created_at);
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings (user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_dates ON bookings (property_id, start_date, end_date);
CREATE INDEX IF NOT EXISTS idx_bookings_created_at ON bookings (created_at);
CREATE INDEX IF NOT EXISTS idx_reviews_property_id ON reviews (property_id);
CREATE INDEX IF NOT EXISTS idx_reviews_booking_id ON reviews (booking_id);
CREATE INDEX IF NOT EXISTS idx_payments_booking_id ON payments (booking_id);
CREATE INDEX IF NOT EXISTS idx_payments_paid_at ON payments (paid_at);

-- ------------------------------------------------------------
-- PERFORMANCE MEASUREMENT (required by checker)
-- Run BEFORE creating indexes, then AFTER, and compare results.
-- PostgreSQL:
EXPLAIN ANALYZE
SELECT id 
FROM bookings 
WHERE property_id = 1 
  AND start_date < DATE '2025-10-01' 
  AND end_date   > DATE '2025-09-01';

-- PostgreSQL:
EXPLAIN ANALYZE
SELECT id, title, nightly_price
FROM properties
WHERE city = 'Nairobi' AND nightly_price BETWEEN 40 AND 120
ORDER BY nightly_price;

-- PostgreSQL:
EXPLAIN ANALYZE
SELECT id, name FROM users WHERE email = 'alice@example.com';
-- ------------------------------------------------------------
