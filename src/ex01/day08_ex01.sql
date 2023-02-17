-- Session #1
BEGIN TRANSACTION;
-- BEGIN

-- Session #2
BEGIN TRANSACTION;
-- BEGIN

-- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--  id |   name    | rating 
-- ----+-----------+--------
--   1 | Pizza Hut |      5

-- Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |      5

-- Session #1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
-- UPDATE 1

-- Session #2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

-- Session #1
COMMIT;
-- COMMIT

-- Session #2
-- UPDATE 1

-- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--  id |   name    | rating 
-- ----+-----------+--------
--   1 | Pizza Hut |      4

-- Session #2
COMMIT;
-- COMMIT

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
