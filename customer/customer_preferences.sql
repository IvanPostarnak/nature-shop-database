DROP TABLE IF EXISTS customer_preferences;

CREATE TABLE customer_preferences
(
	customer_preferences_id INTEGER GENERATED ALWAYS AS IDENTITY,
  customer_id INTEGER NOT NULL,
  color_schema_id INTEGER,
  language_id INTEGER,
  currency_id INTEGER,
  
	CONSTRAINT pk_customer_preferences_customer_preferences_id PRIMARY KEY (customer_preferences_id),
  CONSTRAINT unq_customer_preferences_customer_id UNIQUE (customer_id),
  CONSTRAINT fk_customer_preferences_customer_id_customer_customer_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  CONSTRAINT fk_customer_preferences_color_schema_id_color_schema_color_schema_id FOREIGN KEY (color_schema_id) REFERENCES color_schema(color_schema_id),
  CONSTRAINT fk_customer_preferences_language_id_language_language_id FOREIGN KEY (language_id) REFERENCES language(language_id),
  CONSTRAINT fk_customer_preferences_currency_id_currency_currency_id FOREIGN KEY (currency_id) REFERENCES currency(currency_id)
);

INSERT INTO customer_preferences(customer_id, color_schema_id, language_id, currency_id)
     VALUES (1, NULL, 1, 2),
            (2, NULL, 3, 3),
            (3, 2, NULL, NULL),
            (4, NULL, 2, NULL),
            (5, 1, NULL, NULL),
            (6, NULL, NULL, NULL),
            (7, NULL, NULL, 3),
            (8, NULL, 2, NULL),
            (9, 2, NULL, NULL),
            (10, NULL, NULL, NULL),
            (11, NULL, 2, NULL),
            (12, NULL, NULL, NULL),
            (13, NULL, 3, NULL),
            (14, 1, 3, 2),
            (15, NULL, NULL, NULL),
            (16, NULL, 1, 1),
            (17, 2, NULL, NULL),
            (18, NULL, NULL, NULL),
            (19, NULL, 1, 3),
            (20, NULL, NULL, NULL);

SELECT *
  FROM customer_preferences;