DROP TABLE IF EXISTS about_us;

CREATE TABLE about_us
(
	about_us_id INTEGER GENERATED ALWAYS AS IDENTITY,
  introduction TEXT NOT NULL,
  our_vision TEXT NOT NULL,
  our_mission TEXT NOT NULL,
  why_us TEXT NOT NULL,
  thanks TEXT NOT NULL,
  afterword TEXT,
  create_ts TIMESTAMP NOT NULL DEFAULT NOW(),
  
	CONSTRAINT pk_about_us_about_us_id PRIMARY KEY (about_us_id),
  CONSTRAINT chk_about_us_introduction CHECK (introduction != ''),
  CONSTRAINT chk_about_us_our_vision CHECK (our_vision != ''),
  CONSTRAINT chk_about_us_our_mission CHECK (our_mission != ''),
  CONSTRAINT chk_about_us_why_us CHECK (why_us != ''),
  CONSTRAINT chk_about_us_thanks CHECK (thanks != ''),
  CONSTRAINT chk_about_us_afterword CHECK (afterword != '')
);

INSERT INTO about_us(introduction, our_vision, our_mission, why_us, thanks, afterword)
     VALUES (
      'Welcome to Nature Shop, a completely fictional and made-up online store! This page is a mock About Us section created for testing purposes only. Please note that all the information provided here is entirely fake and does not represent any real company or organization. At Nature Shop, we aim to bring you the finest selection of fake products for your amusement and entertainment. We specialize in offering a wide range of non-existent items that cater to your imagination. From mythical creatures to futuristic gadgets, we have it all!',
      'To create a virtual shopping experience that sparks joy and ignites your creativity, where you can explore a world of fantasy and wonder.',
      'To provide an escape from reality by offering an extensive collection of non-existent products that bring a smile to your face and unleash your imagination.',
      '1) Unparalleled Selection: We take pride in curating an extensive inventory of imaginary items that are meticulously designed to fulfill your wildest dreams. From whimsical accessories to fantastical contraptions, we offer a variety of products that exist only in the realm of imagination. 2) Exceptional Quality: Although our products may be non-existent, we ensure that each item is crafted with care and precision in our fictitious workshops. Our team of imaginary artisans pays meticulous attention to detail to create an illusion of authenticity and quality. 3) Imaginative Customer Service: Our friendly and imaginative customer service team is always ready to assist you on your fantastical shopping journey. Whether you need guidance on selecting the perfect unicorn horn or have questions about the dimensions of a fictional time machine, we''re here to make your experience truly enchanting. 4) Secure and Safe: Rest assured that your data and privacy are entirely safe with us, as we don''t collect any personal information. We understand the importance of keeping your imaginary identity private and secure. 5) Satisfaction Guaranteed: While our products may be entirely fictional, your satisfaction is our utmost priority. If you''re not completely delighted with your imaginary purchase, please contact our imaginative support team, and they will be happy to assist you with a suitable solution.',
      'Thank you for visiting Nature Shop, the ultimate destination for fake products and extraordinary wonders. Enjoy your time exploring our whimsical collection and let your imagination soar to new heights!',
      'Please remember that this About Us page is purely fictitious and intended for testing purposes only. None of the information provided here is real or associated with any actual company.'
     );

SELECT *
  FROM about_us;