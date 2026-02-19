-- Staging model: cleaned order items
SELECT
    order_item_id,
    order_id,
    product_id,
    quantity,
    unit_price,
    quantity * unit_price as line_total
FROM {{ source('ecommerce', 'order_items') }}
