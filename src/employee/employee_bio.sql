DROP TABLE IF EXISTS employee_bio;

CREATE TABLE employee_bio
(
	employee_bio_id INTEGER GENERATED ALWAYS AS IDENTITY,
  employee_id INTEGER NOT NULL,
  age INTEGER,
  birth_date DATE,
  gender_id INTEGER NOT NULL,
  family_status_id INTEGER,
  has_children BOOLEAN,
  language_id INTEGER NOT NULL DEFAULT 1,
  
	CONSTRAINT pk_employee_bio_employee_bio_id PRIMARY KEY (employee_bio_id),
  CONSTRAINT unq_employee_bio_employee_id UNIQUE (employee_id),
  CONSTRAINT chk_employee_bio_age CHECK (age > 18),
  CONSTRAINT fk_employee_bio_employee_id_employee_employee_id FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
  CONSTRAINT fk_employee_bio_gender_id_gender_gender_id FOREIGN KEY (gender_id) REFERENCES gender(gender_id),
  CONSTRAINT fk_employee_bio_family_status_id_family_status_family_status_id FOREIGN KEY (family_status_id) REFERENCES family_status(family_status_id),
  CONSTRAINT fk_employee_bio_language_id_language_language_id FOREIGN KEY (language_id) REFERENCES language(language_id)
);

INSERT INTO employee_bio(employee_id, age, birth_date, gender_id, family_status_id, has_children, language_id)
     VALUES (1, 55, '10-07-2023', 2, 2, TRUE, 2),
            (2, 23, '23-12-2023', 2, 2, FALSE, 3),
            (3, 21, '14-02-2023', 3, 1, TRUE, 1),
            (4, 98, '25-09-2023', 2, 8, FALSE, 1);

SELECT *
  FROM employee_bio;