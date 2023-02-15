CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts USING btree (person_id, pizzeria_id);

SET ENABLE_SEQSCAN = OFF;

EXPLAIN ANALYZE
SELECT p.name  AS name,
       p2.name AS pizzeria_name,
       discount
FROM person_discounts
     JOIN person p ON p.id = person_discounts.person_id
     JOIN pizzeria p2 ON p2.id = person_discounts.pizzeria_id