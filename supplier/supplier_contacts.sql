DROP TABLE IF EXISTS supplier_contacts;

CREATE TABLE supplier_contacts
(
	supplier_contacts_id INTEGER GENERATED ALWAYS AS IDENTITY,
  supplier_id INTEGER NOT NULL,
  contact_name TEXT NOT NULL,
  contact_phone TEXT NOT NULL,
  contact_email TEXT NOT NULL,
  website TEXT,
  
	CONSTRAINT pk_supplier_contacts_supplier_contacts_id PRIMARY KEY (supplier_contacts_id),
  CONSTRAINT unq_supplier_contacts_supplier_id UNIQUE (supplier_id),
  CONSTRAINT unq_supplier_contacts_contact_phone UNIQUE (contact_phone),
  CONSTRAINT unq_supplier_contacts_contact_email UNIQUE (contact_email),
  CONSTRAINT unq_supplier_contacts_website UNIQUE (website),
  CONSTRAINT fk_supplier_contacts_supplier_id_supplier_supplier_id FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
);

INSERT INTO supplier_contacts(supplier_id, contact_name, contact_phone, contact_email, website)
     VALUES (1, 'Michail Narenkov', '8(321)456-98-01', 'contact-us@natr.ru', 'natr.ru'),
            (2, 'Daniel Markov', '8(467)351-56-81', 'contact-us@gmail.com', 'psn-total.com');

SELECT *
  FROM supplier_contacts;