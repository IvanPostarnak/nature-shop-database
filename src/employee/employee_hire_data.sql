DROP TABLE IF EXISTS employee_hire_data;

CREATE TABLE employee_hire_data
(
	employee_hire_data_id INTEGER GENERATED ALWAYS AS IDENTITY,
  employee_id INTEGER NOT NULL,
  hire_date DATE NOT NULL,
  prev_promotion_date DATE,
  next_promotion_date DATE,
  termination_date DATE,
  
	CONSTRAINT pk_employee_hire_data_employee_hire_data_id PRIMARY KEY (employee_hire_data_id),
  CONSTRAINT unq_employee_hire_data_employee_id UNIQUE (employee_id),
  CONSTRAINT chk_employee_hire_data_hire_date_prev_promotion_date CHECK (hire_date <= prev_promotion_date),
  CONSTRAINT chk_employee_hire_data_hire_date_next_promotion_date CHECK (hire_date < next_promotion_date),
  CONSTRAINT chk_employee_hire_data_hire_date_termination_date CHECK (hire_date <= termination_date)
);

INSERT INTO employee_hire_data(employee_id, hire_date, termination_date)
     VALUES (1, '10-09-2022', '10-10-2030'),
            (2, '25-04-2023', '23-05-2031'),
            (3, '18-02-2018', NULL),
            (4, '13-07-2020', '15-11-2028');

SELECT *
  FROM employee_hire_data;