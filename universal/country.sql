DROP TABLE IF EXISTS country;

CREATE TABLE country
(
	country_id INTEGER GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  capital_city_id INTEGER NOT NULL,
  continent TEXT NOT NULL,
  population_mil REAL,
  language_id INTEGER NOT NULL,
  currency_id INTEGER NOT NULL,
  
	CONSTRAINT pk_country_country_id PRIMARY KEY (country_id),
  CONSTRAINT unq_country_name UNIQUE (name),
  CONSTRAINT unq_country_capital_city_id UNIQUE (capital_city_id),
  CONSTRAINT chk_country_continent CHECK (continent IN ('Africa', 'Antarctica', 'Asia', 'Europe', 'North America', 'Australia (Oceania)', 'South America')),
  CONSTRAINT chk_country_population_mil CHECK (population_mil > 0),
  CONSTRAINT fk_language_id_language_language_id FOREIGN KEY (language_id) REFERENCES language(language_id),
  CONSTRAINT fk_currency_id_currency_currency_id FOREIGN KEY (currency_id) REFERENCES currency(currency_id)
);

INSERT INTO country(name, capital_city_id, continent, population_mil, language_id, currency_id)
     VALUES ('USA', 1, 'North America', 333.287, 1, 1),
            ('Russia', 2, 'Asia', 120.0, 2, 2),
            ('Kazakhstan', 3, 'Asia', 19.644, 3, 3),
            ('Ukraine', 4, 'Europe', 41.167, 4, 4);

ALTER TABLE country
ADD CONSTRAINT fk_capital_city_id_city_city_id FOREIGN KEY (capital_city_id) REFERENCES city(city_id);

SELECT *
  FROM country;