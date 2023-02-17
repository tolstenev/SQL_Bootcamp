-- Session #1
BEGIN TRANSACTION;
-- BEGIN
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- SET

-- Session #2
BEGIN TRANSACTION;
-- BEGIN
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- SET

-- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |    3.6

-- Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |    3.6

-- Session #1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
-- UPDATE 1

-- Session #2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
------------Lost Update Anomaly is here------------------
-- ERROR:  could not serialize access due to concurrent update

-- Session #1
COMMIT;
-- COMMIT
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |      4

-- Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- ERROR:  current transaction is aborted, commands ignored until end of transaction block

-- Session #2
COMMIT;
-- ROLLBACK

-- Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |      4