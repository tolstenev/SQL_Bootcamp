SELECT pizza_name, price, name as pizzeria_name
FROM menu
JOIN pizzeria p ON p.id = menu.pizzeria_id
WHERE NOT EXISTS(SELECT menu_id
                 FROM person_order
                 WHERE menu_id = menu.id)
ORDER BY pizza_name, price
;
