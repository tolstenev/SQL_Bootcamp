CREATE INDEX idx_person_name ON person USING btree (upper("name"));

EXPLAIN ANALYZE
SELECT person.name
FROM person
WHERE upper(name) = 'ANNA'