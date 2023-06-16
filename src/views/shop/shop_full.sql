DROP MATERIALIZED VIEW shop_full;

CREATE MATERIALIZED VIEW shop_full AS
     SELECT shop.shop_id,
            shop.rating,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT *
                    FROM employee
                   WHERE shop.admin_id = employee.employee_id
                ) AS row
            ) AS admin,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT shop_addr_id,
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
                    FROM shop_addr
                    JOIN country USING (country_id)
                    JOIN city USING (city_id)
                   WHERE shop_addr.shop_id = shop.shop_id
                ) AS row
            ) AS address,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT shop_contacts_id,
                         phone,
                         email
                    FROM shop_contacts
                   WHERE shop_contacts.shop_id = shop.shop_id
                ) AS row
            ) AS contacts,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT shop_payment_id,
                         salary_mod,
                         bonus_mod,
                         salary_day,
                         collection_day
                    FROM shop_payment
                   WHERE shop_payment.shop_id = shop.shop_id
                ) AS row
            ) AS payment,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT shop_renter_id,
                         shop_renter.name,
                         contact_name,
                         shop_renter.contact_phone AS phone,
                         shop_renter.contact_email AS email,
                         rent_termintaion_date,
                         payment_day,
                         payment_account,
                         payment_sum,
                         currency.abbr AS currency
                    FROM shop_renter
                    JOIN currency USING (currency_id)
                   WHERE shop_renter.shop_id = shop.shop_id
                ) AS row
            ) AS renter,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT shop_schedule_id,
                         open_time,
                         close_time
                    FROM shop_schedule
                   WHERE shop_schedule.shop_id = shop.shop_id
                ) AS row
            ) AS schedule,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT shop_security_id,
                         keys_num AS keys_count,
                         is_protected,
                         security_phone AS phone
                    FROM shop_security
                   WHERE shop_security.shop_id = shop.shop_id
                ) AS row
            ) AS security,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT shop_staff_id,
                         staff_total_min AS total_min,
                         staff_total_max AS total_max,
                         staff_total_current AS total_current,
                         staff_shift_min AS shift_min,
                         staff_shift_max AS shift_max,
                         staff_shift_current AS shift_current
                    FROM shop_staff
                   WHERE shop_staff.shop_id = shop.shop_id
                ) AS row
            ) AS staff,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT shop_statistics_id,
                         income_total,
                         purchase_total
                    FROM shop_statistics
                   WHERE shop_statistics.shop_id = shop.shop_id
                ) AS row
            ) AS stats
       FROM shop;

SELECT * FROM shop_full;