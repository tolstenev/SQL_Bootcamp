SELECT pizza_name,
       (SELECT name
        FROM pizzeria
        WHERE id = menu.pizzeria_id) AS pizzeria_name,
       price
FROM menu
         JOIN pizzeria p ON menu.pizzeria_id = p.id
WHERE pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY pizza_name, pizzeria_name
;
