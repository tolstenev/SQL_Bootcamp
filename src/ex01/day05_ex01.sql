SET ENABLE_SEQSCAN = OFF;

EXPLAIN ANALYZE
SELECT pizza_name, name AS pizzeria_name
FROM menu
         JOIN pizzeria ON pizzeria.id = menu.pizzeria_id;
