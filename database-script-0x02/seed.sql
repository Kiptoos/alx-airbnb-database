-- database-script-0x02/seed.sql
-- Seed realistic sample data

-- Clean slate
TRUNCATE property_amenities, payments, reviews, bookings, properties, users, amenities RESTART IDENTITY CASCADE;

-- Users
INSERT INTO users (name, email, phone) VALUES
('Alice', 'alice@example.com', '+254700000001'),
('Bob',   'bob@example.com',   '+254700000002'),
('Carol', 'carol@example.com', '+254700000003'),
('Dave',  'dave@example.com',  '+254700000004');

-- Properties
INSERT INTO properties (host_id, title, description, nightly_price, city, country) VALUES
(1, 'Cozy Studio', 'Compact studio near CBD', 45.00, 'Nairobi', 'Kenya'),
(1, 'Garden Cottage', 'Quiet cottage with garden', 70.00, 'Kisumu', 'Kenya'),
(2, 'CBD Apartment', 'Apartment with fast Wi-Fi', 85.50, 'Nairobi', 'Kenya'),
(3, 'Lake View Villa', 'Spacious villa overlooking the lake', 190.00, 'Naivasha', 'Kenya');

-- Amenities
INSERT INTO amenities (name) VALUES
('Wi-Fi'), ('Parking'), ('Pool'), ('Kitchen'), ('Pet-friendly');

-- Property amenities
INSERT INTO property_amenities (property_id, amenity_id) VALUES
(1, 1), (1, 4),
(2, 1), (2, 2), (2, 4),
(3, 1), (3, 4),
(4, 1), (4, 2), (4, 3), (4, 4);

-- Bookings
INSERT INTO bookings (user_id, property_id, start_date, end_date, status, created_at) VALUES
(2, 1, '2025-08-10', '2025-08-12', 'confirmed', NOW() - INTERVAL '40 days'),
(2, 3, '2025-08-20', '2025-08-25', 'confirmed', NOW() - INTERVAL '30 days'),
(3, 4, '2025-09-02', '2025-09-05', 'pending',   NOW() - INTERVAL '10 days'),
(4, 2, '2025-09-03', '2025-09-04', 'canceled',  NOW() - INTERVAL '5 days'),
(4, 1, '2025-09-06', '2025-09-08', 'confirmed', NOW() - INTERVAL '2 days');

-- Payments (assume one per confirmed booking)
INSERT INTO payments (booking_id, amount, currency, status, paid_at) VALUES
(1, 90.00,  'USD', 'succeeded', NOW() - INTERVAL '39 days'),
(2, 427.50, 'USD', 'succeeded', NOW() - INTERVAL '29 days'),
(5, 90.00,  'USD', 'pending',   NULL);

-- Reviews (only for completed stays)
INSERT INTO reviews (booking_id, property_id, user_id, rating, comment, created_at) VALUES
(1, 1, 2, 4, 'Decent and clean', NOW() - INTERVAL '38 days'),
(2, 3, 2, 5, 'Great location!',  NOW() - INTERVAL '28 days');
