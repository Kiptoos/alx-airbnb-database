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
