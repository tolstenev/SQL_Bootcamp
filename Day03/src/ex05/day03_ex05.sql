WITH visit_andrey AS (
         SELECT pizzeria.name AS pizzeria_name
         FROM person_visits
                  JOIN person ON person.id = person_visits.person_id
                  JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
         WHERE person.name = 'Andrey'),
     order_andrey AS (
         SELECT DISTINCT pizzeria.name AS pizzeria_name
         FROM person_order
                  JOIN menu ON menu.id = person_order.menu_id
                  JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
                  JOIN person ON person.id = person_order.person_id
         WHERE person.name = 'Andrey'),
     visit_without_order AS (
         SELECT pizzeria_name
         FROM visit_andrey
         EXCEPT
         SELECT pizzeria_name
         FROM order_andrey),
     order_without_visit AS (
         SELECT pizzeria_name
         FROM order_andrey
         EXCEPT
         SELECT pizzeria_name
         FROM visit_andrey
     )

SELECT pizzeria_name
FROM visit_without_order
UNION
SELECT pizzeria_name
FROM order_without_visit
ORDER BY pizzeria_name
