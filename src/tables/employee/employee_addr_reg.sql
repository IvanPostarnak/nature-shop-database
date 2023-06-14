DROP TABLE IF EXISTS employee_addr_reg;

CREATE TABLE employee_addr_reg
(
	employee_addr_reg_id INTEGER GENERATED ALWAYS AS IDENTITY,
  employee_id INTEGER NOT NULL,
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

	CONSTRAINT pk_employee_addr_reg_employee_addr_reg_id PRIMARY KEY (employee_addr_reg_id),
  CONSTRAINT unq_employee_addr_reg_employee_id UNIQUE (employee_id),
  CONSTRAINT chk_employee_addr_reg_region CHECK (region != ''),
  CONSTRAINT chk_employee_addr_reg_street CHECK (street != ''),
  CONSTRAINT chk_employee_addr_reg_building CHECK (building != ''),
  CONSTRAINT chk_employee_addr_reg_appartment CHECK (appartment != ''),
  CONSTRAINT chk_employee_addr_reg_entrance CHECK (entrance != ''),
  CONSTRAINT chk_employee_addr_reg_postal_code CHECK (postal_code != ''),
  CONSTRAINT fk_employee_addr_reg_employee_id_employee_employee_id FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
  CONSTRAINT fk_employee_addr_reg_country_id_country_country_id FOREIGN KEY (country_id) REFERENCES country(country_id),
  CONSTRAINT fk_employee_addr_reg_city_id_city_city_id FOREIGN KEY (city_id) REFERENCES city(city_id)
);

INSERT INTO employee_addr_reg(employee_id, country_id, city_id, street, building, appartment, floor, entrance, has_fence, postal_code)
     VALUES (1, 2, 2, 'Hytroin', '32', 141, 51, 'C', false, '33597'),
            (2, 3, 3, 'Agtyes', '124c', 101, 31, 'A', true, '58476'),
            (3, 1, 1, 'Bolshevistskaya', '45', 25, 6, 'B', true, '124005'),
            (4, 1, 1, 'Abai', '89a', 41, 10, '2', false, '940086');

SELECT *
  FROM employee_addr_reg;