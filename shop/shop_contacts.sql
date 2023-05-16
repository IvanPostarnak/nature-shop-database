DROP TABLE IF EXISTS shop_contacts;

CREATE TABLE shop_contacts
(
	shop_contacts_id INTEGER GENERATED ALWAYS AS IDENTITY,
  shop_id INTEGER NOT NULL,
  phone TEXT NOT NULL,
  email TEXT NOT NULL,
  
	CONSTRAINT pk_shop_contacts_shop_contacts_id PRIMARY KEY (shop_contacts_id),
  CONSTRAINT unq_shop_contacts_shop_id UNIQUE (shop_id),
  CONSTRAINT unq_shop_contacts_phone UNIQUE (phone),
  CONSTRAINT unq_shop_contacts_email UNIQUE (email),
  CONSTRAINT fk_shop_contacts_shop_id_shop_shop_id FOREIGN KEY (shop_id) REFERENCES shop(shop_id)
);

INSERT INTO shop_contacts(shop_id, phone, email)
     VALUES (1, '8(123)576-98-01', 'textme@email.com'),
            (2, '8(876)201-05-66', 'textmeto@gmail.com');

SELECT *
  FROM shop_contacts;