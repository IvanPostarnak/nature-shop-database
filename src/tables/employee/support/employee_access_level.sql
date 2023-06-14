DROP TABLE IF EXISTS employee_access_level;

CREATE TABLE employee_access_level
(
	employee_access_level_id INTEGER GENERATED ALWAYS AS IDENTITY,
  level VARCHAR(3) NOT NULL,
  description TEXT,
  
	CONSTRAINT pk_employee_access_level_employee_access_level_id PRIMARY KEY (employee_access_level_id),
  CONSTRAINT unq_employee_access_level_level UNIQUE (level),
  CONSTRAINT unq_employee_access_level_description UNIQUE (description),
  CONSTRAINT chk_employee_access_level_level CHECK (level != ''),
  CONSTRAINT chk_employee_access_level_description CHECK (description != '')
);

INSERT INTO employee_access_level(level, description)
     VALUES ('AAA', 'AAA is the highest access level in the company');

SELECT *
  FROM employee_access_level;