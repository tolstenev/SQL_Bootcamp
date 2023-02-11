CREATE VIEW v_price_with_discount
AS
    SELECT name, pizza_name, price, round(price - price*0.1)::integer AS discount_price
    from person_order po
        JOIN menu m ON m.id = po.menu_id
        JOIN person p ON p.id = po.person_id
    ORDER BY name, pizza_name;
