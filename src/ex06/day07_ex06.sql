SELECT name, COUNT(*) AS count_of_orders, round(avg(price), 2) as average_price, max(price) as max_price
from person_order po
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria p ON p.id = m.pizzeria_id
GROUP BY name
ORDER BY name