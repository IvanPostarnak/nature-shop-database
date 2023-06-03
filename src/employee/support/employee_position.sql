DROP TABLE IF EXISTS employee_position;

CREATE TABLE employee_position
(
	employee_position_id INTEGER GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  salary_mod REAL NOT NULL,
  bonus_mod REAL NOT NULL,
  superior_id INTEGER,
  
	CONSTRAINT pk_employee_position_employee_position_id PRIMARY KEY (employee_position_id),
  CONSTRAINT unq_employee_position_name UNIQUE (name),
  CONSTRAINT unq_employee_position_description UNIQUE (description),
  CONSTRAINT chk_employee_position_name CHECK (name != ''),
  CONSTRAINT chk_employee_position_description CHECK (description != ''),
  CONSTRAINT chk_employee_position_salary_mod CHECK (salary_mod > 0),
  CONSTRAINT chk_employee_position_bonus_mod CHECK (bonus_mod > 0),
  CONSTRAINT sfk_superior_id_employee_position_employee_position_id FOREIGN KEY (superior_id) REFERENCES employee_position(employee_position_id)
);

INSERT INTO employee_position(name, description, salary_mod, bonus_mod, superior_id)
     VALUES ('CEO (Chief Executive Officer)', 'CEO (Chief Executive Officer) - The highest-ranking executive in a company, responsible for making major corporate decisions and managing overall operations.', 36, 36, NULL),
            ('COO (Chief Operating Officer)', 'COO (Chief Operating Officer) - The senior executive responsible for overseeing the day-to-day operations and ensuring the smooth functioning of the organization.', 32, 32, 1),
            ('CTO (Chief Technology Officer)', 'CTO (Chief Technology Officer) - The executive in charge of the company''s technological and IT strategies, responsible for driving innovation and managing technology-related operations.', 32, 32, 1),
            ('CMO (Chief Marketing Officer)', 'CMO (Chief Marketing Officer) - The executive responsible for developing and implementing the company''s marketing strategies to promote its products or services and drive business growth.', 32, 32, 1),
            ('CIO (Chief Information Officer)', 'CIO (Chief Information Officer) - The executive responsible for managing the company''s information technology systems and ensuring the efficient use of technology to achieve business objectives.', 32, 32, 1),
            ('HR Manager', 'HR Manager - The professional responsible for managing the company''s human resources, including recruitment, employee relations, training, and performance management.', 28, 22, 2),
            ('Shop Administrator', 'Shop Administrator - The person responsible for overseeing the administrative functions of a shop, including inventory management, scheduling, and customer service coordination.', 24, 16, 2),
            ('Shop Sales Manager', 'Shop Sales Manager - The individual responsible for managing the sales team in a shop, setting sales targets, and implementing strategies to drive sales and achieve revenue goals.', 18, 10, 7),
            ('Shop Sales Consultant', 'Shop Sales Consultant - The sales professional who provides expert advice and assistance to customers, helping them find suitable products and making sales within the shop.', 12, 4, 8),
            ('Shop Cashier Consultant', 'Shop Cashier Consultant - The individual responsible for processing sales transactions, handling cash, and providing excellent customer service at the shop''s cashier counter.', 12, 4, 8);

SELECT *
  FROM employee_position;