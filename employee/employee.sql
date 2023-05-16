DROP TABLE IF EXISTS employee;

CREATE TABLE employee
(
	employee_id INTEGER GENERATED ALWAYS AS IDENTITY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  middle_name TEXT,
  
	CONSTRAINT pk_employee_employee_id PRIMARY KEY (employee_id),
  CONSTRAINT chk_employee_first_name CHECK (first_name != ''),
  CONSTRAINT chk_employee_last_name CHECK (last_name != ''),
  CONSTRAINT chk_employee_middle_name CHECK (middle_name != '')
);

INSERT INTO employee(first_name, last_name, middle_name)
     VALUES ('Andrew', 'Postarnak', NULL),
            ('Ivan', 'Postarnak', NULL),
            ('Ann', 'Hathaway', NULL),
            ('Morgan', 'Freeman', NULL);

SELECT *
  FROM employee;