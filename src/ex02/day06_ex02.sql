SELECT p.name,
       pizza_name,
       price,
       ROUND(price - price * pd.discount * 0.01)::integer AS discount_price,
       p2.name                                            AS pizzeria_name
FROM person_order po
         JOIN menu m ON m.id = po.menu_id
         JOIN person p ON p.id = po.person_id
         JOIN pizzeria p2 ON p2.id = m.pizzeria_id
         JOIN person_discounts pd ON p.id = pd.person_id
ORDER BY name, pizza_name;
