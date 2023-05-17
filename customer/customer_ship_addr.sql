DROP TABLE IF EXISTS customer_ship_addr;

CREATE TABLE customer_ship_addr
(
	customer_ship_addr_id INTEGER GENERATED ALWAYS AS IDENTITY,
  customer_id INTEGER NOT NULL,
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

	CONSTRAINT pk_customer_ship_addr_customer_ship_addr_id PRIMARY KEY (customer_ship_addr_id),
  CONSTRAINT unq_customer_ship_addr_customer_id UNIQUE (customer_id),
  CONSTRAINT chk_customer_ship_addr_region CHECK (region != ''),
  CONSTRAINT chk_customer_ship_addr_street CHECK (street != ''),
  CONSTRAINT chk_customer_ship_addr_building CHECK (building != ''),
  CONSTRAINT chk_customer_ship_addr_appartment CHECK (appartment != ''),
  CONSTRAINT chk_customer_ship_addr_entrance CHECK (entrance != ''),
  CONSTRAINT chk_customer_ship_addr_postal_code CHECK (postal_code != ''),
  CONSTRAINT fk_customer_ship_addr_customer_id_customer_customer_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  CONSTRAINT fk_customer_ship_addr_country_id_country_country_id FOREIGN KEY (country_id) REFERENCES country(country_id),
  CONSTRAINT fk_customer_ship_addr_city_id_city_city_id FOREIGN KEY (city_id) REFERENCES city(city_id)
);

INSERT INTO customer_ship_addr(customer_id, country_id, city_id, street, building, appartment, floor, entrance, has_fence, postal_code)
     VALUES (1, 2, 2, 'Hytroin', '32', 141, 51, 'C', false, '33597'),
            (2, 3, 3, 'Agtyes', '124c', 101, 31, 'A', true, '58476'),
            (3, 1, 1, 'Bolshevistskaya', '45', 25, 6, 'B', true, '124005'),
            (4, 1, 1, 'Abai', '89a', 41, 10, '2', false, '940086'),
            (5, 2, 2, 'Hytroin', '32', 141, 51, 'C', false, '33597'),
            (6, 3, 3, 'Agtyes', '124c', 101, 31, 'A', true, '58476'),
            (7, 1, 1, 'Bolshevistskaya', '45', 25, 6, 'B', true, '124005'),
            (8, 1, 1, 'Abai', '89a', 41, 10, '2', false, '940086'),
            (9, 3, 3, 'Agtyes', '124c', 101, 31, 'A', true, '58476'),
            (10, 1, 1, 'Bolshevistskaya', '45', 25, 6, 'B', true, '124005'),
            (11, 1, 1, 'Abai', '89a', 41, 10, '2', false, '940086'),
            (12, 2, 2, 'Hytroin', '32', 141, 51, 'C', false, '33597'),
            (13, 3, 3, 'Agtyes', '124c', 101, 31, 'A', true, '58476'),
            (14, 1, 1, 'Bolshevistskaya', '45', 25, 6, 'B', true, '124005'),
            (15, 1, 1, 'Abai', '89a', 41, 10, '2', false, '940086'),
            (16, 1, 1, 'Bolshevistskaya', '45', 25, 6, 'B', true, '124005'),
            (17, 1, 1, 'Abai', '89a', 41, 10, '2', false, '940086'),
            (18, 3, 3, 'Agtyes', '124c', 101, 31, 'A', true, '58476'),
            (19, 1, 1, 'Bolshevistskaya', '45', 25, 6, 'B', true, '124005'),
            (20, 1, 1, 'Abai', '89a', 41, 10, '2', false, '940086');

SELECT *
  FROM customer_ship_addr;