DROP TABLE IF EXISTS packing_material;

CREATE TABLE packing_material
(
	packing_material_id INTEGER GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  description TEXT,
  
	CONSTRAINT pk_packing_material_packing_material_id PRIMARY KEY (packing_material_id),
  CONSTRAINT unq_packing_material_name UNIQUE (name),
  CONSTRAINT unq_packing_material_description UNIQUE (description),
  CONSTRAINT chk_packing_material_name CHECK (name != ''),
  CONSTRAINT chk_packing_material_description CHECK (description != '')
);

INSERT INTO packing_material(name, description)
VALUES ('Plastic', 'A synthetic material made from polymers that is versatile, lightweight, and commonly used for various applications'),
       ('Glass', 'A solid, transparent material made from silica that is brittle, often used for containers, windows, and decorative items'),
       ('No packing', 'Prodcuts, that don''t have any package');

SELECT *
  FROM packing_material;