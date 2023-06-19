DROP MATERIALIZED VIEW our_contacts_view;

CREATE MATERIALIZED VIEW our_contacts_view AS
     SELECT our_contacts_id,
            introduction,
            body,
            phone,
            email,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT facebook_link AS facebook,
                         twitter_link AS twitter,
                         vk_link AS vk,
                         intagram_link AS intagram,
                         telegram_link AS telegram,
                         reddit_link AS reddit,
                         linkedin_link AS linkedin,
                         github_link AS github,
                         tiktok_link AS tiktok
                    FROM our_contacts
                   WHERE our_contacts.our_contacts_id = our_contacts.our_contacts_id
                ) AS row
            ) AS links,
            afterword,
            create_ts AS created
       FROM our_contacts
   ORDER BY our_contacts_id DESC;

SELECT * FROM our_contacts_view;