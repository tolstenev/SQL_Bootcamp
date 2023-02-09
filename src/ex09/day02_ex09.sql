SELECT DISTINCT person.name
        FROM menu
                 JOIN pizzeria p ON menu.pizzeria_id = p.id
                 JOIN person_order po ON menu.id = po.menu_id
                 JOIN person ON person.id = po.person_id
                 JOIN person_visits pv ON person.id = pv.person_id
        WHERE gender = 'female'
          AND pizza_name = 'cheese pizza'
INTERSECT
SELECT DISTINCT person.name
 FROM menu
          JOIN pizzeria p ON menu.pizzeria_id = p.id
          JOIN person_order po ON menu.id = po.menu_id
          JOIN person ON person.id = po.person_id
          JOIN person_visits pv ON person.id = pv.person_id
 WHERE gender = 'female'
   AND pizza_name = 'pepperoni pizza'
