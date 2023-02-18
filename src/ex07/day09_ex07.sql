DROP FUNCTION IF EXISTS func_minimum(anyarray);

CREATE OR REPLACE FUNCTION func_minimum(arr anyarray)
       RETURNS SETOF numeric
   AS $$BEGIN
        RETURN QUERY
            (SELECT MIN(x) FROM UNNEST(arr) AS x);
        END;
    $$ LANGUAGE plpgsql;


-- -- SQL-Statements for check
SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
