DROP TABLE IF EXISTS company;

CREATE TABLE company
(
	company_id INTEGER GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  abbr VARCHAR(12) NOT NULL,
  description TEXT,
  country_id INTEGER NOT NULL,
  
	CONSTRAINT pk_company_company_id PRIMARY KEY (company_id),
  CONSTRAINT unq_company_name UNIQUE (name),
  CONSTRAINT unq_company_abbr UNIQUE (abbr),
  CONSTRAINT unq_company_description UNIQUE (description),
  CONSTRAINT chk_company_name CHECK (name != ''),
  CONSTRAINT chk_company_abbr CHECK (abbr != ''),
  CONSTRAINT chk_company_description CHECK (description != ''),
  CONSTRAINT fk_company_country_id_country_country_id FOREIGN KEY (country_id) REFERENCES country(country_id)
);

INSERT INTO company(name, abbr, description, country_id)
     VALUES ('Nature''s Sunshine Company', 'NSP', 'High quality Dietary Supplements', 1),
            ('Personal Super Nature', 'PSN', 'Personal Super Nature', 1);

SELECT *
  FROM company;