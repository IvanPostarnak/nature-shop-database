DROP TABLE IF EXISTS customer;

CREATE TABLE customer
(
	customer_id INTEGER GENERATED ALWAYS AS IDENTITY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  middle_name TEXT,
  
	CONSTRAINT pk_customer_customer_id PRIMARY KEY (customer_id),
  CONSTRAINT chk_customer_first_name CHECK (first_name != ''),
  CONSTRAINT chk_customer_last_name CHECK (last_name != ''),
  CONSTRAINT chk_customer_middle_name CHECK (middle_name != '')
);

INSERT INTO customer(first_name, last_name, middle_name)
     VALUES ('Smith', 'John', 'David'),
            ('Brown', 'Emily', 'Grace'),
            ('Davis', 'Benjamine', 'Michael'),
            ('Anderson', 'Olivia', 'Sophia'),
            ('Wilson', 'William', 'Thomas'),
            ('Martinez', 'Ava', 'Elizabeth'),
            ('Clark', 'James', 'Alexander'),
            ('Taylor', 'Charlotte', 'Grace'),
            ('Lee', 'Daniel', 'Joseph'),
            ('Walker', 'Sophia', 'Rose'),
            ('Garcia', 'Ethan', 'Matthew'),
            ('Hernandez', 'Mia', 'Olivia'),
            ('White', 'Samuel', 'Benjamin'),
            ('Martin', 'Isabella', 'Emma'),
            ('Thompson', 'Noah', 'David'),
            ('Lewis', 'Harper', 'Ava'),
            ('Turner', 'Samuel', 'James'),
            ('Adams', 'Amelia', 'Harper'),
            ('Hall', 'Jackson', 'Daniel'),
            ('Johnson', 'Abigail', 'Lily');

SELECT *
  FROM customer;