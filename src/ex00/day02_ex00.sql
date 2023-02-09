SELECT name, rating
FROM (SELECT *
      FROM pizzeria
               LEFT JOIN person_visits pv ON pizzeria.id = pv.pizzeria_id) AS t1
WHERE visit_date ISNULL
;
