DROP TABLE IF EXISTS shop;

CREATE TABLE shop
(
	shop_id INTEGER GENERATED ALWAYS AS IDENTITY,
  admin_id INTEGER NOT NULL,
  rating REAL,
  
	CONSTRAINT pk_shop_shop_id PRIMARY KEY (shop_id),
  CONSTRAINT fk_shop_admin_employee_id FOREIGN KEY (admin_id) REFERENCES employee(employee_id),
  CONSTRAINT chk_shop_rating CHECK (rating BETWEEN 0.0 AND 10.0)
);

INSERT INTO shop(admin_id)
     VALUES (1),
            (3);

SELECT *
  FROM shop;