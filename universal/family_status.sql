DROP TABLE IF EXISTS family_status;

CREATE TABLE family_status
(
	family_status_id INTEGER GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  description TEXT,
  
	CONSTRAINT pk_family_status_family_status_id PRIMARY KEY (family_status_id),
  CONSTRAINT unq_family_status_name UNIQUE (name),
  CONSTRAINT unq_family_status_description UNIQUE (description),
  CONSTRAINT chk_family_status_name CHECK (name != '')
);

INSERT INTO family_status(name, description)
     VALUES ('Married', 'Married - The individual is legally joined in matrimony to another person.'),
            ('Single', 'Single - The individual is not currently married or in a committed relationship.'),
            ('Divorced', 'Divorced - The individual''s marriage has been legally dissolved.'),
            ('Widowed', 'Widowed - The individual''s spouse has passed away.'), 
            ('Separated', 'Separated - The individual is no longer living with their spouse but remains legally married.'),
            ('Engaged', 'Engaged - The individual is in a committed relationship and has plans to get married.'),
            ('Domestic Partnership', 'Domestic Partnership - The individual is in a legally recognized partnership akin to marriage.'),
            ('Common-law marriage', 'Common-law marriage - The individual is in a long-term relationship that is recognized as a marriage despite not being formally married.'),
            ('Blended family', 'Blended family - The individual is part of a family that includes stepparents, stepsiblings, or half-siblings.'),
            ('Extended family', 'Extended family - The individual''s family includes relatives beyond the immediate family, such as grandparents, aunts, uncles, and cousins.'),
            ('Adoptive family', 'Adoptive family - The individual is part of a family where one or more members have been legally adopted.'),
            ('Foster family', 'Foster family - The individual is part of a family that provides temporary care for children in need.'),
            ('Single-parent family', 'Single-parent family - The individual is a parent raising a child or children alone.'),
            ('Multigenerational family', 'Multigenerational family - The individual''s family includes multiple generations living together or in close proximity.');

SELECT *
  FROM family_status;