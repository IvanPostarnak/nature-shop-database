DROP TABLE IF EXISTS employee_state;

CREATE TABLE employee_state
(
	employee_state_id INTEGER GENERATED ALWAYS AS IDENTITY,
  employee_id INTEGER NOT NULL,
  position_id INTEGER NOT NULL,
  contract_type_id INTEGER NOT NULL DEFAULT 1,
  status_id INTEGER NOT NULL DEFAULT 1,
  access_level_id INTEGER NOT NULL,
  
	CONSTRAINT pk_employee_state_employee_state_id PRIMARY KEY (employee_state_id),
  CONSTRAINT unq_employee_state_employee_id UNIQUE (employee_id),
  CONSTRAINT fk_employee_state_employee_id_employee_employee_id FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
  CONSTRAINT fk_employee_state_position_id_employee_position_employee_position_id FOREIGN KEY (position_id) REFERENCES employee_position(employee_position_id),
  CONSTRAINT fk_employee_state_contract_type_id_employee_contract_type_employee_contract_type_id FOREIGN KEY (contract_type_id) REFERENCES employee_contract_type(employee_contract_type_id),
  CONSTRAINT fk_employee_state_status_id_employee_status_employee_status_id FOREIGN KEY (status_id) REFERENCES employee_status(employee_status_id),
  CONSTRAINT fk_employee_state_access_level_id_employee_access_level_employee_access_level_id FOREIGN KEY (access_level_id) REFERENCES employee_access_level(employee_access_level_id)
);

INSERT INTO employee_state(employee_id, position_id, contract_type_id, status_id, access_level_id)
     VALUES (1, 1, 1, 1, 1),
            (2, 5, 8, 3, 1),
            (3, 7, 9, 4, 1),
            (4, 8, 6, 7, 1);

SELECT *
  FROM employee_state;