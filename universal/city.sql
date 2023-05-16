DROP TABLE IF EXISTS city;

CREATE TABLE city
(
	city_id INTEGER GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  country_id INTEGER NOT NULL,
  population_mil REAL,
  tel_area_code VARCHAR(8)[],
  time_delta INTEGER DEFAULT 0,
  
	CONSTRAINT pk_city_city_id PRIMARY KEY (city_id),
  CONSTRAINT unq_city_name UNIQUE (name),
  CONSTRAINT unq_city_tel_area_code UNIQUE (tel_area_code),
  CONSTRAINT chk_city_name CHECK (name != ''),
  CONSTRAINT chk_city_tel_area_code CHECK (array_length(tel_area_code, 1) > 0),
  CONSTRAINT chk_city_population_mil CHECK (population_mil > 0)
);

INSERT INTO city(name, country_id, population_mil, tel_area_code, time_delta)
     VALUES ('Washington', 1, 1, ARRAY['+1 202'], -4),
            ('Moscow', 2, 50.1, ARRAY['8 499', '8 498', '8 495'], 3),
            ('Astana', 3, 45.7, ARRAY['+7 7172'], 6),
            ('Kiev', 4, 19.4, ARRAY['+380 44'], 2);

ALTER TABLE city
ADD CONSTRAINT fk_country_id_country_country_id FOREIGN KEY (country_id) REFERENCES country(country_id);

SELECT *
  FROM city;