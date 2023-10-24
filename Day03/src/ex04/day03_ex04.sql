SELECT *
FROM ((SELECT p2.name AS pizzeria_name
       FROM person_order po
                JOIN person p ON p.id = po.person_id
                JOIN menu m ON m.id = po.menu_id
                JOIN pizzeria p2 ON p2.id = m.pizzeria_id
       WHERE gender = 'female'

       EXCEPT

       SELECT p2.name AS pizzeria_name
       FROM person_order po
                JOIN person p ON p.id = po.person_id
                JOIN menu m ON m.id = po.menu_id
                JOIN pizzeria p2 ON p2.id = m.pizzeria_id
       WHERE gender = 'male'
      )

      UNION

      (SELECT p2.name AS pizzeria_name
       FROM person_order po
                JOIN person p ON p.id = po.person_id
                JOIN menu m ON m.id = po.menu_id
                JOIN pizzeria p2 ON p2.id = m.pizzeria_id
       WHERE gender = 'male'

       EXCEPT

       SELECT p2.name AS pizzeria_name
       FROM person_order po
                JOIN person p ON p.id = po.person_id
                JOIN menu m ON m.id = po.menu_id
                JOIN pizzeria p2 ON p2.id = m.pizzeria_id
       WHERE gender = 'female'
      )) AS t1
ORDER BY pizzeria_name
;