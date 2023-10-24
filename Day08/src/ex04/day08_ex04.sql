-- Session #1
BEGIN TRANSACTION;
-- BEGIN
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- SET

-- Session #2
BEGIN TRANSACTION;
-- BEGIN
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- SET

-- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |    3.6

-- Session #2
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
-- UPDATE 1
COMMIT;
-- COMMIT

-- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |    3.6
COMMIT;
-- COMMIT
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |    3.0


-- Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |    3.0