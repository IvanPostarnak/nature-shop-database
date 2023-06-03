DROP TABLE IF EXISTS shop_staff;

CREATE TABLE shop_staff
(
	shop_staff_id INTEGER GENERATED ALWAYS AS IDENTITY,
  shop_id INTEGER NOT NULL,
  staff_total_min INTEGER,
  staff_total_max INTEGER,
  staff_total_current INTEGER,
  staff_shift_min INTEGER,
  staff_shift_max INTEGER,
  staff_shift_current INTEGER,
  
	CONSTRAINT pk_shop_staff_shop_staff_id PRIMARY KEY (shop_staff_id),
  CONSTRAINT unq_shop_staff_shop_id UNIQUE (shop_id),
  CONSTRAINT chk_shop_staff_staff_total_min CHECK (staff_total_min >= 0),
  CONSTRAINT chk_shop_staff_staff_total_min_staff_total_max CHECK (staff_total_min <= staff_total_max),
  CONSTRAINT chk_shop_staff_staff_total_current CHECK (staff_total_current BETWEEN staff_total_min AND staff_total_max),
  CONSTRAINT chk_shop_staff_staff_shift_min CHECK (staff_shift_min >= 0),
  CONSTRAINT chk_shop_staff_staff_shift_min_staff_shift_max CHECK (staff_shift_min <= staff_shift_max),
  CONSTRAINT chk_shop_staff_staff_shift_current CHECK (staff_shift_current BETWEEN staff_shift_min AND staff_shift_max),
  CONSTRAINT fk_shop_staff_shop_id_shop_shop_id FOREIGN KEY (shop_id) REFERENCES shop(shop_id)
);

INSERT INTO shop_staff(shop_id, staff_total_min, staff_total_max, staff_total_current, staff_shift_min, staff_shift_max, staff_shift_current)
     VALUES (1, 1, 1000000, 2, 1, 1000000, 2),
            (2, 5, 9, 7, 3, 5, 4);

SELECT *
  FROM shop_staff;