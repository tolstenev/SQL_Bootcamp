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
