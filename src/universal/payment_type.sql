DROP TABLE IF EXISTS payment_type;

CREATE TABLE payment_type
(
	payment_type_id INTEGER GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  
	CONSTRAINT pk_payment_type_payment_type_id PRIMARY KEY (payment_type_id),
  CONSTRAINT unq_payment_type_name UNIQUE (name),
  CONSTRAINT chk_payment_type_name CHECK (name != '')
);

INSERT INTO payment_type(name)
     VALUES ('Combine'),
            ('Cash'),
            ('Card');

SELECT *
  FROM payment_type;