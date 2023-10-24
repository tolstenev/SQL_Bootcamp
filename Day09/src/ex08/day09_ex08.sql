DROP FUNCTION IF EXISTS fnc_fibonacci(integer);

CREATE OR REPLACE FUNCTION fnc_fibonacci(IN pstop integer DEFAULT 10)
       RETURNS TABLE (fibonacci integer)
   AS $$BEGIN
        RETURN QUERY
            (WITH RECURSIVE fib (prev, n) AS (
                VALUES (0, 1)
                UNION ALL
                SELECT n, prev + n
                FROM fib
                WHERE n < pstop
            )
             SELECT prev AS fibonacci
             FROM fib);
        END;
    $$ LANGUAGE plpgsql;


-- -- SQL-Statements for check
select * from fnc_fibonacci(100);
select * from fnc_fibonacci();
