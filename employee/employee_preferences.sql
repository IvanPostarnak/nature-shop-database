DROP TABLE IF EXISTS employee_preferences;

CREATE TABLE employee_preferences
(
	employee_preferences_id INTEGER GENERATED ALWAYS AS IDENTITY,
  employee_id INTEGER NOT NULL,
  color_schema_id INTEGER,
  language_id INTEGER,
  currency_id INTEGER,
  
	CONSTRAINT pk_employee_preferences_employee_preferences_id PRIMARY KEY (employee_preferences_id),
  CONSTRAINT unq_employee_preferences_employee_id UNIQUE (employee_id),
  CONSTRAINT fk_employee_preferences_employee_id_employee_employee_id FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
  CONSTRAINT fk_employee_preferences_color_schema_id_color_schema_color_schema_id FOREIGN KEY (color_schema_id) REFERENCES color_schema(color_schema_id),
  CONSTRAINT fk_employee_preferences_language_id_language_language_id FOREIGN KEY (language_id) REFERENCES language(language_id),
  CONSTRAINT fk_employee_preferences_currency_id_currency_currency_id FOREIGN KEY (currency_id) REFERENCES currency(currency_id)
);

INSERT INTO employee_preferences(employee_id, color_schema_id, language_id, currency_id)
     VALUES (1, NULL, NULL, NULL),
            (2, NULL, NULL, NULL),
            (3, NULL, NULL, NULL),
            (4, NULL, NULL, NULL);

SELECT *
  FROM employee_preferences;