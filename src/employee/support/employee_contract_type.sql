DROP TABLE IF EXISTS employee_contract_type;

CREATE TABLE employee_contract_type
(
	employee_contract_type_id INTEGER GENERATED ALWAYS AS IDENTITY,
  contract_type TEXT NOT NULL,
  description TEXT,
  
	CONSTRAINT pk_employee_contract_type_employee_contract_type_id PRIMARY KEY (employee_contract_type_id),
  CONSTRAINT unq_employee_contract_type_contract_type UNIQUE (contract_type),
  CONSTRAINT unq_employee_contract_type_description UNIQUE (description),
  CONSTRAINT chk_employee_contract_type_contract_type CHECK (contract_type != ''),
  CONSTRAINT chk_employee_contract_type_description CHECK (description != '')
);

INSERT INTO employee_contract_type(contract_type, description)
     VALUES ('Full-time', 'Full-time - The individual is employed or engaged in a position where they work the standard or designated hours for that role.'),
            ('Part-time', 'Part-time - The individual is employed or engaged in a position where they work fewer hours than a full-time employee.'),
            ('Temporary', 'Temporary - The individual is hired or engaged for a specific period of time to fulfill a temporary need or cover a temporary vacancy.'),
            ('Contract', 'Contract - The individual is engaged in a work arrangement based on a formal contract that outlines the terms and conditions of their employment or services.'),
            ('Freelance', 'Freelance - The individual works independently, offering their services to multiple clients or companies on a project-by-project basis.'),
            ('Internship', 'Internship - The individual is engaged in a temporary work experience that provides practical training and learning opportunities within a specific field or industry.'),
            ('Seasonal', 'Seasonal - The individual is employed or engaged for a specific season or period of the year when there is a higher demand for certain products or services.'),
            ('Project-based', 'Project-based - The individual is hired or engaged to work on a specific project or assignment, usually with a defined scope and timeline.'),
            ('Volunteer', 'Volunteer - The individual provides their services or assistance willingly and without financial compensation, often for charitable or community-based organizations.'),
            ('Apprentice', 'Apprentice - The individual is undergoing a period of training and learning in a skilled trade or profession under the guidance of an experienced practitioner.');

SELECT *
  FROM employee_contract_type;