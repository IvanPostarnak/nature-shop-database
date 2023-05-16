DROP TABLE IF EXISTS color_schema;

CREATE TABLE color_schema
(
	color_schema_id INTEGER GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  
	CONSTRAINT pk_color_schema_color_schema_id PRIMARY KEY (color_schema_id),
  CONSTRAINT unq_color_schema_name UNIQUE (name),
  CONSTRAINT chk_color_schema_name CHECK (name != '')
);

INSERT INTO color_schema(name)
     VALUES ('Light'),
            ('Dark'),
            ('Alternative');

SELECT *
  FROM color_schema;