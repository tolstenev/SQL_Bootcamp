INSERT INTO person_order
SELECT (SELECT (MAX(person_order.id) + 1) FROM person_order)          AS id,
       (SELECT person.id FROM person WHERE person.name = 'Denis')     AS person_id,
       (SELECT menu.id FROM menu WHERE pizza_name = 'sicilian pizza') AS menu_id,
       ('2022-02-24'::date)                                           AS order_date
FROM GENERATE_SERIES(1, 1)
;

INSERT INTO person_order
SELECT (SELECT (MAX(person_order.id) + 1) FROM person_order)          AS id,
       (SELECT person.id FROM person WHERE person.name = 'Irina')     AS person_id,
       (SELECT menu.id FROM menu WHERE pizza_name = 'sicilian pizza') AS menu_id,
       ('2022-02-24'::date)                                           AS order_date
FROM GENERATE_SERIES(1, 1)
;