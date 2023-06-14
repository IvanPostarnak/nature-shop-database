DROP TABLE IF EXISTS brand;

CREATE TABLE brand
(
	brand_id INTEGER GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  description TEXT,
  company_id INTEGER NOT NULL,
  
	CONSTRAINT pk_brand_brand_id PRIMARY KEY (brand_id),
  CONSTRAINT unq_brand_name UNIQUE (name),
  CONSTRAINT unq_brand_description UNIQUE (description),
  CONSTRAINT fk_brand_company_id_company_company_id FOREIGN KEY (company_id) REFERENCES company(company_id),
  CONSTRAINT chk_brand_name CHECK (name != ''),
  CONSTRAINT chk_brand_description CHECK (description != '')
);

INSERT INTO brand(name, description, company_id)
     VALUES ('Bremani Makeup', 'The random collision of particles in the atmosphere creates mesmerizing Northern Lights.', 1),
            ('Bremani Care', 'Exploring the vastness of the universe, astronomers discover a random pulsar emitting powerful beams of energy.', 1),
            ('Tropical Mists', 'In a spontaneous burst of creativity, an artist splashes random colors onto the canvas, forming a captivating abstract masterpiece.', 1),
            ('NSP Everyday', 'Amidst the bustling city streets, a chance encounter leads to a random but profound connection between two strangers.', 1),
            ('NSP Health Care', 'The unpredictable weather takes a random turn, surprising everyone with an unexpected downpour of rain in the midst of summer.', 1),
            ('NSP Health Library', 'The random arrangement of musical notes creates a haunting melody that resonates deeply with listeners.', 1),
            ('NSP Accessories', 'Explorers stumble upon a hidden treasure chest buried in a random location on a remote island, filled with ancient artifacts and riches.', 1),
            ('NSP Clothes', 'A writer''s imagination takes flight as random thoughts weave together into a compelling story with unexpected twists.', 1),
            ('PSN Health Care', 'In a crowded marketplace, a street magician pulls off an astonishing trick, leaving the audience in awe of his random acts of illusion.', 2),
            ('PSN Everyday', 'A hiker follows a random trail through the dense forest, discovering a hidden waterfall cascading down a picturesque cliff.', 2),
            ('PSN Health Library', 'A scientist conducts a series of random experiments, hoping to uncover new insights and make groundbreaking discoveries in their field.', 2);

SELECT *
  FROM brand;