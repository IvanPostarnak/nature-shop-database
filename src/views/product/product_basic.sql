DROP MATERIALIZED VIEW product_basic;

CREATE MATERIALIZED VIEW product_basic AS
     SELECT product_id,
            product.name,
            company.abbr as company,
            brand.name as brand,
            product_points.points_inner as points,
            product_price.consumer_price as price,
            product_rating.rating_5 as rating,
            product_rating.votes_number_5 as votes_count
       FROM product
  LEFT JOIN company USING (company_id)
  LEFT JOIN brand USING (brand_id)
  LEFT JOIN product_points USING (product_id)
  LEFT JOIN product_price USING (product_id)
  LEFT JOIN product_rating USING (product_id);

SELECT * FROM product_basic;