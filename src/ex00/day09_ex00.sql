DROP TABLE IF EXISTS person_audit;

CREATE TABLE person_audit
(
    created    timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    type_event char(1)     NOT NULL DEFAULT 'I',
    row_id     bigint      NOT NULL,
    name       varchar,
    age        integer,
    gender     varchar,
    address    varchar

        CONSTRAINT ch_type_event CHECK ( type_event IN ('I', 'U', 'D') )
);

DROP TRIGGER IF EXISTS trg_person_insert_audit ON person_audit;

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER
    AS $$BEGIN
        INSERT INTO person_audit (row_id, name, age, gender, address)
        SELECT *
        FROM person
        WHERE id = NEW.id;

        RETURN NEW;
    END;
    $$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
    AFTER INSERT ON person
    FOR EACH ROW
    EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person_audit (row_id, name, age, gender, address)
SELECT id, name, age, gender, address
FROM person
ORDER BY id;

-- SQL-Statement for check
-- INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
