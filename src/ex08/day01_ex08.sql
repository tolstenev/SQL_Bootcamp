SELECT order_date, pers.name || ' (age:' || pers.age::varchar || ')' AS person_information
FROM person_order
NATURAL JOIN (SELECT id AS person_id, name, age FROM person) AS pers
ORDER BY order_date, person_information
;
