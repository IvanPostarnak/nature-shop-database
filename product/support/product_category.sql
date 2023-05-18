DROP TABLE IF EXISTS product_category;

CREATE TABLE product_category
(
	product_category_id INTEGER GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  abbr TEXT,
  description TEXT,
  
	CONSTRAINT pk_product_category_product_category_id PRIMARY KEY (product_category_id),
  CONSTRAINT unq_product_category_name UNIQUE (name),
  CONSTRAINT unq_product_category_abbr UNIQUE (abbr),
  CONSTRAINT unq_product_category_description UNIQUE (description),
  CONSTRAINT chk_product_category_name CHECK (name != ''),
  CONSTRAINT chk_product_category_abbr CHECK (abbr != ''),
  CONSTRAINT chk_product_category_description CHECK (description != '')
);

INSERT INTO product_category(name, description)
     VALUES ('Dietary Supplements', 'The ''Dietary Supplements'' category is for products that provide additional nutritional support'),
            ('Medicine', '''Medicine'' category includes pharmaceutical products for treating illnesses and conditions'),
            ('Cosmetics for Health', '''Cosmetics for Health'' category comprises products aimed at enhancing health and well-being'),
            ('Decorative Cosmetics', '''Decorative Cosmetics'' category offers makeup products for enhancing appearance'),
            ('Hygiene Products', '''Hygiene Products'' category consists of items for personal cleanliness and sanitation'),
            ('Literature', '''Literature'' category includes books and written materials'),
            ('Clothes', '''Clothes'' category offers various garments and apparel'),
            ('Accessories', '''Accessories'' category includes additional items to complement or enhance other products or outfits');

SELECT *
  FROM product_category;