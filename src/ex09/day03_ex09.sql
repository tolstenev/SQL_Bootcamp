INSERT INTO person_visits
SELECT (SELECT (MAX(person_visits.id) + 1) FROM person_visits)               AS id,
       (SELECT person.id FROM person WHERE person.name = 'Denis')            AS person_id,
       (SELECT id AS pizzeria FROM pizzeria WHERE pizzeria.name = 'Dominos') AS pizzeria_id,
       ('2022-02-24'::date)                                                  AS visit_date
FROM GENERATE_SERIES(1, 1)
;

INSERT INTO person_visits
SELECT (SELECT (MAX(person_visits.id) + 1) FROM person_visits)               AS id,
       (SELECT person.id FROM person WHERE person.name = 'Irina')            AS person_id,
       (SELECT id AS pizzeria FROM pizzeria WHERE pizzeria.name = 'Dominos') AS pizzeria_id,
       ('2022-02-24'::date)                                                  AS visit_date
FROM GENERATE_SERIES(1, 1)
;