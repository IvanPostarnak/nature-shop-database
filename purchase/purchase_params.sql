DROP TABLE IF EXISTS purchase_params;

CREATE TABLE purchase_params
(
	purchase_params_id INTEGER GENERATED ALWAYS AS IDENTITY,
  purchase_id INTEGER NOT NULL,
  length_cm REAL NOT NULL,
  width_cm REAL NOT NULL,
  height_cm REAL NOT NULL,
  weight_kg REAL NOT NULL,
  
	CONSTRAINT pk_purchase_params_purchase_params_id PRIMARY KEY (purchase_params_id),
  CONSTRAINT unq_purchase_params_purchase_id UNIQUE (purchase_id),
  CONSTRAINT chk_purchase_params_length_cm CHECK (length_cm > 0),
  CONSTRAINT chk_purchase_params_width_cm CHECK (width_cm > 0),
  CONSTRAINT chk_purchase_params_height_cm CHECK (height_cm > 0),
  CONSTRAINT chk_purchase_params_weight_kg CHECK (weight_kg > 0),
  CONSTRAINT fk_purchase_params_purchase_id_purchase_purchase_id FOREIGN KEY (purchase_id) REFERENCES purchase(purchase_id)
);

-- INSERT INTO purchase_params()
--      VALUES (),
--             (),
--             ();

SELECT *
  FROM purchase_params;