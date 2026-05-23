CREATE TABLE fact_orders AS
SELECT
    order_id,
    customer_id,
    order_date,
    order_timestamp,
    platform,
    product_category,
    order_value_inr,
    delivery_time_minutes,
    service_rating,
    delivery_delay,
    refund_requested,
    sla_breach_flag,
    customer_sentiment
FROM silver_orders;
