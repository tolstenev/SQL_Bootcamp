SELECT DISTINCT name
FROM (SELECT person.name, pizza_name
      FROM menu
               JOIN pizzeria p ON menu.pizzeria_id = p.id
               JOIN person_order po ON menu.id = po.menu_id
               JOIN person ON person.id = po.person_id
               JOIN person_visits pv ON person.id = pv.person_id
      WHERE person.address IN ('Moscow', 'Samara')
        AND gender = 'male') as t1
WHERE pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY name DESC
