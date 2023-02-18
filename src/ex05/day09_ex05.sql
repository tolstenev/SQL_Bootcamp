DROP FUNCTION fnc_persons_male CASCADE;
DROP FUNCTION fnc_persons_female CASCADE;

CREATE OR REPLACE FUNCTION fnc_persons(pgender varchar DEFAULT 'female')
       RETURNS TABLE (id      bigint,
                      name    varchar,
                      age     integer,
                      gender  varchar,
                      address varchar) AS $$
    SELECT *
    FROM person
    WHERE gender = pgender
$$ LANGUAGE SQL;


-- SQL-Statements for check
select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();