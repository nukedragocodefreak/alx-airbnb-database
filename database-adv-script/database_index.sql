

-- User Table Indexes
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_role ON User(role);

-- Property Table Indexes
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_pricepernight ON Property(pricepernight);

-- Booking Table Indexes
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_booking_end_date ON Booking(end_date);


EXPLAIN ANALYZE
SELECT 
    p.property_id,
    p.name,
    COUNT(b.booking_id) AS total_bookings
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name;
