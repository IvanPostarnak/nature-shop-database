DROP MATERIALIZED VIEW product_basic_web;

CREATE MATERIALIZED VIEW product_basic_web AS
     SELECT product_id,
            product.name,
            company.abbr as company,
            brand.name as brand,
            product_points.points_inner as points,
            product_price.consumer_price as price,
            product_rating.rating_5 as rating,
            product_rating.votes_number_5 as votes_count,
            units_in_stock
       FROM product
  LEFT JOIN company USING (company_id)
  LEFT JOIN brand USING (brand_id)
  LEFT JOIN product_points USING (product_id)
  LEFT JOIN product_price USING (product_id)
  LEFT JOIN product_rating USING (product_id)
  LEFT JOIN shop_product USING (product_id)
      WHERE shop_product.shop_id = 1;

SELECT * FROM product_basic_web;