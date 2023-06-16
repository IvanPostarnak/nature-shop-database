DROP MATERIALIZED VIEW employee_full_web;

CREATE MATERIALIZED VIEW employee_full_web AS
     SELECT employee.employee_id,
            employee.first_name,
            employee.last_name,
            employee.middle_name,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT employee_bio.employee_bio_id,
                         birth_date,
                         gender.name AS gender,
                         language.code AS language
                    FROM employee_bio
                    JOIN gender USING (gender_id)
                    JOIN family_status USING (family_status_id)
                    JOIN language USING (language_id)
                   WHERE employee.employee_id = employee_bio.employee_id
                ) AS row
            ) AS bio,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT employee_contacts.employee_contacts_id,
                         email
                    FROM employee_contacts
                   WHERE employee.employee_id = employee_contacts.employee_id
                ) AS row
            ) AS contacts,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT employee_prefs.employee_preferences_id,
                         color_schema,
                         language,
                         currency
                    FROM employee_prefs
                   WHERE employee.employee_id = employee_prefs.employee_id
                ) AS row
            ) AS prefs,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT employee_shift.employee_shift_id,
                         shop_id,
                         (
                          SELECT CONCAT(first_name, ' ', last_name)
                            FROM employee
                           WHERE employee.employee_id = employee_shift.manager_id
                         ) AS manager
                    FROM employee_shift
                   WHERE employee.employee_id = employee_shift.employee_id
                ) AS row
            ) AS shift,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT employee_state.employee_state_id,
                         employee_position.name AS position,
                         employee_status.status
                    FROM employee_state
                    JOIN employee_position ON employee_state.position_id = employee_position.employee_position_id
                    JOIN employee_contract_type ON employee_state.contract_type_id = employee_contract_type.employee_contract_type_id
                    JOIN employee_status ON employee_state.status_id = employee_status.employee_status_id
                    JOIN employee_access_level ON employee_state.access_level_id = employee_access_level.employee_access_level_id
                   WHERE employee.employee_id = employee_state.employee_id
                ) AS row
            ) AS state
       FROM employee;

SELECT * FROM employee_full_web;