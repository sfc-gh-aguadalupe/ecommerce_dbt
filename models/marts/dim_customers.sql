-- Dimension: customers
SELECT
    customer_id,
    customer_name,
    email,
    created_at,
    region,
    DATEDIFF('day', created_at, CURRENT_TIMESTAMP()) as customer_age_days
FROM {{ ref('stg_customers') }}
