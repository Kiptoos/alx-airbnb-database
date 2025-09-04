-- Full seed.sql
TRUNCATE payments, reviews, bookings, properties, users RESTART IDENTITY CASCADE;
INSERT INTO users (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Carol', 'carol@example.com'),
('Dave', 'dave@example.com');
INSERT INTO properties (host_id, title, nightly_price, city) VALUES
(1, 'Cozy Studio', 45.00, 'Nairobi'),
(1, 'Garden Cottage', 70.00, 'Kisumu'),
(2, 'CBD Apartment', 85.50, 'Nairobi'),
(3, 'Lake View Villa', 190.00, 'Naivasha');
INSERT INTO bookings (user_id, property_id, start_date, end_date, status, created_at) VALUES
(2, 1, '2025-08-10', '2025-08-12', 'confirmed', NOW() - INTERVAL '40 days'),
(2, 3, '2025-08-20', '2025-08-25', 'confirmed', NOW() - INTERVAL '30 days'),
(3, 4, '2025-09-02', '2025-09-05', 'pending',   NOW() - INTERVAL '10 days'),
(4, 2, '2025-09-03', '2025-09-04', 'canceled',  NOW() - INTERVAL '5 days'),
(4, 1, '2025-09-06', '2025-09-08', 'confirmed', NOW() - INTERVAL '2 days');
INSERT INTO payments (booking_id, amount, currency, status, paid_at) VALUES
(1, 90.00, 'USD', 'succeeded', NOW() - INTERVAL '39 days'),
(2, 427.50, 'USD', 'succeeded', NOW() - INTERVAL '29 days'),
(5, 90.00, 'USD', 'pending',   NULL);
INSERT INTO reviews (booking_id, property_id, user_id, rating, comment, created_at) VALUES
(1, 1, 2, 4, 'Decent and clean', NOW() - INTERVAL '38 days'),
(2, 3, 2, 5, 'Great location!',  NOW() - INTERVAL '28 days');
