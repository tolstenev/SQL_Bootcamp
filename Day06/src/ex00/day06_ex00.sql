CREATE TABLE person_discounts
(
    id          bigint PRIMARY KEY,
    pizzeria_id bigint,
    person_id   bigint,
    discount    numeric,
    CONSTRAINT fk_person_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria (id),
    CONSTRAINT fk_person_discounts_person_id FOREIGN KEY (person_id) REFERENCES person (id)
);