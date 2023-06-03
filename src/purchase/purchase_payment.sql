DROP TABLE IF EXISTS purchase_payment;

CREATE TABLE purchase_payment
(
	purchase_payment_id INTEGER GENERATED ALWAYS AS IDENTITY,
  purchase_id INTEGER NOT NULL,
  sum REAL NOT NULL,
  payment_type_id INTEGER NOT NULL,
  currency_id INTEGER NOT NULL,
  
	CONSTRAINT pk_purchase_payment_purchase_payment_id PRIMARY KEY (purchase_payment_id),
  CONSTRAINT unq_purchase_payment_purchase_id UNIQUE (purchase_id),
  CONSTRAINT chk_purchase_payment_sum CHECK (sum > 0),
  CONSTRAINT fk_purchase_payment_purchase_id_purchase_purchase_id FOREIGN KEY (purchase_id) REFERENCES purchase(purchase_id),
  CONSTRAINT fk_purchase_payment_payment_type_id_payment_type_payment_type_id FOREIGN KEY (payment_type_id) REFERENCES payment_type(payment_type_id),
  CONSTRAINT fk_purchase_payment_currency_id_currency_currency_id FOREIGN KEY (currency_id) REFERENCES currency(currency_id)
);

-- INSERT INTO purchase_payment()
--      VALUES (),
--             (),
--             ();

SELECT *
  FROM purchase_payment;