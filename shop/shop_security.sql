DROP TABLE IF EXISTS shop_security;

CREATE TABLE shop_security
(
	shop_security_id INTEGER GENERATED ALWAYS AS IDENTITY,
  shop_id INTEGER NOT NULL,
  keys_num INTEGER,
  is_protected BOOLEAN,
  security_phone TEXT,
  
	CONSTRAINT pk_shop_security_shop_security_id PRIMARY KEY (shop_security_id),
  CONSTRAINT unq_shop_security_shop_id UNIQUE (shop_id),
  CONSTRAINT chk_shop_security_keys_num CHECK (keys_num > 0),
  CONSTRAINT fk_shop_security_shop_id_shop_shop_id FOREIGN KEY (shop_id) REFERENCES shop(shop_id)
);

INSERT INTO shop_security(shop_id, keys_num, is_protected, security_phone)
     VALUES (1, NULL, TRUE, '671312736'),
            (2, 2, TRUE, '671312736');

SELECT *
  FROM shop_security;