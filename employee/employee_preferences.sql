DROP TABLE IF EXISTS employee_preferences;

CREATE TABLE employee_preferences
(
	employee_preferences_id INTEGER GENERATED ALWAYS AS IDENTITY,
  employee_id INTEGER NOT NULL,
  color_schema_id INTEGER NOT NULL DEFAULT 1,
  language_id INTEGER NOT NULL DEFAULT 1,
  currency_id INTEGER NOT NULL DEFAULT 1,
  
	CONSTRAINT pk_employee_preferences_employee_preferences_id PRIMARY KEY (employee_preferences_id),
  CONSTRAINT unq_employee_preferences_employee_id UNIQUE (employee_id),
  CONSTRAINT fk_employee_preferences_employee_id_employee_employee_id FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
  CONSTRAINT fk_employee_preferences_color_schema_id_color_schema_color_schema_id FOREIGN KEY (color_schema_id) REFERENCES color_schema(color_schema_id),
  CONSTRAINT fk_employee_preferences_language_id_language_language_id FOREIGN KEY (language_id) REFERENCES language(language_id),
  CONSTRAINT fk_employee_preferences_currency_id_currency_currency_id FOREIGN KEY (currency_id) REFERENCES currency(currency_id)
);

INSERT INTO employee_preferences(employee_id)
     VALUES (1),
            (2),
            (3),
            (4);

SELECT *
  FROM employee_preferences;