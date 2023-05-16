DROP TABLE IF EXISTS exchange_rate;

CREATE TABLE exchange_rate
(
	exchange_rate_id INTEGER GENERATED ALWAYS AS IDENTITY,
  currency_from INTEGER NOT NULL,
  currency_to INTEGER NOT NULL,
  current_rate REAL NOT NULL,
  previous_rate REAL NOT NULL,
  update_ts TIMESTAMP NOT NULL DEFAULT NOW(),
  default_rate REAL NOT NULL,
  min_rate REAL NOT NULL,
  max_rate REAL NOT NULL,

  CONSTRAINT pk_exchange_rate_exchange_rate_id PRIMARY KEY (exchange_rate_id),
  CONSTRAINT unq_exchange_rate_currency_from_currency_to UNIQUE (currency_from, currency_to),
  CONSTRAINT fk_exchange_rate_currency_from_currency_currency_id FOREIGN KEY (currency_from) REFERENCES currency(currency_id),
  CONSTRAINT fk_exchange_rate_currency_to_currency_currency_id FOREIGN KEY (currency_to) REFERENCES currency(currency_id),
  CONSTRAINT chk_exchange_rate_currency_from_currency_to CHECK (currency_from != currency_to),
  CONSTRAINT chk_exchange_rate_min_rate CHECK (min_rate > 0),
  CONSTRAINT chk_exchange_rate_min_rate_max_rate CHECK (max_rate > min_rate),
  CONSTRAINT chk_exchange_rate_default_rate CHECK (default_rate > min_rate AND default_rate < max_rate),
  CONSTRAINT chk_exchange_rate_current_rate CHECK (current_rate > min_rate AND current_rate < max_rate),
  CONSTRAINT chk_exchange_rate_previous_rate CHECK (previous_rate > min_rate AND previous_rate < max_rate)
);

INSERT INTO exchange_rate(currency_from, currency_to, current_rate, previous_rate, default_rate, min_rate, max_rate)
     VALUES (1, 2, 81.49, 81.48, 80, 70, 100),
            (1, 3, 455.55, 455.54, 450, 400, 650),
            (1, 4, 36.67, 36.65, 36, 30, 70);

SELECT *
  FROM exchange_rate;