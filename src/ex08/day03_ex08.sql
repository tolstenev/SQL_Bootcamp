INSERT INTO menu
SELECT (SELECT (MAX(menu.id) + 1) FROM menu) AS id, pizzeria, 'sicilian pizza' AS pizza_name, 900 AS price
FROM (SELECT pizzeria.id AS pizzeria
      FROM pizzeria
      WHERE pizzeria.name = 'Dominos') AS pizzeria_id;