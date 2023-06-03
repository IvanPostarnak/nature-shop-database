DROP TABLE IF EXISTS employee_contacts;

CREATE TABLE employee_contacts
(
	employee_contacts_id INTEGER GENERATED ALWAYS AS IDENTITY,
  employee_id INTEGER NOT NULL,
  phone TEXT,
  email TEXT,
  emergency_phone TEXT,
  
	CONSTRAINT pk_employee_contacts_employee_contacts_id PRIMARY KEY (employee_contacts_id),
  CONSTRAINT unq_employee_contacts_employee_id UNIQUE (employee_id),
  CONSTRAINT unq_employee_contacts_phone UNIQUE (phone),
  CONSTRAINT unq_employee_contacts_email UNIQUE (email),
  CONSTRAINT chk_employee_contacts_phone CHECK (phone != ''),
  CONSTRAINT chk_employee_contacts_email CHECK (email != ''),
  CONSTRAINT chk_employee_contacts_emergency_phone CHECK (emergency_phone != '')
);

INSERT INTO employee_contacts(employee_id, phone, email)
     VALUES (1, '8(983)320-45-15', 'fitohall@yandex.ru'),
            (2, '+7(778)653-28-15', 'ivan.postarnak@yandex.ru'),
            (3, '5641328734', 'kissygirl@gmail.com'),
            (4, '4569137542', 'greatman@email.ru');

SELECT *
  FROM employee_contacts;