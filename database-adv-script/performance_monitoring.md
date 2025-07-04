
-- Query A: Fetch bookings in a date range
SELECT * FROM booking WHERE start_date BETWEEN '2024-05-01' AND '2024-05-31';

-- Query B: Fetch user booking details
SELECT b.*, u.name, u.email 
FROM booking b
JOIN users u ON b.user_id = u.user_id
WHERE b.start_date >= CURRENT_DATE;

EXPLAIN ANALYZE
SELECT * FROM booking WHERE start_date BETWEEN '2024-05-01' AND '2024-05-31';
