CREATE TABLE dim_customers AS

SELECT
    customer_id,

    COUNT(order_id) AS total_orders,

    AVG(order_value_inr) AS avg_order_value,

    AVG(service_rating) AS avg_service_rating,

    CASE
        WHEN COUNT(order_id) >= 20 THEN 'High Value'
        WHEN COUNT(order_id) >= 10 THEN 'Regular'
        ELSE 'Occasional'
    END AS customer_segment

FROM silver_orders

GROUP BY customer_id;
