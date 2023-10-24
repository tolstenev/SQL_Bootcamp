CREATE INDEX idx_person_name ON person USING btree (upper("name"));

SET ENABLE_SEQSCAN = OFF;

EXPLAIN ANALYZE
SELECT person.name
FROM person
WHERE upper(name) = 'IRINA'
