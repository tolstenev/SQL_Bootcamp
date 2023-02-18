CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar DEFAULT 'Dmitriy',
                                                              pprice numeric DEFAULT '500',
                                                              pdate date DEFAULT '2022-01-08')
       RETURNS TABLE (piz_name varchar)
   AS $$BEGIN

        WITH visits AS (
                SELECT p.name     AS person_name,
                       visit_date AS date,
                       piz.name   AS pizzeria_name
                FROM person_visits pv
                         JOIN pizzeria piz ON piz.id = pv.pizzeria_id
                         JOIN person p ON p.id = pv.person_id),
            orders AS (
                SELECT p.name     AS person_name,
                       order_date AS date,
                       piz.name   AS pizzeria_name,
                       price
                FROM person_order pv
                         JOIN person p ON p.id = pv.person_id
                         JOIN menu m ON m.id = pv.menu_id
                         JOIN pizzeria piz ON piz.id = m.pizzeria_id)

        SELECT vo.pizzeria_name
        FROM (
              SELECT person_name, date, pizzeria_name
              FROM visits

              INTERSECT

              SELECT person_name, date, pizzeria_name
              FROM orders

             ) AS vo
                 JOIN orders o ON o.person_name   = vo.person_name   AND
                                  o.date          = vo.date          AND
                                  o.pizzeria_name = vo.pizzeria_name
       WHERE vo.person_name = pperson AND
             price          = pprice AND
             vo.date        = pdate;

       END;
    $$ LANGUAGE plpgsql;


-- SQL-Statements for check
select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');

-- WITH visits AS (
--         SELECT p.name     AS person_name,
--                visit_date AS date,
--                piz.name   AS pizzeria_name
--         FROM person_visits pv
--                  JOIN pizzeria piz ON piz.id = pv.pizzeria_id
--                  JOIN person p ON p.id = pv.person_id),
--     orders AS (
--         SELECT p.name     AS person_name,
--                order_date AS date,
--                piz.name   AS pizzeria_name,
--                price
--         FROM person_order pv
--                  JOIN person p ON p.id = pv.person_id
--                  JOIN menu m ON m.id = pv.menu_id
--                  JOIN pizzeria piz ON piz.id = m.pizzeria_id)
--
-- SELECT vo.person_name   AS pperson,
--        price            AS pprice,
--        vo.date          AS pdate,
--        vo.pizzeria_name AS pizzeria_name
-- FROM (
--       SELECT person_name, date, pizzeria_name
--       FROM visits
--
--       INTERSECT
--
--       SELECT person_name, date, pizzeria_name
--       FROM orders
--
--      ) AS vo
--          JOIN orders o ON o.person_name   = vo.person_name   AND
--                           o.date          = vo.date          AND
--                           o.pizzeria_name = vo.pizzeria_name
;