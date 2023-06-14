DROP VIEW customer_session;

CREATE VIEW customer_session AS
  SELECT customer_id, chart, wish_list, last_seen
    FROM customer_preferences;


SELECT * FROM customer_session;