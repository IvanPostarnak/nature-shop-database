DROP TABLE IF EXISTS employee_shift;

CREATE TABLE employee_shift
(
	employee_shift_id INTEGER GENERATED ALWAYS AS IDENTITY,
  employee_id INTEGER NOT NULL,
  shop_id INTEGER NOT NULL,
  manager_id INTEGER,
  has_keys BOOLEAN NOT NULL,
  shift_start_time TIME NOT NULL,
  hours_per_day INTEGER NOT NULL,
  days_per_week INTEGER NOT NULL,
  
	CONSTRAINT pk_employee_shift_employee_shift_id PRIMARY KEY (employee_shift_id),
  CONSTRAINT unq_employee_shift_employee_id UNIQUE (employee_id),
  CONSTRAINT chk_employee_shift_hours_per_day CHECK (hours_per_day > 0 AND hours_per_day <= 16),
  CONSTRAINT chk_employee_shift_days_per_week CHECK (days_per_week > 0 AND days_per_week <= 6),
  CONSTRAINT chk_employee_shift_shift_start_time CHECK (shift_start_time >= '00:00:00' AND shift_start_time <= '23:59:59'),
  CONSTRAINT fk_employee_shift_employee_id_employee_employee_id FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
  CONSTRAINT fk_employee_shift_shop_id_shop_shop_id FOREIGN KEY (shop_id) REFERENCES shop(shop_id),
  CONSTRAINT fk_employee_shift_manager_id_employee_employee_id FOREIGN KEY (manager_id) REFERENCES employee(employee_id)
);

INSERT INTO employee_shift(employee_id, shop_id, manager_id, has_keys, shift_start_time, hours_per_day, days_per_week)
     VALUES (1, 1, NULL, TRUE, '8:00:00', 10, 5),
            (2, 1, 1, TRUE, '8:00:00', 10, 5),
            (3, 2, 2, TRUE, '8:00:00', 10, 5),
            (4, 2, 3, FALSE, '10:00:00', 8, 5);

SELECT *
  FROM employee_shift;