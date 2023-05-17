DROP TABLE IF EXISTS purchase_ship_addr;

CREATE TABLE purchase_ship_addr
(
	purchase_ship_addr_id INTEGER GENERATED ALWAYS AS IDENTITY,
  purchase_id INTEGER NOT NULL,
  country_id INTEGER NOT NULL,
  region TEXT,
  city_id INTEGER NOT NULL,
  street TEXT,
  building TEXT,
  appartment VARCHAR(8),
  floor INTEGER,
  entrance VARCHAR(8),
  has_fence BOOLEAN,
  postal_code VARCHAR(12),

	CONSTRAINT pk_purchase_ship_addr_purchase_ship_addr_id PRIMARY KEY (purchase_ship_addr_id),
  CONSTRAINT unq_purchase_ship_addr_purchase_id UNIQUE (purchase_id),
  CONSTRAINT chk_purchase_ship_addr_region CHECK (region != ''),
  CONSTRAINT chk_purchase_ship_addr_street CHECK (street != ''),
  CONSTRAINT chk_purchase_ship_addr_building CHECK (building != ''),
  CONSTRAINT chk_purchase_ship_addr_appartment CHECK (appartment != ''),
  CONSTRAINT chk_purchase_ship_addr_entrance CHECK (entrance != ''),
  CONSTRAINT chk_purchase_ship_addr_postal_code CHECK (postal_code != ''),
  CONSTRAINT fk_purchase_ship_addr_purchase_id_purchase_purchase_id FOREIGN KEY (purchase_id) REFERENCES purchase(purchase_id),
  CONSTRAINT fk_purchase_ship_addr_country_id_country_country_id FOREIGN KEY (country_id) REFERENCES country(country_id),
  CONSTRAINT fk_purchase_ship_addr_city_id_city_city_id FOREIGN KEY (city_id) REFERENCES city(city_id)
);

-- INSERT INTO purchase()
--      VALUES (),
--             (),
--             ();

SELECT *
  FROM purchase_ship_addr;