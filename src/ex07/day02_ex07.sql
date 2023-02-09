SELECT pizza_name
FROM menu
WHERE pizzeria_id IN (SELECT p.id
                      FROM menu
                               JOIN pizzeria p ON menu.pizzeria_id = p.id
                               JOIN person_order po ON menu.id = po.menu_id
                               JOIN person ON person.id = po.person_id
                               JOIN person_visits pv ON person.id = pv.person_id
                      WHERE person.name IN ('Dmitriy')
                        AND visit_date = '2022-01-08')
  AND price < 800
