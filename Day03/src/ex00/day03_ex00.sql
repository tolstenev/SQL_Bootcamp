SELECT pizza_name, price, p2.name AS pizzeria_name, visit_date
FROM person_visits pv
         JOIN person p ON p.id = pv.person_id
         JOIN pizzeria p2 ON p2.id = pv.pizzeria_id
         JOIN menu m ON p2.id = m.pizzeria_id
WHERE p.name = 'Kate' AND price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizzeria_name
;
