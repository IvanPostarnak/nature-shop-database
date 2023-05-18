DROP TABLE IF EXISTS product_type;

CREATE TABLE product_type
(
	product_type_id INTEGER GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  abbr TEXT,
  description TEXT,
  
	CONSTRAINT pk_product_type_product_type_id PRIMARY KEY (product_type_id),
  CONSTRAINT unq_product_type_name UNIQUE (name),
  CONSTRAINT unq_product_type_abbr UNIQUE (abbr),
  CONSTRAINT unq_product_type_description UNIQUE (description),
  CONSTRAINT chk_product_type_name CHECK (name != ''),
  CONSTRAINT chk_product_type_abbr CHECK (abbr != ''),
  CONSTRAINT chk_product_type_description CHECK (description != '')
);
            
INSERT INTO product_type(name, description)
VALUES ('Dietary Supplement', 'A product that provides additional nutrients to supplement one''s diet'),
       ('Medicine', 'A substance or preparation used for treating or preventing diseases or medical conditions'),
       ('Gel', 'A semisolid substance with a gel-like consistency'),
       ('Lotion', 'A liquid or cream applied to the skin for moisturizing or medicinal purposes'),
       ('Oil', 'A viscous liquid substance that is often used for cooking, skincare, or lubrication'),
       ('Toothpaste', 'A paste or gel used with a toothbrush for cleaning and maintaining oral hygiene'),
       ('Balsam', 'A soothing and healing substance, often used for skin or hair care'),
       ('Tonic', 'A refreshing and invigorating liquid used for skincare or haircare'),
       ('Cream', 'A thick, smooth-textured substance applied to the skin for moisturizing or medicinal purposes'),
       ('Face mask', 'A skincare product applied to the face for various purposes, such as cleansing, hydrating, or rejuvenating'),
       ('Shampoo', 'A liquid or gel used for cleaning and conditioning the hair'),
       ('Conditioner', 'A product applied to the hair after shampooing to improve its manageability and appearance'),
       ('Shower gel', 'A liquid soap or cleanser used for cleansing the body during a shower'),
       ('Body milk', 'A moisturizing lotion or cream specifically formulated for the body'),
       ('Serum', 'A concentrated skincare product that delivers active ingredients to the skin'),
       ('Scrub', 'A product used for exfoliating and removing dead skin cells'),
       ('Deodorant', 'A product applied to the body to prevent or mask body odor'),
       ('Lip gloss', 'A cosmetic product that adds shine and color to the lips'),
       ('Powder for makeup', 'A finely ground cosmetic powder used for setting makeup or creating a matte finish'),
       ('Blush', 'A cosmetic product applied to the cheeks to add color and create a youthful appearance'),
       ('Powder Eyebrow Pencil', 'A cosmetic pencil used for filling in and shaping eyebrows'),
       ('Lip Pencil', 'A cosmetic pencil used for outlining and defining the lips'),
       ('Booklet', 'A small printed publication containing information or promotional material'),
       ('Brochure', 'A small booklet or pamphlet providing information about a product or service'),
       ('Notepad', 'A small pad of paper used for writing notes or memos'),
       ('Book', 'A written or printed work consisting of pages bound together'),
       ('T-shirt', 'A short-sleeved shirt typically made of cotton and worn as casual attire'),
       ('Pillbox', 'A small container for storing and organizing pills or medication');

SELECT *
  FROM product_type;