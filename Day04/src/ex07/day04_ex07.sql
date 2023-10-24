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
