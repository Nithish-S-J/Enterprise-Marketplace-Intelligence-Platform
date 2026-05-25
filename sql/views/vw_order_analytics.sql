CREATE OR ALTER VIEW dbo.vw_order_analytics AS
SELECT 
    fo.order_id,
    fo.customer_id,
    dc.customer_segment,
    dc.customer_type,
    fo.restaurant_id,
    fo.platform,
    fo.order_timestamp,
    fo.order_date,
    -- Core Financial Metrics
    ISNULL(fo.order_value_inr, 0.00) AS order_value_inr,
    -- Customer Satisfaction Analytics
    fo.service_rating,
    fo.customer_sentiment,
    -- Conditional KPIs & Flags
    fo.high_value_order_flag,
    fo.refund_requested,
    CASE 
        WHEN fo.refund_requested = 'Y' THEN fo.order_value_inr 
        ELSE 0.00 
    END AS revenue_at_risk_inr
FROM dbo.fact_orders fo
LEFT JOIN dbo.dim_customers as dc
  ON fo.customer_id = dc.customer_id
WHERE fo.order_id IS NOT NULL;
GO
