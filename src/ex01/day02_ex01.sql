SELECT missing_date::date
FROM GENERATE_SERIES('2022-01-01'::date, '2022-01-10'::date, '1 day') missing_date
         LEFT JOIN (SELECT visit_date
                    FROM person_visits
                    WHERE person_id = 1
                       OR person_id = 2) AS visits_person_id_1_and_2
                   ON visits_person_id_1_and_2.visit_date = missing_date.missing_date
WHERE visit_date ISNULL
ORDER BY missing_date
;
