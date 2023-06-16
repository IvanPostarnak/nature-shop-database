DROP VIEW employee_prefs;

CREATE VIEW employee_prefs AS
  SELECT employee_preferences_id,
         employee_id,
         (
          SELECT ROW_TO_JSON(row)
            FROM (
              SELECT *
                FROM color_schema
               WHERE employee_preferences.color_schema_id = color_schema.color_schema_id
            ) AS row
         ) AS color_schema,
         (
          SELECT ROW_TO_JSON(row)
            FROM (
              SELECT *
                FROM language
               WHERE employee_preferences.language_id = language.language_id
            ) AS row
         ) AS language,
         (
          SELECT ROW_TO_JSON(row)
            FROM (
              SELECT *
                FROM currency
               WHERE employee_preferences.currency_id = currency.currency_id
            ) AS row
         ) AS currency
    FROM employee_preferences;


SELECT * FROM employee_prefs;