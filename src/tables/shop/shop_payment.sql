DROP TABLE IF EXISTS shop_payment;

CREATE TABLE shop_payment
(
	shop_payment_id INTEGER GENERATED ALWAYS AS IDENTITY,
  shop_id INTEGER NOT NULL,
  salary_mod REAL NOT NULL DEFAULT 1,
  bonus_mod REAL NOT NULL DEFAULT 1,
  salary_day INTEGER NOT NULL,
  collection_day INTEGER NOT NULL,
  
	CONSTRAINT pk_shop_payment_shop_payment_id PRIMARY KEY (shop_payment_id),
  CONSTRAINT unq_shop_payment_shop_id UNIQUE (shop_id),
  CONSTRAINT fk_shop_payment_shop_id_shop_shop_id FOREIGN KEY (shop_id) REFERENCES shop(shop_id)
);

INSERT INTO shop_payment(shop_id, salary_day, collection_day)
     VALUES (1, 15, 17),
            (2, 16, 20);

SELECT *
  FROM shop_payment;