SELECT DISTINCT name
FROM person_order
JOIN person p ON p.id = person_order.person_id
ORDER BY name
