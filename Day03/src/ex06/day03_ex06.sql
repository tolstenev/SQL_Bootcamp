WITH t1 AS (SELECT menu.id, pizza_name, p1.name AS pizzeria_name_1, price
            FROM menu
                     JOIN pizzeria p1 ON menu.pizzeria_id = p1.id),
     t2 AS (SELECT menu.id, pizza_name, p2.name AS pizzeria_name_2, price
            FROM menu
                     JOIN pizzeria p2 ON menu.pizzeria_id = p2.id)

SELECT t1.pizza_name AS pizza_name, pizzeria_name_1, pizzeria_name_2, t1.price AS price
FROM t1, t2
WHERE t1.pizza_name = t2.pizza_name AND t1.price = t2.price AND t1.id > t2.id
ORDER BY pizza_name
