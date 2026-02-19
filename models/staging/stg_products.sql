-- Staging model: cleaned products
SELECT
    product_id,
    name as product_name,
    category,
    price
FROM {{ source('ecommerce', 'products') }}
