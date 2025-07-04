-- Drop if exists for re-runs.
DROP TABLE IF EXISTS booking CASCADE;

-- Step 1: Create the parent partitioned table.
CREATE TABLE booking (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    payment_id INT
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions (adjust date ranges as needed).
CREATE TABLE booking_2023 PARTITION OF booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE booking_2024 PARTITION OF booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE booking_future PARTITION OF booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');



