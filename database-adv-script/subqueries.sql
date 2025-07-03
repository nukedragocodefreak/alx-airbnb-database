
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
