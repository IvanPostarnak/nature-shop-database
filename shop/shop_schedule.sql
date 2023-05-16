DROP TABLE IF EXISTS shop_schedule;

CREATE TABLE shop_schedule
(
	shop_schedule_id INTEGER GENERATED ALWAYS AS IDENTITY,
  shop_id INTEGER NOT NULL,
  open_time TIME,
  close_time TIME,
  
	CONSTRAINT pk_shop_schedule_shop_schedule_id PRIMARY KEY (shop_schedule_id),
  CONSTRAINT unq_shop_schedule_shop_id UNIQUE (shop_id),
  CONSTRAINT fk_shop_schedule_shop_id_shop_shop_id FOREIGN KEY (shop_id) REFERENCES shop(shop_id)
);

INSERT INTO shop_schedule(shop_id, open_time, close_time)
     VALUES (1, NULL, NULL),
            (2, '11:00:00', '19:00:00');

SELECT *
  FROM shop_schedule;