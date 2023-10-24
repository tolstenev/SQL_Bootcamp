COMMENT ON TABLE person_discounts               IS 'Personal discounts for people from one side and pizzeria restaurants from other';
COMMENT ON COLUMN person_discounts.id           IS 'ID of a personal discount. A primary key.';
COMMENT ON COLUMN person_discounts.person_id    IS 'ID of a person. A not null column.';
COMMENT ON COLUMN person_discounts.pizzeria_id  IS 'ID of a pizzeria restaurant. A not null column.';
COMMENT ON COLUMN person_discounts.discount     IS 'The discount amount. Depends on the number of orders. 1 - 10.5%, 2 - 22%, 3 and more - 30%. By default, zero.';