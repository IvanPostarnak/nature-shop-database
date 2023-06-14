DROP TABLE IF EXISTS customer_outer_distr;

CREATE TABLE customer_outer_distr
(
	customer_outer_distr_id INTEGER GENERATED ALWAYS AS IDENTITY,
  customer_id INTEGER NOT NULL,
  company_id INTEGER NOT NULL,
  distr_id TEXT NOT NULL,
  sponsor_distr_id TEXT,
  
	CONSTRAINT pk_customer_outer_distr_customer_outer_distr_id PRIMARY KEY (customer_outer_distr_id),
  CONSTRAINT unq_customer_outer_distr_customer_id_company_id UNIQUE (customer_id, company_id),
  CONSTRAINT chl_customer_outer_distr_distr_id_sponsor_distr_id CHECK (distr_id != sponsor_distr_id),
  CONSTRAINT fk_customer_outer_distr_customer_id_customer_customer_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

INSERT INTO customer_outer_distr(customer_id, company_id, distr_id, sponsor_distr_id)
     VALUES (1, 1, '7345671', NULL),
            (2, 1, '7345698', NULL),
            (3, 1, '7345725', NULL),
            (4, 1, '7345752', NULL),
            (5, 1, '7345779', NULL),
            (6, 1, '7345806', NULL),
            (7, 1, '7345833', '7345779'),
            (8, 1, '7345860', NULL),
            (9, 1, '7345887', NULL),
            (10, 1, '7345914', NULL),
            (11, 1, '7345941', NULL),
            (12, 1, '7345968', NULL),
            (13, 1, '7345995', NULL),
            (14, 1, '7346022', '7345941'),
            (15, 1, '7346049', NULL),
            (16, 1, '7346076', '7345860'),
            (17, 1, '7346103', NULL),
            (18, 1, '7346130', NULL),
            (19, 1, '7346157', '7345995'),
            (20, 1, '7346184', NULL);

SELECT *
  FROM customer_outer_distr;