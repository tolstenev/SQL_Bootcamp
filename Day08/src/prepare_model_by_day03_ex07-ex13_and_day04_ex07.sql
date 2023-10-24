--Day 03 ex07
INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES (19, 2, 'greek pizza', 800);

--Day 03 ex08
INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES ((SELECT (MAX(menu.id) + 1) FROM menu),
        (SELECT pizzeria.id FROM pizzeria WHERE pizzeria.name = 'Dominos'),
        'sicilian pizza',
        900)
;

--Day 03 ex09
INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT (MAX(person_visits.id) + 1) FROM person_visits),
       (SELECT person.id FROM person WHERE person.name = 'Denis'),
       (SELECT id AS pizzeria FROM pizzeria WHERE pizzeria.name = 'Dominos'),
       ('2022-02-24'::date))
;

INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT (MAX(person_visits.id) + 1) FROM person_visits),
       (SELECT person.id FROM person WHERE person.name = 'Irina'),
       (SELECT id AS pizzeria FROM pizzeria WHERE pizzeria.name = 'Dominos'),
       ('2022-02-24'::date))
;

--Day 03 ex10
INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES ((SELECT (MAX(person_order.id) + 1) FROM person_order),
       (SELECT person.id FROM person WHERE person.name = 'Denis'),
       (SELECT menu.id FROM menu WHERE pizza_name = 'sicilian pizza'),
       ('2022-02-24'::date))
;

INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES ((SELECT (MAX(person_order.id) + 1) FROM person_order),
       (SELECT person.id FROM person WHERE person.name = 'Irina'),
       (SELECT menu.id FROM menu WHERE pizza_name = 'sicilian pizza'),
       ('2022-02-24'::date))
;

--Day 03 ex11
UPDATE menu
SET price = price * 0.9
WHERE pizza_name = 'greek pizza'
;

--Day 03 ex12
INSERT INTO person_order
SELECT gen_id                                                 AS id,
       person.id                                              AS person_id,
       (SELECT id FROM menu WHERE pizza_name = 'greek pizza') AS menu_id,
       '2022-02-25'::date                                     AS visit_date
FROM GENERATE_SERIES((SELECT (MAX(id) + 1) FROM person_order),
                     ((SELECT MAX(id) FROM person) +
                      (SELECT MAX(id) FROM person_order)),
                       1) AS gen_id
         JOIN person ON (person.id + (SELECT MAX(id) FROM person_order)) = gen_id
;

--Day 03 ex13
DELETE
FROM person_order
WHERE order_date = '2022-02-25'
  AND menu_id =
      (SELECT id FROM menu
       WHERE pizza_name = 'greek pizza')
;

DELETE
FROM menu
WHERE pizza_name = 'greek pizza'
;

--Day 04 ex06
CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats
AS
    SELECT piz.name AS pizzeria_name
    FROM person AS p
             JOIN person_visits pv ON p.id = pv.person_id
             JOIN pizzeria piz ON pv.pizzeria_id = piz.id
             JOIN menu m ON piz.id = m.pizzeria_id
    WHERE p.name = ('Dmitriy')
      AND visit_date = '2022-01-08'
      AND price < 800;

--Day 04 ex07
INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
SELECT (SELECT (MAX(id) + 1) FROM person_visits)                        AS id,
       (SELECT id FROM person WHERE name = 'Dmitriy')                   AS person_id,
       (SELECT pizzeria.id
        FROM pizzeria
            JOIN menu m ON pizzeria.id = m.pizzeria_id
            JOIN mv_dmitriy_visits_and_eats ON TRUE
        WHERE m.price < 800
          AND pizzeria.name != mv_dmitriy_visits_and_eats.pizzeria_name
        LIMIT 1)                                                        AS pizzeria_id,
        '2022-01-08'::date                                              AS visit_date
FROM mv_dmitriy_visits_and_eats;

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;





