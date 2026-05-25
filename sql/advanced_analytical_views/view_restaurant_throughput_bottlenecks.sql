---Marketplace Operations wants to isolate hours where an explosion of demand creates kitchen bottlenecks.
---This matches processing hours to uncover capacity overload.---


CREATE OR ALTER VIEW dbo.view_restaurant_throughput_bottlenecks AS
WITH HourlySpikes AS (
    SELECT 
        fo.restaurant_id,
        DATEPART(HOUR, fo.order_timestamp) AS hour_of_day,
        COUNT(fo.order_id) AS hourly_orders_processed,
        SUM(fo.order_value_inr) AS hourly_revenue_generated,
        -- Benchmark: What is the median or average hourly order volume for this specific kitchen?
        AVG(COUNT(fo.order_id)) OVER(PARTITION BY fo.restaurant_id) AS historical_hourly_order_average
    FROM dbo.fact_orders fo
    GROUP BY fo.restaurant_id, DATEPART(HOUR, fo.order_timestamp)
)
SELECT 
    r.restaurant_name,
    r.cuisine_types,
    r.cost_category,
    hs.hour_of_day,
    hs.hourly_orders_processed,
    hs.hourly_revenue_generated,
    ROUND(hs.historical_hourly_order_average, 2) AS kitchen_historical_hourly_average,
    -- Logic evaluation
    CASE 
        WHEN hs.hourly_orders_processed > (hs.historical_hourly_order_average * 1.75) THEN 'KITCHEN OVERLOAD BOTTLENECK'
        WHEN hs.hourly_orders_processed < (hs.historical_hourly_order_average * 0.40) THEN 'UNUTILIZED RUNTIME CAPACITY'
        ELSE 'STABLE OPERATION'
    END AS throughput_capacity_status
FROM HourlySpikes hs
INNER JOIN dbo.dim_restaurants r ON hs.restaurant_id = r.restaurant_id;
GO
