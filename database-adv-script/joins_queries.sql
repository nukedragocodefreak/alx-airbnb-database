
SELECT 
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id;


SELECT 
    p.property_id,
    p.name AS property_name,
    p.description,
    p.location,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at
FROM Review r
LEFT JOIN Property p  ON p.property_id = r.property_id;
ORDER BY 1 DESC;


SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM User u
FULL OUTER JOIN Booking b ON u.user_id = b.user_id;
