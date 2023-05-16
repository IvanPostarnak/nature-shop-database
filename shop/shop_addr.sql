DROP TABLE IF EXISTS shop_addr;

CREATE TABLE shop_addr
(
	shop_addr_id INTEGER GENERATED ALWAYS AS IDENTITY,
  shop_id INTEGER NOT NULL,
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
  
	CONSTRAINT pk_shop_addr_shop_addr_id PRIMARY KEY (shop_addr_id),
  CONSTRAINT unq_shop_addr_shop_id UNIQUE (shop_id),
  CONSTRAINT chk_shop_addr_region CHECK (region != ''),
  CONSTRAINT chk_shop_addr_street CHECK (street != ''),
  CONSTRAINT chk_shop_addr_building CHECK (building != ''),
  CONSTRAINT chk_shop_addr_appartment CHECK (appartment != ''),
  CONSTRAINT chk_shop_addr_entrance CHECK (entrance != ''),
  CONSTRAINT chk_shop_addr_postal_code CHECK (postal_code != ''),
  CONSTRAINT fk_shop_addr_shop_id_shop_shop_id FOREIGN KEY (shop_id) REFERENCES shop(shop_id),
  CONSTRAINT fk_shop_addr_country_id_country_country_id FOREIGN KEY (country_id) REFERENCES country(country_id),
  CONSTRAINT fk_shop_addr_city_id_city_city_id FOREIGN KEY (city_id) REFERENCES city(city_id)
);

INSERT INTO shop_addr(shop_id, country_id, city_id, street, building, appartment, floor, entrance, has_fence, postal_code)
     VALUES (1, 1, 1, 'Agtes', '152a', '56', 43, 'C', FALSE, '33597'),
            (2, 1, 1, 'Hytroin', '45', '89', 34, 'A', FALSE, '58476');

SELECT *
  FROM shop_addr;