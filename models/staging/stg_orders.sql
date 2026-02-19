-- Staging model: cleaned orders
SELECT
    order_id,
    customer_id,
    order_date,
    total_amount,
    status
FROM {{ source('ecommerce', 'orders') }}
