DROP MATERIALIZED VIEW product_everything;

CREATE MATERIALIZED VIEW product_everything AS
     SELECT JSON_BUILD_OBJECT(
              'id', product_id,
              'outer_id', outer_id,
              'name', product.name,
              'company', (
                SELECT ROW_TO_JSON(company_table)
                  FROM (
					  SELECT company.*
					    FROM company
					    JOIN country USING (country_id)
					   WHERE company_id = product.company_id
				  ) AS company_table
              ),
              'brand', (
                SELECT ROW_TO_JSON(brand_table)
                  FROM (
				  	SELECT brand_id, name, description
					  FROM brand
					 WHERE brand_id = product.brand_id
				  ) AS brand_table
              ),
              'rating', (
                SELECT ROW_TO_JSON(rating_table)
                  FROM (
                    SELECT product_rating_id AS rating_id, rating_5 AS value, votes_number_5 AS votes_count
                      FROM product_rating
                     WHERE product_id = product.product_id
                  ) AS rating_table
              ),
              'price', (
                SELECT ROW_TO_JSON(price_table)
                  FROM (
				  	SELECT product_price_id AS price_id, diller_price AS diller, distr_price AS distr, wholesale_price AS wholesale, consumer_price AS consumer
					  FROM product_price
					 WHERE product_id = product.product_id
				  ) AS price_table
              ),
              'points', (
                SELECT ROW_TO_JSON(points_table)
                  FROM (
				  	SELECT product_point_id AS points_id, points_outer AS outer, points_inner AS inner, points_discount AS discount
					  FROM product_points
					 WHERE product_id = product.product_id
				  ) AS points_table
              ),
              'size', (
                SELECT ROW_TO_JSON(size_table)
                  FROM (
				  	SELECT product_size_id AS size_id, weight_g AS weight, length_cm AS length, width_cm AS width, height_cm AS height, packing_material_id
					  FROM product_size
					 WHERE product_id = product.product_id
				  ) AS size_table
              ),
              'data', (
                SELECT ROW_TO_JSON(data_table)
                  FROM (
				  	SELECT product_data_id AS data_id, product_form_id, has_dispenser, total_volume, items_total, item_volume, measure_unit_id
					  FROM product_data
					 WHERE product_id = product.product_id
				  ) AS data_table
              ),
		 	  'info', (
                SELECT ROW_TO_JSON(info_table)
                  FROM (
				  	SELECT product_info_id AS info_id, pros, advantages, active_ingredients, composition, application, contraindications, storing
					  FROM product_info
					 WHERE product_id = product.product_id
				  ) AS info_table
              )
            ) AS product
       FROM product;

SELECT * FROM product_everything;