DROP TABLE IF EXISTS customer_statistics;

CREATE TABLE customer_statistics
(
	customer_statistics_id INTEGER GENERATED ALWAYS AS IDENTITY,
  customer_id INTEGER NOT NULL,
  purchase_first DATE,
  purchase_total INTEGER NOT NULL DEFAULT 0,
  item_total INTEGER NOT NULL DEFAULT 0,
  spent_total REAL NOT NULL DEFAULT 0.0,
  
	CONSTRAINT pk_customer_statistics_customer_statistics_id PRIMARY KEY (customer_statistics_id),
  CONSTRAINT unq_customer_statistics_customer_id UNIQUE (customer_id),
  CONSTRAINT chk_customer_statistics_purchase_total CHECK (purchase_total >= 0),
  CONSTRAINT chk_customer_statistics_item_total CHECK (item_total >= purchase_total),
  CONSTRAINT chk_customer_statistics_spent_total CHECK (spent_total >= 0),
  CONSTRAINT fk_customer_statistics_customer_id_customer_customer_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

INSERT INTO customer_statistics(customer_id)
     VALUES (1),
            (2),
            (3),
            (4),
            (5),
            (6),
            (7),
            (8),
            (9),
            (10),
            (11),
            (12),
            (13),
            (14),
            (15),
            (16),
            (17),
            (18),
            (19),
            (20);

SELECT *
  FROM customer_statistics;