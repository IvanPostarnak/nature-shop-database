DROP TABLE IF EXISTS purchase_details;

CREATE TABLE purchase_details
(
	purchase_details_id INTEGER GENERATED ALWAYS AS IDENTITY,
  purchase_id INTEGER NOT NULL,
  products JSON NOT NULL,
  items_total INTEGER NOT NULL,
  unique_items INTEGER NOT NULL,
  bonus_value REAL,
  
	CONSTRAINT pk_purchase_details_purchase_details_id PRIMARY KEY (purchase_details_id),
  CONSTRAINT unq_purchase_details_purchase_id UNIQUE (purchase_id),
  CONSTRAINT chk_purchase_details_items_total CHECK (items_total > 0),
  CONSTRAINT chk_purchase_details_unique_items CHECK (unique_items > 0),
  CONSTRAINT chk_purchase_details_unique_items_items_total CHECK (unique_items <= items_total),
  CONSTRAINT chk_purchase_details_bonus_value CHECK (bonus_value >= 0),
  CONSTRAINT fk_purchase_details_purchase_id_purchase_purchase_id FOREIGN KEY (purchase_id) REFERENCES purchase(purchase_id)
);

-- INSERT INTO purchase_details()
--      VALUES (),
--             (),
--             ();

SELECT *
  FROM purchase_details;