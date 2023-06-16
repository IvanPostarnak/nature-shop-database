DROP MATERIALIZED VIEW employee_basic_web;

CREATE MATERIALIZED VIEW employee_basic_web AS
   SELECT employee_id,
          CONCAT(first_name, ' ', last_name) AS name,
          employee_bio.age,
          gender.name AS gender,
          language.code AS language,
          employee_contacts.phone AS phone,
          employee_contacts.email AS email,
          employee_position.name AS position,
          employee_status.status
     FROM employee
LEFT JOIN employee_bio USING (employee_id)
LEFT JOIN employee_contacts USING (employee_id)
LEFT JOIN employee_state USING (employee_id)
LEFT JOIN employee_position ON employee_position.employee_position_id = employee_state.position_id
LEFT JOIN employee_status ON employee_status.employee_status_id = employee_state.status_id
LEFT JOIN gender USING (gender_id)
LEFT JOIN language USING (language_id);

SELECT * FROM employee_basic_web;