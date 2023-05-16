DROP TABLE IF EXISTS shop_statistics;

CREATE TABLE shop_statistics
(
	shop_statistics_id INTEGER GENERATED ALWAYS AS IDENTITY,
  shop_id INTEGER NOT NULL,
  income_total REAL NOT NULL DEFAULT 0.0,
  purchase_total INTEGER NOT NULL DEFAULT 0,
  
	CONSTRAINT pk_shop_statistics_shop_statistics_id PRIMARY KEY (shop_statistics_id),
  CONSTRAINT unq_shop_statistics_shop_id UNIQUE (shop_id),
  CONSTRAINT chk_shop_statistics_income_total CHECK (income_total >= 0),
  CONSTRAINT chk_shop_statistics_purchase_total CHECK (purchase_total >= 0),
  CONSTRAINT fk_shop_statistics_shop_id_shop_shop_id FOREIGN KEY (shop_id) REFERENCES shop(shop_id)
);

INSERT INTO shop_statistics(shop_id)
     VALUES (1),
            (2);

SELECT *
  FROM shop_statistics;