DROP TABLE IF EXISTS shipper;

CREATE TABLE shipper
(
	shipper_id INTEGER GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  country_id INTEGER NOT NULL,
  
	CONSTRAINT pk_shipper_shipper_id PRIMARY KEY (shipper_id),
  CONSTRAINT unq_shipper_name_country_id UNIQUE (name, country_id),
  CONSTRAINT fk_shipper_country_id_country_country_id FOREIGN KEY (country_id) REFERENCES country(country_id)
);

INSERT INTO shipper(name, country_id)
     VALUES ('CDEK', 2);

SELECT *
  FROM shipper;