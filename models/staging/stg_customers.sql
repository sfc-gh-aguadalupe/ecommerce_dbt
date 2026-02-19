-- Staging model: cleaned customers
SELECT
    customer_id,
    name as customer_name,
    email,
    created_at,
    region
FROM {{ source('ecommerce', 'customers') }}
