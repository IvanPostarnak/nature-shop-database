DROP TABLE IF EXISTS shipper_contacts;

CREATE TABLE shipper_contacts
(
	shipper_contacts_id INTEGER GENERATED ALWAYS AS IDENTITY,
  shipper_id INTEGER NOT NULL,
  contact_name TEXT,
  contact_phone TEXT NOT NULL,
  contact_email TEXT NOT NULL,
  website TEXT,  
  
	CONSTRAINT pk_shipper_contacts_shipper_contacts_id PRIMARY KEY (shipper_contacts_id),
  CONSTRAINT unq_shipper_contacts_shipper_id UNIQUE (shipper_id),
  CONSTRAINT unq_shipper_contacts_contact_phone UNIQUE (contact_phone),
  CONSTRAINT unq_shipper_contacts_contact_email UNIQUE (contact_email),
  CONSTRAINT unq_shipper_contacts_website UNIQUE (website),
  CONSTRAINT fk_shipper_contacts_shipper_id_shipper_shipper_id FOREIGN KEY (shipper_id) REFERENCES shipper(shipper_id)
);

INSERT INTO shipper_contacts(shipper_id, contact_name, contact_phone, contact_email, website)
     VALUES (1, 'Sophy Latour', '4(398)456-19-44', 'cdek-support@yandex.ru', 'cdek.com');

SELECT *
  FROM shipper_contacts;