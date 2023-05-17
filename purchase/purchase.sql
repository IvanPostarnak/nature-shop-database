DROP TABLE IF EXISTS purchase;

CREATE TABLE purchase
(
	purchase_id INTEGER GENERATED ALWAYS AS IDENTITY,
  customer_id INTEGER NOT NULL,
  employee_id INTEGER NOT NULL,
  shop_id INTEGER NOT NULL,
  date DATE NOT NULL DEFAULT NOW(),
  time TIME NOT NULL DEFAULT NOW(),
  
	CONSTRAINT pk_purchase_purchase_id PRIMARY KEY (purchase_id),
  CONSTRAINT fk_purchase_customer_id_customer_customer_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  CONSTRAINT fk_purchase_employee_id_employee_employee_id FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
  CONSTRAINT fk_purchase_shop_id_shop_shop_id FOREIGN KEY (shop_id) REFERENCES shop(shop_id)
);

-- INSERT INTO purchase()
--      VALUES (),
--             (),
--             ();

SELECT *
  FROM purchase;