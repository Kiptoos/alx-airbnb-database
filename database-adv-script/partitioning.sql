-- partitioning.sql — Full (Postgres + MySQL comments)
CREATE TABLE IF NOT EXISTS bookings_partitioned (
  id BIGINT PRIMARY KEY,
  user_id BIGINT NOT NULL,
  property_id BIGINT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  status TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
) PARTITION BY RANGE (start_date);
DO $$
DECLARE y INT;
BEGIN
  FOR y IN 2024..2027 LOOP
    EXECUTE format($$
      CREATE TABLE IF NOT EXISTS bookings_p_%s PARTITION OF bookings_partitioned
      FOR VALUES FROM (DATE '%s-01-01') TO (DATE '%s-01-01');
    $$, y, y, y+1);
  END LOOP;
END $$;
-- MySQL 8 example using TO_DAYS(...) in comments.
