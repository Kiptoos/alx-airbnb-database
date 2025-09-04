-- aggregations_and_window_functions.sql — Full
SELECT u.id AS user_id, u.name, COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON b.user_id = u.id
GROUP BY u.id, u.name
ORDER BY total_bookings DESC, u.id;
WITH counts AS (
  SELECT p.id AS property_id, p.title, COUNT(b.id) AS bookings_count
  FROM properties p
  LEFT JOIN bookings b ON b.property_id = p.id
  GROUP BY p.id, p.title
)
SELECT property_id, title, bookings_count,
       RANK() OVER (ORDER BY bookings_count DESC) AS rank_by_bookings,
       ROW_NUMBER() OVER (ORDER BY bookings_count DESC) AS rownum_by_bookings
FROM counts
ORDER BY rank_by_bookings, property_id;
