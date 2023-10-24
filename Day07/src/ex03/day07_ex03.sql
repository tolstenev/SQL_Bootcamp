SELECT name, SUM(count) as total_count
FROM ((SELECT piz.name, COUNT(*) AS count
       FROM pizzeria piz
                JOIN menu m ON piz.id = m.pizzeria_id
                JOIN person_order po ON m.id = po.menu_id
       GROUP BY name)

      UNION ALL

      (SELECT piz.name, COUNT(*) AS count
       FROM pizzeria piz
                JOIN person_visits pv ON piz.id = pv.pizzeria_id
       GROUP BY name)) AS t1
GROUP BY name
ORDER BY total_count DESC, name ASC