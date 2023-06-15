DROP MATERIALIZED VIEW product_full_web;

CREATE MATERIALIZED VIEW product_full_web AS
     SELECT product_id,
            outer_id,
            name,
            (
              SELECT ROW_TO_JSON(company_table)
                FROM (
                  SELECT company_id,
                         company.name AS name,
                         company.abbr AS abbr,
                         company.description AS description,
                         country.name AS country
                    FROM company
                    JOIN country USING (country_id)
                   WHERE company_id = product.company_id
                ) AS company_table
            ) AS company,
            (
              SELECT ROW_TO_JSON(brand_table)
                FROM (
                  SELECT brand_id,
                         name,
                         description
                    FROM brand
                   WHERE brand_id = product.brand_id
                ) AS brand_table
            ) AS brand,
            (
              SELECT ROW_TO_JSON(rating_table)
                FROM (
                  SELECT product_rating_id AS rating_id,
                         rating_5 AS value,
                         votes_number_5 AS votes_count
                    FROM product_rating
                   WHERE product_id = product.product_id
                ) AS rating_table
            ) AS rating,
            (
              SELECT ROW_TO_JSON(price_table)
                FROM (
                  SELECT product_price_id AS price_id,
                         diller_price AS diller,
                         distr_price AS distr,
                         wholesale_price AS wholesale,
                         consumer_price AS consumer
                    FROM product_price
                   WHERE product_id = product.product_id
                ) AS price_table
            ) AS price,
            (
              SELECT ROW_TO_JSON(points_table)
                FROM (
                  SELECT product_point_id AS points_id,
                         points_outer AS outer,
                         points_inner AS inner,
                         points_discount AS discount
                    FROM product_points
                   WHERE product_id = product.product_id
                ) AS points_table
            ) AS points,
            (
              SELECT ROW_TO_JSON(size_table)
                FROM (
                  SELECT product_size_id AS size_id,
                         weight_g AS weight,
                         length_cm AS length,
                         width_cm AS width,
                         height_cm AS height,
                         packing_material.name AS packing_material
                    FROM product_size
                    JOIN packing_material USING (packing_material_id)
                   WHERE product_id = product.product_id
                ) AS size_table
            ) AS size,
            (
              SELECT ROW_TO_JSON(data_table)
                FROM (
                  SELECT product_data_id AS data_id,
                         product_form_id,
                         has_dispenser,
                         total_volume,
                         items_total,
                         item_volume,
                         measure_unit.abbr AS measure_unit
                    FROM product_data
                    JOIN measure_unit USING (measure_unit_id)
                   WHERE product_id = product.product_id
                ) AS data_table
            ) AS data,
		 	      (
              SELECT ROW_TO_JSON(info_table)
                FROM (
                  SELECT product_info_id AS info_id,
                         pros, advantages,
                         active_ingredients,
                         composition,
                         application,
                         contraindications,
                         storing
                    FROM product_info
                   WHERE product_id = product.product_id
                ) AS info_table
            ) AS info,
            (
              SELECT ROW_TO_JSON(shop_table)
                FROM (
                  SELECT shop_id,
                         units_in_stock
                    FROM shop_product
                   WHERE shop_product.product_id = product.product_id AND shop_product.shop_id = 1
                ) AS shop_table
            ) AS shop
       FROM product;

SELECT * FROM product_full_web;