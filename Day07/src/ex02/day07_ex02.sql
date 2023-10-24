(SELECT piz.name, COUNT(*) AS count, 'order' AS action_type
 FROM pizzeria piz
          JOIN menu m ON piz.id = m.pizzeria_id
          JOIN person_order po ON m.id = po.menu_id
 GROUP BY name
 ORDER BY count DESC
 LIMIT 3)

UNION ALL

(SELECT piz.name, COUNT(*) AS count, 'visit' AS action_type
 FROM pizzeria piz
          JOIN person_visits pv ON piz.id = pv.pizzeria_id
 GROUP BY name
 ORDER BY count DESC
 LIMIT 3);
