DROP TABLE IF EXISTS employee_status;

CREATE TABLE employee_status
(
	employee_status_id INTEGER GENERATED ALWAYS AS IDENTITY,
  status TEXT NOT NULL,
  description TEXT,
  
	CONSTRAINT pk_employee_status_employee_status_id PRIMARY KEY (employee_status_id),
  CONSTRAINT unq_employee_status_status UNIQUE (status),
  CONSTRAINT unq_employee_status_description UNIQUE (description),
  CONSTRAINT chk_employee_status_status CHECK (status != ''),
  CONSTRAINT chk_employee_status_description CHECK (description != '')
);

INSERT INTO employee_status(status, description)
     VALUES ('Active', 'Active - The individual is currently engaged and actively participating in their duties or responsibilities.'),
            ('On leave', 'On leave - The individual is temporarily away from their usual duties due to an approved leave of absence.'),
            ('On probation', 'On probation - The individual is undergoing a trial period or assessment to evaluate their performance or suitability for a specific role.'),
            ('Suspended', 'Suspended - The individual''s participation or privileges have been temporarily halted as a disciplinary action.'),
            ('Leave of absence', 'Leave of absence - The individual has been granted an approved period of time away from their usual responsibilities.'),
            ('Absent without leave', 'Absent without leave - The individual is not present and has not obtained prior permission or authorization for their absence.'),
            ('Inactive', 'Inactive - The individual is not currently participating or involved in their usual activities or responsibilities.');

SELECT *
  FROM employee_status;