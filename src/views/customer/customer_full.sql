DROP MATERIALIZED VIEW customer_full;

CREATE MATERIALIZED VIEW customer_full AS
     SELECT customer_id,
            first_name,
            last_name,
            middle_name,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT customer_bio_id,
                         age,
                         birth_date,
                         gender.name AS gender,
                         family_status.name AS family_status,
                         has_children,
                         language.code AS language
                    FROM customer_bio
                    JOIN language USING (language_id)
                    JOIN family_status USING (family_status_id)
                    JOIN gender USING (gender_id)
                   WHERE customer.customer_id = customer_bio.customer_id
                ) AS row
            ) AS bio,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT customer_contacts_id,
                         phone,
                         email                         
                    FROM customer_contacts
                   WHERE customer.customer_id = customer_contacts.customer_id
                ) AS row
            ) AS contacts,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT customer_ship_addr_id,
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
                    FROM customer_ship_addr
                    JOIN country USING (country_id)
                    JOIN city USING (city_id)
                   WHERE customer.customer_id = customer_ship_addr.customer_id
                ) AS row
            ) AS address,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT customer_outer_distr_id,
                         company.abbr AS company,
                         distr_id,
                         sponsor_distr_id                         
                    FROM customer_outer_distr
                    JOIN company USING (company_id)
                   WHERE customer.customer_id = customer_outer_distr.customer_id
                ) AS row
            ) AS distr,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT customer_statistics_id,
                         purchase_first,
                         purchase_total,
                         item_total,
                         spent_total                     
                    FROM customer_statistics
                   WHERE customer.customer_id = customer_statistics.customer_id
                ) AS row
            ) AS stats,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT color_schema,
                         language,
                         currency               
                    FROM customer_prefs
                   WHERE customer.customer_id = customer_prefs.customer_id
                ) AS row
            ) AS prefs,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT chart,
                         wish_list,
                         last_seen               
                    FROM customer_session
                   WHERE customer.customer_id = customer_session.customer_id
                ) AS row
            ) AS session
            
       FROM customer;

SELECT * FROM customer_full;