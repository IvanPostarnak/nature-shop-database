DROP TABLE IF EXISTS purchase_ship;

CREATE TABLE purchase_ship
(
	purchase_ship_id INTEGER GENERATED ALWAYS AS IDENTITY,
  purchase_id INTEGER NOT NULL,
  shipper_id INTEGER NOT NULL,
  invoice_num TEXT NOT NULL,
  shipping_type_id INTEGER NOT NULL,
  
	CONSTRAINT pk_purchase_ship_purchase_ship_id PRIMARY KEY (purchase_ship_id),
  CONSTRAINT unq_purchase_ship_purchase_id UNIQUE (purchase_id),
  CONSTRAINT unq_purchase_ship_invoice_num UNIQUE (invoice_num),
  CONSTRAINT fk_purchase_ship_purchase_id_purchase_purchase_id FOREIGN KEY (purchase_id) REFERENCES purchase(purchase_id),
  CONSTRAINT fk_purchase_ship_shipper_id_shipper_shipper_id FOREIGN KEY (shipper_id) REFERENCES shipper(shipper_id),
  CONSTRAINT fk_purchase_ship_shipping_type_id_shipping_type_shipping_type_id FOREIGN KEY (shipping_type_id) REFERENCES shipping_type(shipping_type_id)
);

-- INSERT INTO purchase_ship()
--      VALUES (),
--             (),
--             ();

SELECT *
  FROM purchase_ship;