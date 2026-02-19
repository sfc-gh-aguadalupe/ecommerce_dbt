-- Mart: customer lifetime value
SELECT
    c.customer_id,
    c.customer_name,
    c.region,
    c.customer_age_days,
    COUNT(DISTINCT o.order_id) as total_orders,
    SUM(o.calculated_total) as lifetime_revenue,
    AVG(o.calculated_total) as avg_order_value,
    MIN(o.order_date) as first_order_date,
    MAX(o.order_date) as last_order_date,
    DATEDIFF('day', MIN(o.order_date), MAX(o.order_date)) as customer_tenure_days
FROM {{ ref('dim_customers') }} c
LEFT JOIN {{ ref('fct_orders') }} o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, c.region, c.customer_age_days
