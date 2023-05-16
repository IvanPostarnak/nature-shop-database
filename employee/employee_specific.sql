DROP TABLE IF EXISTS employee_specific;

CREATE TABLE employee_specific
(
	employee_specific_id INTEGER GENERATED ALWAYS AS IDENTITY,
  employee_id INTEGER NOT NULL,
  has_kin_in_company BOOLEAN NOT NULL DEFAULT FALSE,
  
	CONSTRAINT pk_employee_specific_employee_specific_id PRIMARY KEY (employee_specific_id),
  CONSTRAINT unq_employee_specific_employee_id UNIQUE (employee_id),
  CONSTRAINT fk_employee_specific_employee_id_employee_employee_id FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

INSERT INTO employee_specific(employee_id, has_kin_in_company)
     VALUES (1, TRUE),
            (2, TRUE),
            (3, FALSE),
            (4, FALSE);

SELECT *
  FROM employee_specific;