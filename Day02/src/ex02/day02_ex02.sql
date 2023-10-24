SELECT COALESCE(person.name, '-') person_name,
       visit_date,
       COALESCE(t2.name, '-')     pizzeria_name
FROM person
         FULL JOIN (SELECT person_id, pizzeria_id, visit_date
                    FROM person_visits
                    WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
                    ORDER BY visit_date) AS t1 ON t1.person_id = person.id
         FULL JOIN (SELECT id, name
                    FROM pizzeria) AS t2 ON t2.id = t1.pizzeria_id
ORDER BY person_name, visit_date, pizzeria_name
;
