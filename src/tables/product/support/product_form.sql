DROP TABLE IF EXISTS product_form;

CREATE TABLE product_form
(
	product_form_id INTEGER GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  abbr TEXT,
  description TEXT,
  
	CONSTRAINT pk_product_form_product_form_id PRIMARY KEY (product_form_id),
  CONSTRAINT unq_product_form_name UNIQUE (name),
  CONSTRAINT unq_product_form_abbr UNIQUE (abbr),
  CONSTRAINT unq_product_form_description UNIQUE (description),
  CONSTRAINT chk_product_form_name CHECK (name != ''),
  CONSTRAINT chk_product_form_abbr CHECK (abbr != ''),
  CONSTRAINT chk_product_form_description CHECK (description != '')
);

INSERT INTO product_form(name, description)
VALUES ('Tablet', 'A solid form of medication or supplement that is typically taken orally'),
       ('Capsule', 'A small, cylindrical form of medication or supplement that encloses the active ingredients'),
       ('Liquid', 'A fluid form of medication or product that can be poured or measured'),
       ('Powder', 'A dry, finely ground substance that can be dissolved or mixed with other substances'),
       ('Cream', 'A semisolid emulsion that is applied to the skin for medicinal or cosmetic purposes'),
       ('Lipstick', 'A cosmetic product in a stick form that is applied to the lips for color and texture'),
       ('Pencil', 'A thin cylindrical object used for writing, drawing, or cosmetic application'),
       ('Roller', 'A device with a rolling mechanism used for applying products, such as skincare or paint'),
       ('Book', 'A written or printed work consisting of pages bound together'),
       ('Thing', 'A general term used to describe an unspecified object or item');

SELECT *
  FROM product_form;