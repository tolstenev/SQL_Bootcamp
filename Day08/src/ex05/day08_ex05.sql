-- Session #1
BEGIN TRANSACTION;
-- BEGIN

-- Session #2
BEGIN TRANSACTION;
-- BEGIN

-- Session #1
SELECT SUM(rating) FROM pizzeria;
--  sum
-- ------
--  21.9

-- Session #2
UPDATE pizzeria SET rating = 1.0 WHERE name = 'Pizza Hut';
-- UPDATE 1
COMMIT;
-- COMMIT

-- Session #1
SELECT SUM(rating) FROM pizzeria;
--  sum
-- ------
--  19.9
COMMIT;
-- COMMIT
SELECT SUM(rating) FROM pizzeria;
--  sum
-- ------
--  19.9

-- Session #2
SELECT SUM(rating) FROM pizzeria;
--  sum
-- ------
--  19.9