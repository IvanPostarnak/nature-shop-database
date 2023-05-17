DROP TABLE IF EXISTS supplier;

CREATE TABLE supplier
(
	supplier_id INTEGER GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  company_id INTEGER NOT NULL,
  
	CONSTRAINT pk_supplier_supplier_id PRIMARY KEY (supplier_id)
);

INSERT INTO supplier(name, company_id)
     VALUES ('NSP Moscow', 1),
            ('PSN Total', 2);

SELECT *
  FROM supplier;