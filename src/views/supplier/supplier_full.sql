DROP MATERIALIZED VIEW supplier_full;

CREATE MATERIALIZED VIEW supplier_full AS
     SELECT supplier.supplier_id,
            supplier.name,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT company_id,
                         company.name AS name,
                         company.abbr AS abbr,
                         company.description AS description,
                         company.name AS company
                    FROM company
                   WHERE supplier.company_id = company.company_id
                ) AS row
            ) AS company,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT supplier_addr_id,
                         country.name AS name,
                         region,
                         city.name AS city
                    FROM supplier_addr
                    JOIN country USING (country_id)
                    JOIN city USING (city_id)
                   WHERE supplier.supplier_id = supplier_addr.supplier_id
                ) AS row
            ) AS address,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT supplier_contacts_id,
                         name,
                         phone,
                         email,
                         website
                    FROM supplier_contacts
                   WHERE supplier.supplier_id = supplier_contacts.supplier_id
                ) AS row
            ) AS contacts
       FROM supplier;

SELECT * FROM supplier_full;