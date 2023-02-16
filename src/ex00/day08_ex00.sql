-- Session #1
-- INPUT
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- OUTPUT
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |    4.6

-- Session #2
-- INPUT
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- OUTPUT
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |    4.6

-- Session #1
-- INPUT
START TRANSACTION;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- OUTPUT
-- START TRANSACTION
-- UPDATE 1
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |      5

-- Session #2
-- INPUT
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- OUTPUT
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |    4.6