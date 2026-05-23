CREATE VIEW vw_order_analytics AS

SELECT

    f.order_id,
    f.customer_id,

    f.order_date,
    f.order_timestamp,

    d.year,
    d.quarter,
    d.month,
    d.month_name,
    d.day_name,
    d.weekend_flag,

    c.total_orders,
    c.avg_order_value,
    c.avg_service_rating,
    c.platforms_used,
    c.customer_order_segment,
    c.customer_satisfaction_segment,

    f.platform,
    f.product_category,

    f.order_value_inr,
    f.delivery_time_minutes,

    f.service_rating,

    f.delivery_delay,
    f.refund_requested,

    f.sla_breach_flag,
    f.customer_sentiment

FROM fact_orders f

LEFT JOIN dim_date d
    ON CAST(f.order_date AS DATE) = d.full_date

LEFT JOIN dim_customers c
    ON f.customer_id = c.customer_id;
