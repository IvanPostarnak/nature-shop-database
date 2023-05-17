DROP TABLE IF EXISTS shipping_type;

CREATE TABLE shipping_type
(
	shipping_type_id INTEGER GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  abbr VARCHAR(5) NOT NULL,
  description TEXT,
  
	CONSTRAINT pk_shipping_type_shipping_type_id PRIMARY KEY (shipping_type_id),
  CONSTRAINT unq_shipping_type_name UNIQUE (name),
  CONSTRAINT unq_shipping_type_abbr UNIQUE (abbr),
  CONSTRAINT unq_shipping_type_description UNIQUE (description),
  CONSTRAINT chk_shipping_type_name CHECK (name != ''),
  CONSTRAINT chk_shipping_type_abbr CHECK (abbr != ''),
  CONSTRAINT chk_shipping_type_description CHECK (description != '')
);

INSERT INTO shipping_type(name, abbr, description)
     VALUES ('Door-Door', 'DD', 'From Door of the shop To Door of the customer'),
            ('Point-Point', 'PP', 'From shipper Point To shipper Point'),
            ('Door-Point', 'DP', 'From Door of the shop To shipper Point'),
            ('Point-Door', 'PD', 'From shipper Point To Door of the customer');

SELECT *
  FROM shipping_type;