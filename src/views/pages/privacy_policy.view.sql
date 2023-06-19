DROP MATERIALIZED VIEW privacy_policy_view;

CREATE MATERIALIZED VIEW privacy_policy_view AS
     SELECT privacy_policy_id,
            introduction,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT personal_info_collection AS collection,
                         personal_info_use AS use,
                         personal_info_disclosure AS disclosure
                    FROM privacy_policy
                   WHERE privacy_policy.privacy_policy_id = privacy_policy.privacy_policy_id
                ) AS row
            ) AS personal_info,
            security_measures,
            cookies,
            children_privacy,
            changes_policy AS changes,
            contact_email AS contact,
            afterword,
            create_ts AS created
       FROM privacy_policy
   ORDER BY privacy_policy_id DESC;

SELECT * FROM privacy_policy_view;