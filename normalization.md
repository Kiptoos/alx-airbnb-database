# Normalization to 3NF

This schema is designed to achieve **Third Normal Form (3NF)**.

## 1NF
- All attributes are atomic (e.g., email, city, nightly_price are single-valued).
- Each table has a primary key.

## 2NF
- No partial dependency on a composite key; in junction table `property_amenities(property_id, amenity_id)`
  the only attributes are the keys themselves. Other tables have single-column PKs.

## 3NF
- No transitive dependencies:
  - `properties` keeps location fields (`city`, `country`) separate; derived aggregates (avg_rating) are not stored.
  - `payments.currency` describes the payment, not the user or property.
  - `bookings.status` depends only on the booking row.

## Decompositions
- Amenities split into **lookup (`amenities`)** and **junction (`property_amenities`)** tables to remove repeating groups.
- Reviews are separated from bookings to avoid nullable/duplicated columns on `bookings`.

## Keys & Constraints
- PKs on every table; FKs maintain referential integrity.
- Unique constraints on `users.email` and `amenities.name` remove redundancy.

## Indexing (performance, not normalization)
- Indexes on FKs and frequent filters: `bookings(property_id, start_date, end_date)`, `properties(city, nightly_price)`.
