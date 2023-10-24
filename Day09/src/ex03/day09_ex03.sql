DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit CASCADE;
DROP FUNCTION IF EXISTS fnc_trg_person_update_audit CASCADE;
DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit CASCADE;

DROP TRIGGER IF EXISTS trg_person_insert_audit ON person_audit CASCADE;
DROP TRIGGER IF EXISTS trg_person_update_audit ON person_audit CASCADE;
DROP TRIGGER IF EXISTS trg_person_delete_audit ON person_audit CASCADE;

TRUNCATE TABLE person_audit;

CREATE OR REPLACE FUNCTION fnc_trg_person_audit() RETURNS TRIGGER AS $$
    BEGIN
        IF (TG_OP = 'DELETE') THEN
            INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
            VALUES (CURRENT_TIMESTAMP, 'D', OLD."id", OLD."name", OLD."age", OLD."gender", OLD."address");
            RETURN OLD;
        ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
            VALUES (CURRENT_TIMESTAMP, 'U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
            RETURN OLD;
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
            VALUES (CURRENT_TIMESTAMP, 'I', NEW."id", NEW."name", NEW."age", NEW."gender", NEW."address");
            RETURN NEW;
        END IF;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit
AFTER INSERT OR UPDATE OR DELETE ON person
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_audit();


-- SQL-Statements for check
INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');

UPDATE person
SET name = 'Bulat'
WHERE id = 10;

UPDATE person
SET name = 'Damir'
WHERE id = 10;

DELETE
FROM person
WHERE id = 10;





















