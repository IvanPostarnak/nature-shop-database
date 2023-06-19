DROP TABLE IF EXISTS our_contacts;

CREATE TABLE our_contacts
(
	our_contacts_id INTEGER GENERATED ALWAYS AS IDENTITY,
  introduction TEXT NOT NULL,
  body TEXT NOT NULL,
  phone TEXT NOT NULL,
  email TEXT NOT NULL,
  afterword TEXT,
  create_ts TIMESTAMP NOT NULL DEFAULT NOW(),
  facebook_link TEXT,
  twitter_link TEXT,
  vk_link TEXT,
  intagram_link TEXT,
  telegram_link TEXT,
  reddit_link TEXT,
  linkedin_link TEXT,
  github_link TEXT,
  tiktok_link TEXT,
  
	CONSTRAINT pk_our_contacts_our_contacts_id PRIMARY KEY (our_contacts_id),
  CONSTRAINT chk_our_contacts_introduction CHECK (introduction != ''),
  CONSTRAINT chk_our_contacts_body CHECK (body != ''),
  CONSTRAINT chk_our_contacts_phone CHECK (phone != ''),
  CONSTRAINT chk_our_contacts_email CHECK (email != '')
);

INSERT INTO our_contacts(introduction, body, phone, email, afterword, facebook_link, twitter_link, vk_link, intagram_link, telegram_link, reddit_link, linkedin_link, github_link, tiktok_link)
     VALUES (
              'We appreciate your interest in Nature Shop, a fictional online store. Please note that the contact information provided below is entirely fictional and does not represent any real company or organization.',
              'Feel free to reach out to us with any inquiries, comments, or fantastical stories you''d like to share. Our dedicated team of fictional customer service representatives is ready to assist you on your imaginative shopping journey. If you wish to visit us in person, you can find our imaginary store conveniently located on Imaginary Street in the magical town of Fantasyville. Please note that as a fictional business, we don''t have a physical presence in the real world. However, our virtual doors are always open, and we''re just a click away. Connect with us on social media to stay up-to-date with the latest imaginary product releases, fantastical promotions, and imaginary adventures. We value your feedback and are eager to hear about your imaginative shopping experiences. Don''t hesitate to get in touch with us through the provided contact information. Our imaginary team will be thrilled to assist you and make your experience with Nature Shop truly extraordinary.',
              '+1 555-123-4567',
              'info@natureshop.com',
              'Please note that all the information provided on this Contact Us page is entirely fictional and created solely for testing purposes. None of the contact details or associated information represents any real company or organization.',
              'https://github.com/IvanPostarnak',
              'https://github.com/IvanPostarnak',
              'https://vk.com/ivanpostarnak',
              'https://github.com/IvanPostarnak',
              'https://github.com/IvanPostarnak',
              'https://github.com/IvanPostarnak',
              'https://github.com/IvanPostarnak',
              'https://github.com/IvanPostarnak',
              'https://github.com/IvanPostarnak'
            );

SELECT *
  FROM our_contacts;