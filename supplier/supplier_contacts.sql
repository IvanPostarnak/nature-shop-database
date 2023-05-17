DROP TABLE IF EXISTS supplier_contacts;

CREATE TABLE supplier_contacts
(
	supplier_contacts_id INTEGER GENERATED ALWAYS AS IDENTITY,
  supplier_id INTEGER NOT NULL,
  name TEXT NOT NULL,
  phone TEXT,
  email TEXT,
  website TEXT,
  
	CONSTRAINT pk_supplier_contacts_supplier_contacts_id PRIMARY KEY (supplier_contacts_id),
  CONSTRAINT unq_supplier_contacts_supplier_id UNIQUE (supplier_id),
  CONSTRAINT unq_supplier_contacts_phone UNIQUE (phone),
  CONSTRAINT unq_supplier_contacts_email UNIQUE (email),
  CONSTRAINT unq_supplier_contacts_website UNIQUE (website),
  CONSTRAINT fk_supplier_contacts_supplier_id_supplier_supplier_id FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
);

INSERT INTO supplier_contacts(supplier_id, name, phone, email, website)
     VALUES (1, 'Michail Narenkov', '8(321)456-98-01', 'contact-us@natr.ru', 'natr.ru'),
            (2, 'Daniel Markov', '8(467)351-56-81', 'contact-us@gmail.com', 'psn-total.com');

SELECT *
  FROM supplier_contacts;