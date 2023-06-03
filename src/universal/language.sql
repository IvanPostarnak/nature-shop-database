DROP TABLE IF EXISTS language;

CREATE TABLE language
(
	language_id INTEGER GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  name_native TEXT NOT NULL,
  code VARCHAR(2) NOT NULL,
  
	CONSTRAINT pk_language_language_id PRIMARY KEY (language_id),
  CONSTRAINT unq_language_name UNIQUE (name),
  CONSTRAINT unq_language_name_native UNIQUE (name_native),
  CONSTRAINT unq_language_code UNIQUE (code),
  CONSTRAINT chk_language_name CHECK (name != ''),
  CONSTRAINT chk_language_name_native CHECK (name_native != ''),
  CONSTRAINT chk_language_code CHECK (code != '')
);

INSERT INTO language(name, name_native, code)
     VALUES ('English', 'English', 'en'),
            ('Russian', 'Русский', 'ru'),
            ('Kazakh', 'Қазақша', 'kk'),
            ('Ukrainian', 'Українська', 'uk');

SELECT *
  FROM language;