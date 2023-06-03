DROP TABLE IF EXISTS shop_renter;

CREATE TABLE shop_renter
(
	shop_renter_id INTEGER GENERATED ALWAYS AS IDENTITY,
  shop_id INTEGER NOT NULL,
  name TEXT,
  contact_name TEXT,
  contact_phone TEXT,
  contact_email TEXT,
  rent_start_date DATE,
  rent_termintaion_date DATE,
  payment_day INTEGER,
  payment_account TEXT,
  payment_sum REAL,
  currency_id INTEGER,
  
	CONSTRAINT pk_shop_renter_shop_renter_id PRIMARY KEY (shop_renter_id),
  CONSTRAINT unq_shop_renter_shop_id UNIQUE (shop_id),
  CONSTRAINT chk_shop_renter_rent_start_date_rent_termination_date CHECK (rent_start_date < rent_termintaion_date),
  CONSTRAINT chk_shop_renter_payment_sum CHECK (payment_sum >= 0),
  CONSTRAINT chk_shop_renter_payment_day CHECK (payment_day BETWEEN 1 AND 31),
  CONSTRAINT fk_shop_renter_shop_id_shop_shop_id FOREIGN KEY (shop_id) REFERENCES shop(shop_id),
  CONSTRAINT fk_shop_renter_currency_id_currency_currency_id FOREIGN KEY (currency_id) REFERENCES currency(currency_id)
);

INSERT INTO shop_renter(shop_id, name, contact_name, contact_phone, contact_email, rent_start_date, rent_termintaion_date, payment_day, payment_account, payment_sum, currency_id)
     VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
            (2, 'Renter Company', 'Jim Gordon', '8(478)984-31-12', 'touchme@yandex.ru', '24-10-2020', '24-10-2025', 18, '123876187263481', 5324.0, 1);

SELECT *
  FROM shop_renter;