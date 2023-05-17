DROP TABLE IF EXISTS customer_contacts;

CREATE TABLE customer_contacts
(
	customer_contacts_id INTEGER GENERATED ALWAYS AS IDENTITY,
  customer_id INTEGER NOT NULL,
  phone TEXT,
  email TEXT,
  
	CONSTRAINT pk_customer_contacts_customer_contacts_id PRIMARY KEY (customer_contacts_id),
  CONSTRAINT unq_customer_contacts_customer_id UNIQUE (customer_id),
  CONSTRAINT unq_customer_contacts_phone UNIQUE (phone),
  CONSTRAINT unq_customer_contacts_email UNIQUE (email),
  CONSTRAINT chk_customer_contacts_phone CHECK (phone != ''),
  CONSTRAINT chk_customer_contacts_email CHECK (email != ''),
  CONSTRAINT fk_customer_contacts_customer_id_customer_customer_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

INSERT INTO customer_contacts(customer_id, phone, email)
     VALUES (1, '(555) 123-4567', 'john.smith@example.com'),
            (2, '(555) 987-6543', 'emily.johnson@example.com'),
            (3, '(555) 246-8135', 'benjamin.brown@example.com'),
            (4, '(555) 369-2580', 'olivia.davis@example.com'),
            (5, '(555) 480-7926', 'william.anderson@example.com'),
            (6, '(555) 951-3578', 'ava.wilson@example.com'),
            (7, '(555) 753-0864', 'james.martinez@example.com'),
            (8, '(555) 209-6741', 'charlotte.clark@example.com'),
            (9, '(555) 638-5712', 'daniel.taylor@example.com'),
            (10, '(555) 724-3059', 'sophia.lee@example.com'),
            (11, '(555) 831-4967', 'ethan.walker@example.com'),
            (12, '(555) 467-0283', 'mia.garcia@example.com'),
            (13, '(555) 295-1847', 'samuel.hernandez@example.com'),
            (14, '(555) 816-7032', 'isabella.white@example.com'),
            (15, '(555) 374-5291', 'noah.martin@example.com'),
            (16, '(555) 962-0415', 'harper.thompson@example.com'),
            (17, '(555) 508-3679', 'samuel.lewis@example.com'),
            (18, '(555) 741-9265', 'amelia.turner@example.com'),
            (19, '(555) 203-5487', 'jackson.adams@example.com'),
            (20, '(555) 679-3158', 'abigail.hall@example.com');

SELECT *
  FROM customer_contacts;