DROP MATERIALIZED VIEW shop_basic;

CREATE MATERIALIZED VIEW shop_basic AS
     SELECT shop.shop_id,
            CONCAT(employee.first_name, ' ', employee.last_name) AS admin,
            shop.rating,
            country.name AS country,
            city.name AS city,
            shop_contacts.phone,
            shop_contacts.email,
            shop_payment.collection_day,
            shop_renter.name AS renter,
            shop_schedule.open_time,
            shop_schedule.close_time,
            shop_security.is_protected,
            shop_security.security_phone,
            shop_staff.staff_total_current AS staff_total,
            shop_statistics.income_total,
            shop_statistics.purchase_total
       FROM shop
  LEFT JOIN shop_addr USING (shop_id)
  LEFT JOIN shop_contacts USING (shop_id)
  LEFT JOIN shop_payment USING (shop_id)
  LEFT JOIN shop_renter USING (shop_id)
  LEFT JOIN shop_schedule USING (shop_id)
  LEFT JOIN shop_security USING (shop_id)
  LEFT JOIN shop_staff USING (shop_id)
  LEFT JOIN shop_statistics USING (shop_id)
  LEFT JOIN employee ON shop.admin_id = employee.employee_id
  LEFT JOIN country ON shop_addr.country_id = country.country_id
  LEFT JOIN city ON shop_addr.city_id = city.city_id;

SELECT * FROM shop_basic;