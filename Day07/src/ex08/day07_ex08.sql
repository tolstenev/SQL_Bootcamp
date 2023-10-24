SELECT p.address, piz.name AS name, count(piz.name) as count_of_orders
FROM person_order
         JOIN menu m ON m.id = person_order.menu_id
         JOIN pizzeria piz ON piz.id = m.pizzeria_id
         JOIN person p ON p.id = person_order.person_id
GROUP BY piz.name, p.address
ORDER BY address, piz.name