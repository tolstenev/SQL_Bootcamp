SELECT pizza_name,
       (SELECT name
        FROM pizzeria
        WHERE id = menu.pizzeria_id) AS pizzeria_name
FROM menu
JOIN pizzeria p ON menu.pizzeria_id = p.id
JOIN person_order po ON menu.id = po.menu_id
JOIN person ON person.id = po.person_id
WHERE person.name IN ('Denis', 'Anna')
ORDER BY pizza_name, pizzeria_name
;
