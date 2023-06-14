DROP MATERIALIZED VIEW customer_basic;

CREATE MATERIALIZED VIEW customer_basic AS
   SELECT customer_id,
          first_name,
          last_name,
          age,
          gender.name AS gender,
          language.code AS language,
          phone,
          email,
          country.name AS country,
          city.name AS city
     FROM customer
LEFT JOIN customer_bio USING (customer_id)
LEFT JOIN customer_contacts USING (customer_id)
LEFT JOIN customer_ship_addr USING (customer_id)
LEFT JOIN gender USING (gender_id)
LEFT JOIN language USING (language_id)
LEFT JOIN country USING (country_id)
LEFT JOIN city USING (city_id);         

SELECT * FROM customer_basic;