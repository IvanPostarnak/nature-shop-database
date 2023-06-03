DROP TABLE IF EXISTS measure_unit;

CREATE TABLE measure_unit
(
	measure_unit_id INTEGER GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  abbr TEXT,
  
	CONSTRAINT pk_measure_unit_measure_unit_id PRIMARY KEY (measure_unit_id),
  CONSTRAINT unq_measure_unit_name UNIQUE (name),
  CONSTRAINT unq_measure_unit_abbr UNIQUE (abbr),
  CONSTRAINT chk_measure_unit_name CHECK (name != ''),
  CONSTRAINT chk_measure_unit_abbr CHECK (abbr != '')
);

INSERT INTO measure_unit(name, abbr)
VALUES ('milligrams', 'mg'),
       ('milliliters', 'ml'),
       ('pages', 'pg');

SELECT *
  FROM measure_unit;