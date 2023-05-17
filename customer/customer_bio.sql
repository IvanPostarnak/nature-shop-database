DROP TABLE IF EXISTS customer_bio;

CREATE TABLE customer_bio
(
	customer_bio_id INTEGER GENERATED ALWAYS AS IDENTITY,
  customer_id INTEGER NOT NULL,
  age INTEGER,
  birth_date DATE,
  gender_id INTEGER NOT NULL,
  family_status_id INTEGER,
  has_children BOOLEAN,
  language_id INTEGER NOT NULL DEFAULT 1,
  
	CONSTRAINT pk_customer_bio_customer_bio_id PRIMARY KEY (customer_bio_id),
  CONSTRAINT chk_customer_bio_age CHECK (age > 18),
  CONSTRAINT unq_customer_bio_customer_id UNIQUE (customer_id),
  CONSTRAINT fk_customer_bio_customer_id_customer_customer_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  CONSTRAINT fk_customer_bio_gender_id_gender_gender_id FOREIGN KEY (gender_id) REFERENCES gender(gender_id),
  CONSTRAINT fk_customer_bio_family_status_id_family_status_family_status_id FOREIGN KEY (family_status_id) REFERENCES family_status(family_status_id),
  CONSTRAINT fk_customer_bio_language_id_language_language_id FOREIGN KEY (language_id) REFERENCES language(language_id)
);

INSERT INTO customer_bio(customer_id, age, birth_date, gender_id, family_status_id, has_children, language_id)
     VALUES (1, 55, '10-07-2023', 2, 2, TRUE, 2),
            (2, 23, '23-12-2023', 2, 2, FALSE, 3),
            (3, 21, '14-02-2023', 3, 1, FALSE, 1),
            (4, 80, '25-09-2023', 2, 8, FALSE, 1),
            (5, 83, '10-07-2023', 2, 2, FALSE, 2),
            (6, 55, '23-12-2023', 2, 2, TRUE, 3),
            (7, 23, '23-12-2023', 2, 2, FALSE, 3),
            (8, 21, '14-02-2023', 3, 1, FALSE, 1),
            (9, 80, '25-09-2023', 2, 8, FALSE, 1),
            (10, 23, '23-12-2023', 2, 2, FALSE, 3),
            (11, 21, '14-02-2023', 3, 1, FALSE, 1),
            (12, 80, '25-09-2023', 2, 8, FALSE, 1),
            (13, 83, '10-07-2023', 2, 2, FALSE, 2),
            (14, 55, '23-12-2023', 2, 2, TRUE, 3),
            (15, 23, '23-12-2023', 2, 2, FALSE, 3),
            (16, 83, '10-07-2023', 2, 2, FALSE, 2),
            (17, 55, '23-12-2023', 2, 2, TRUE, 3),
            (18, 23, '23-12-2023', 2, 2, FALSE, 3),
            (19, 21, '14-02-2023', 3, 1, FALSE, 1),
            (20, 80, '25-09-2023', 2, 8, FALSE, 1);

SELECT *
  FROM customer_bio;