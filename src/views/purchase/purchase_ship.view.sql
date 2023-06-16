DROP VIEW purchase_ship_view;

CREATE VIEW purchase_ship_view AS
     SELECT purchase.purchase_id,
            purchase_ship.purchase_ship_id,
            purchase_ship.invoice_num,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT *
                    FROM shipper_full
                   WHERE purchase_ship.shipper_id = shipper_full.shipper_id
                ) AS row
            ) AS shipper,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT *
                    FROM shipping_type
                   WHERE purchase_ship.shipping_type_id = shipping_type.shipping_type_id
                ) AS row
            ) AS type,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT purchase_ship_addr.purchase_ship_addr_id,
                         country.name AS country,
                         region,
                         city.name AS city,
                         street,
                         building,
                         appartment,
                         floor,
                         entrance,
                         has_fence,
                         postal_code
                    FROM purchase_ship_addr
                    JOIN country USING (country_id)
                    JOIN city USING (city_id)
                   WHERE purchase_ship_addr.purchase_id = purchase.purchase_id
                ) AS row
            ) AS address
       FROM purchase
       JOIN purchase_ship USING (purchase_id);

SELECT * FROM purchase_ship_view;