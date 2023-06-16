DROP MATERIALIZED VIEW shipper_full;

CREATE MATERIALIZED VIEW shipper_full AS
     SELECT shipper.shipper_id,
            shipper.name,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT country.country_id,
                         country.name AS name,
                         city.name AS capital,
                         country.continent,
                         country.population_mil AS population,
                         language.code AS language,
                         currency.abbr AS currency
                    FROM country
                    JOIN city ON country.capital_city_id = city.city_id
                    JOIN language USING (language_id)
                    JOIN currency USING (currency_id)
                   WHERE shipper.country_id = country.country_id
                ) AS row
            ) AS country,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT shipper_contacts.shipper_contacts_id,
                         name,
                         phone,
                         email,
                         website
                    FROM shipper_contacts
                   WHERE shipper.shipper_id = shipper_contacts.shipper_id
                ) AS row
            ) AS contacts
       FROM shipper;

SELECT * FROM shipper_full;