DROP TABLE IF EXISTS employee_payment;

CREATE TABLE employee_payment
(
	employee_payment_id INTEGER GENERATED ALWAYS AS IDENTITY,
  employee_id INTEGER NOT NULL,
  currency_id INTEGER NOT NULL DEFAULT 1,
  salary_mod REAL NOT NULL DEFAULT 1,
  bonus_mod REAL NOT NULL DEFAULT 1,
  account_num TEXT NOT NULL,
  tax_account_num TEXT NOT NULL,
    
	CONSTRAINT pk_employee_payment_employee_payment_id PRIMARY KEY (employee_payment_id),
  CONSTRAINT unq_employee_payment_employee_id UNIQUE (employee_id),
  CONSTRAINT unq_employee_payment_account_num UNIQUE (account_num),
  CONSTRAINT unq_employee_payment_tax_account_num UNIQUE (tax_account_num),
  CONSTRAINT chk_employee_payment_salary_mod CHECK (salary_mod > 0),
  CONSTRAINT chk_employee_payment_bonus_mod CHECK (bonus_mod > 0),
  CONSTRAINT chk_employee_payment_account_num_tax_account_num CHECK (account_num != tax_account_num),
  CONSTRAINT fk_employee_payment_employee_id_employee_employee_id FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
  CONSTRAINT fk_employee_payment_currency_id_currency_currency_id FOREIGN KEY (currency_id) REFERENCES currency(currency_id)
);

INSERT INTO employee_payment(employee_id, account_num, tax_account_num)
     VALUES (1, '12831982647619461', '1283198264761123'),
            (2, '12831982647619462', '1283198264761124'),
            (3, '12831982647619463', '1283198264761125'),
            (4, '12831982647619464', '1283198264761126');

SELECT *
  FROM employee_payment;