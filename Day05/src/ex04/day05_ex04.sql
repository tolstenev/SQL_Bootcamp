CREATE UNIQUE INDEX idx_menu_unique ON menu USING btree (pizzeria_id, pizza_name);

SET ENABLE_SEQSCAN = OFF;

EXPLAIN ANALYZE
SELECT pizza_name
FROM menu;
