DROP TABLE IF EXISTS gender;

CREATE TABLE gender
(
	gender_id INTEGER GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  
	CONSTRAINT pk_gender_gender_id PRIMARY KEY (gender_id),
  CONSTRAINT unq_gender_name UNIQUE (name),
  CONSTRAINT chk_gender_name CHECK (name != '')
);

INSERT INTO gender(name)
     VALUES ('Any'),
            ('Male'),
            ('Female');

SELECT *
  FROM gender;