SELECT piz.name
FROM person as p
JOIN person_visits pv ON p.id = pv.person_id
JOIN pizzeria piz ON pv.pizzeria_id = piz.id
JOIN menu m ON piz.id = m.pizzeria_id
WHERE p.name = ('Dmitriy') AND visit_date = '2022-01-08' AND price < 800