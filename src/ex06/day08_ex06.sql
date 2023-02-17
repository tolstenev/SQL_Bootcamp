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
SELECT SUM(rating) FROM pizzeria;
--  sum
-- ------
--  19.9

-- Session #2
UPDATE pizzeria SET rating = 5.0 WHERE name = 'Pizza Hut';
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
--  23.9

-- Session #2
SELECT SUM(rating) FROM pizzeria;
--  sum
-- ------
--  23.9