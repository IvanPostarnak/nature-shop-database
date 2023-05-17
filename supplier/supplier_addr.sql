DROP TABLE IF EXISTS supplier_addr;

CREATE TABLE supplier_addr
(
	supplier_addr_id INTEGER GENERATED ALWAYS AS IDENTITY,
  supplier_id INTEGER NOT NULL,
  country_id INTEGER NOT NULL,
  region TEXT,
  city_id INTEGER NOT NULL,
  
	CONSTRAINT pk_supplier_addr_supplier_addr_id PRIMARY KEY (supplier_addr_id),
  CONSTRAINT unq_supplier_addr_supplier_id UNIQUE (supplier_id),
  CONSTRAINT fk_supplier_addr_supplier_id_supplier_supplier_id FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id),
  CONSTRAINT fk_supplier_addr_country_id_country_country_id FOREIGN KEY (country_id) REFERENCES country(country_id),
  CONSTRAINT fk_supplier_addr_city_id_city_city_id FOREIGN KEY (city_id) REFERENCES city(city_id)
);

INSERT INTO supplier_addr(supplier_id, country_id, city_id)
     VALUES (1, 2, 2),
            (2, 1, 1);

SELECT *
  FROM supplier_addr;