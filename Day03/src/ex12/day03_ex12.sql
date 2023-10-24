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