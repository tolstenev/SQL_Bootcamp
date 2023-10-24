SELECT *
FROM ((SELECT p2.name AS pizzeria_name
       FROM person_visits pv
                JOIN person p ON p.id = pv.person_id
                JOIN pizzeria p2 ON p2.id = pv.pizzeria_id
       WHERE gender = 'female'

       EXCEPT ALL

       SELECT p2.name AS pizzeria_name
       FROM person_visits pv
                JOIN person p ON p.id = pv.person_id
                JOIN pizzeria p2 ON p2.id = pv.pizzeria_id
       WHERE gender = 'male'
      )

      UNION ALL

      (SELECT p2.name AS pizzeria_name
       FROM person_visits pv
                JOIN person p ON p.id = pv.person_id
                JOIN pizzeria p2 ON p2.id = pv.pizzeria_id
       WHERE gender = 'male'

       EXCEPT ALL

       SELECT p2.name AS pizzeria_name
       FROM person_visits pv
                JOIN person p ON p.id = pv.person_id
                JOIN pizzeria p2 ON p2.id = pv.pizzeria_id
       WHERE gender = 'female'
      )) AS t1
ORDER BY pizzeria_name
;