# ERD Requirements (Airbnb-like DB)

This document defines the **entities, attributes, and relationships** for an Airbnb-style relational schema.

## Entities & Key Attributes

### 1) users
- `id` (PK)
- `name` (NOT NULL)
- `email` (UNIQUE, NOT NULL)
- `phone`
- `created_at` (timestamp, default now)

### 2) properties
- `id` (PK)
- `host_id` (FK → users.id, NOT NULL)
- `title` (NOT NULL)
- `description`
- `nightly_price` (numeric, NOT NULL, >= 0)
- `city` (NOT NULL)
- `country` (NOT NULL)
- `created_at` (timestamp, default now)

### 3) bookings
- `id` (PK)
- `user_id` (FK → users.id, NOT NULL)
- `property_id` (FK → properties.id, NOT NULL)
- `start_date` (date, NOT NULL)
- `end_date` (date, NOT NULL, must be > start_date)
- `status` (enum/text: pending|confirmed|canceled|completed)
- `created_at` (timestamp, default now)

### 4) payments
- `id` (PK)
- `booking_id` (FK → bookings.id, NOT NULL)
- `amount` (numeric, NOT NULL, >= 0)
- `currency` (text, default 'USD')
- `status` (text: pending|succeeded|failed|refunded)
- `paid_at` (timestamp, nullable)

### 5) reviews
- `id` (PK)
- `booking_id` (FK → bookings.id, NOT NULL)
- `property_id` (FK → properties.id, NOT NULL)
- `user_id` (FK → users.id, NOT NULL)
- `rating` (int 1..5, NOT NULL)
- `comment` (text)
- `created_at` (timestamp, default now)

### 6) amenities (lookup)
- `id` (PK)
- `name` (UNIQUE, NOT NULL)

### 7) property_amenities (junction)
- `property_id` (FK → properties.id, NOT NULL)
- `amenity_id`  (FK → amenities.id, NOT NULL)
- (PK: property_id, amenity_id)

## Relationships
- **users (1) — (N) properties** via `properties.host_id`.
- **users (1) — (N) bookings** via `bookings.user_id`.
- **properties (1) — (N) bookings** via `bookings.property_id`.
- **bookings (1) — (1) payments** via `payments.booking_id` (often 0..1 → treat as optional).
- **bookings (1) — (1) reviews** (optional) used as proof-of-stay.
- **properties (M) — (N) amenities** via `property_amenities`.

## Notes
- Index columns used for joins and filters: foreign keys, `payments.paid_at`, `bookings.start_date/end_date`, `properties.city/nightly_price`.
- All timestamps should be stored in UTC.
- Use appropriate constraints to prevent overlapping bookings at the application layer (or exclusion constraints in Postgres).

