-- Session #1
BEGIN TRANSACTION;
-- BEGIN

-- Session #2
BEGIN TRANSACTION;
-- BEGIN

-- Session #1
UPDATE pizzeria SET rating = 5.0 WHERE id = 1;
-- UPDATE 1

-- Session #2
UPDATE pizzeria SET rating = 2.0 WHERE id = 2;
-- UPDATE 1

-- Session #1
UPDATE pizzeria SET rating = 3.0 WHERE id = 2;
-- UPDATE 1

-- Session #2
UPDATE pizzeria SET rating = 4.0 WHERE id = 1;
-- ERROR:  deadlock detected
-- DETAIL:  Process 1692 waits for ShareLock on transaction 2534; blocked by process 1667.
-- Process 1667 waits for ShareLock on transaction 2535; blocked by process 1692.
-- HINT:  See server log for query details.
-- CONTEXT:  while updating tuple (0,29) in relation "pizzeria"

-- Session #1
COMMIT;
-- COMMIT

-- Session #2
COMMIT;
-- ROLLBACK
