DROP VIEW customer_prefs;

CREATE VIEW customer_prefs AS
  SELECT customer_id,
         (
          SELECT ROW_TO_JSON(row)
            FROM (
              SELECT *
                FROM color_schema
               WHERE customer_preferences.color_schema_id = color_schema.color_schema_id
            ) AS row
         ) AS color_schema,
         (
          SELECT ROW_TO_JSON(row)
            FROM (
              SELECT *
                FROM language
               WHERE customer_preferences.language_id = language.language_id
            ) AS row
         ) AS language,
         (
          SELECT ROW_TO_JSON(row)
            FROM (
              SELECT *
                FROM currency
               WHERE customer_preferences.currency_id = currency.currency_id
            ) AS row
         ) AS currency,
    FROM customer_preferences;


SELECT * FROM customer_prefs;