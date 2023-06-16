DROP VIEW purchase_full_web;

CREATE VIEW purchase_full_web AS
     SELECT purchase.purchase_id,
            purchase.date,
            purchase.time,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT *
                    FROM customer_full
                   WHERE purchase.customer_id = customer_full.customer_id
                ) AS row
            ) AS customer,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT *
                    FROM employee_full_web
                   WHERE purchase.employee_id = employee_full_web.employee_id
                ) AS row
            ) AS employee,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT *
                    FROM shop_full
                   WHERE purchase.shop_id = shop_full.shop_id
                ) AS row
            ) AS shop,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT purchase_details.purchase_details_id,
                         purchase_details.products,
                         purchase_details.items_total,
                         purchase_details.unique_items,
                         purchase_details.bonus_value
                    FROM purchase_details
                   WHERE purchase.purchase_id = purchase_details.purchase_id
                ) AS row
            ) AS details,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT purchase_params.purchase_params_id,
                         length_cm AS length,
                         width_cm AS width,
                         height_cm AS height,
                         weight_kg AS weight
                    FROM purchase_params
                   WHERE purchase.purchase_id = purchase_params.purchase_id
                ) AS row
            ) AS params,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT purchase_payment.purchase_payment_id,
                         sum,
                         payment_type.name AS payment_type,
                         currency.abbr AS currency
                    FROM purchase_payment
                    JOIN payment_type USING (payment_type_id)
                    JOIN currency USING (currency_id)
                   WHERE purchase.purchase_id = purchase_payment.purchase_id
                ) AS row
            ) AS payment,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT purchase_ship_view.purchase_ship_id,
                         invoice_num,
                         shipper,
                         type,
                         address
                    FROM purchase_ship_view
                   WHERE purchase.purchase_id = purchase_ship_view.purchase_id
                ) AS row
            ) AS shipping
       FROM purchase;

SELECT * FROM purchase_full_web;