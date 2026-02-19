-- Dimension: products
SELECT
    product_id,
    product_name,
    category,
    price,
    CASE 
        WHEN price < 50 THEN 'Budget'
        WHEN price < 200 THEN 'Mid-Range'
        WHEN price < 500 THEN 'Premium'
        ELSE 'Luxury'
    END as price_tier
FROM {{ ref('stg_products') }}
