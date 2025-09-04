-- subqueries.sql — Full
SELECT p.id, p.title, avg_scores.avg_rating
FROM properties p
JOIN (
  SELECT property_id, AVG(rating)::NUMERIC(3,2) AS avg_rating
  FROM reviews
  GROUP BY property_id
) AS avg_scores ON avg_scores.property_id = p.id
WHERE avg_scores.avg_rating > 4.0
ORDER BY avg_scores.avg_rating DESC;
SELECT u.id, u.name, u.email
FROM users u
WHERE (SELECT COUNT(*) FROM bookings b WHERE b.user_id = u.id) > 3
ORDER BY u.id;
