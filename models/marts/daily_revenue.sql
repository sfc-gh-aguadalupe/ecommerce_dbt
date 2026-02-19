-- Mart: daily revenue aggregation
SELECT
    DATE_TRUNC('day', o.order_date) as revenue_date,
    COUNT(DISTINCT o.order_id) as order_count,
    COUNT(DISTINCT o.customer_id) as unique_customers,
    SUM(o.calculated_total) as total_revenue,
    AVG(o.calculated_total) as avg_order_value
FROM {{ ref('fct_orders') }} o
GROUP BY DATE_TRUNC('day', o.order_date)
ORDER BY revenue_date
