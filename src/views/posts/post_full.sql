DROP MATERIALIZED VIEW post_full;

CREATE MATERIALIZED VIEW post_full AS
     SELECT post.post_id,
            post.title,
            post.content,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT *
                    FROM employee
                   WHERE post.author_id = employee.employee_id
                ) AS row
            ) AS author,
            (
              SELECT ROW_TO_JSON(row)
                FROM (
                  SELECT *
                    FROM language
                   WHERE post.language_id = language.language_id
                ) AS row
            ) AS language,
            post.rating_5 AS rating,
            post.votes_number_5 AS votes_count,
            post.visited_total AS visited_total,
            post.create_ts AS created,
            post.edit_ts AS edited
       FROM post;

SELECT * FROM post_full;