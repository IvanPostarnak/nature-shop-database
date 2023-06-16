DROP VIEW employee_addr;

CREATE VIEW employee_addr AS
     SELECT employee.employee_id,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT employee_addr_liv.employee_addr_liv_id,
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
                    FROM employee_addr_liv
                    JOIN country USING (country_id)
                    JOIN city USING (city_id)
                   WHERE employee.employee_id = employee_addr_liv.employee_id
                ) AS row
            ) AS living,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT employee_addr_reg.employee_addr_reg_id,
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
                    FROM employee_addr_reg
                    JOIN country USING (country_id)
                    JOIN city USING (city_id)
                   WHERE employee.employee_id = employee_addr_reg.employee_id
                ) AS row
            ) AS registration
       FROM employee;

SELECT * FROM employee_addr;