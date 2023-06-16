DROP VIEW purchase_basic_web;

CREATE VIEW purchase_basic_web AS
     SELECT purchase.purchase_id,
            CONCAT(customer.first_name, ' ', customer.last_name) AS customer,
            CONCAT(employee.first_name, ' ', employee.last_name) AS employee,
            purchase.date,
            purchase.time,
            shop_id,
            purchase_details.products,
            purchase_details.items_total AS items_count,
            purchase_details.bonus_value AS bonus_volume,
            purchase_params.length_cm AS length,
            purchase_params.height_cm AS height,
            purchase_params.width_cm AS width,
            purchase_params.weight_kg AS weight,
            purchase_payment.sum,
            payment_type.name AS payment_type,
            currency.abbr AS currency
       FROM purchase
  LEFT JOIN purchase_details USING (purchase_id)
  LEFT JOIN purchase_params USING (purchase_id)
  LEFT JOIN purchase_payment USING (purchase_id)
  LEFT JOIN payment_type USING (payment_type_id)
  LEFT JOIN employee USING (employee_id)
  LEFT JOIN customer USING (customer_id)
  LEFT JOIN currency USING (currency_id);


SELECT * FROM purchase_basic_web;