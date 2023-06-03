DROP TABLE IF EXISTS currency;

CREATE TABLE currency
(
	currency_id INTEGER GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  abbr VARCHAR(3) NOT NULL,
  signature VARCHAR(2) NOT NULL,
  
	CONSTRAINT pk_currency_currency_id PRIMARY KEY (currency_id),
  CONSTRAINT unq_currency_name UNIQUE (name),
  CONSTRAINT unq_currency_abbr UNIQUE (abbr),
  CONSTRAINT unq_currency_signature UNIQUE (signature),
  CONSTRAINT chk_currency_name CHECK (name != ''),
  CONSTRAINT chk_currency_abbr CHECK (abbr != ''),
  CONSTRAINT chk_currency_signature CHECK (signature != '')
);

INSERT INTO currency(name, abbr, signature)
     VALUES ('Dollar US', 'USD', '$'),
            ('Ruble', 'RUB', '₽'),
            ('Tenge', 'KZT', '₸'),
            ('Hryvnia', 'UAH', '₴');

SELECT *
  FROM currency;