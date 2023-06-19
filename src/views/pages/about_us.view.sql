DROP MATERIALIZED VIEW about_us_view;

CREATE MATERIALIZED VIEW about_us_view AS
     SELECT about_us_id,
            introduction,
            our_vision AS vision,
            our_mission AS mission,
            why_us,
            thanks,
            afterword,
            create_ts AS created
       FROM about_us
   ORDER BY about_us_id DESC;

SELECT * FROM about_us_view;