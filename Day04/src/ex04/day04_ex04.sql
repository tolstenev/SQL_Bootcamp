CREATE VIEW v_symmetric_union
AS
    WITH set_r AS (
        SELECT person_id
        FROM person_visits
        WHERE visit_date = '2022-01-02'),
         set_s AS (
             SELECT person_id
             FROM person_visits
             WHERE visit_date = '2022-01-06'
         )

    (SELECT person_id FROM set_r
        EXCEPT
     SELECT person_id FROM set_s)
    UNION
    (SELECT person_id FROM set_s
        EXCEPT
     SELECT person_id FROM set_r)
    ORDER BY person_id;
