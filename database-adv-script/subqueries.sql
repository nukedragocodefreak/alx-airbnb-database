
SELECT 
    p.property_id,
    p.name,
    p.description,
    p.location
FROM Property p
WHERE (
    SELECT AVG(r.rating)
    FROM Review r
    WHERE r.property_id = p.property_id
) > 4.0;


SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM User u
WHERE EXISTS (
    SELECT 1
    FROM Booking b1
    WHERE b1.user_id = u.user_id
      AND EXISTS (
          SELECT 1 FROM Booking b2
          WHERE b2.user_id = u.user_id AND b2.booking_id <> b1.booking_id
            AND EXISTS (
                SELECT 1 FROM Booking b3
                WHERE b3.user_id = u.user_id AND b3.booking_id NOT IN (b1.booking_id, b2.booking_id)
                  AND EXISTS (
                      SELECT 1 FROM Booking b4
                      WHERE b4.user_id = u.user_id AND b4.booking_id NOT IN (b1.booking_id, b2.booking_id, b3.booking_id)
                  )
            )
      )
);
