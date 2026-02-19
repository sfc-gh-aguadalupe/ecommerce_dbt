-- Fact table: orders with line items
SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.status,
    COUNT(oi.order_item_id) as item_count,
    SUM(oi.quantity) as total_quantity,
    SUM(oi.line_total) as calculated_total
FROM {{ ref('stg_orders') }} o
LEFT JOIN {{ ref('stg_order_items') }} oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.customer_id, o.order_date, o.status
