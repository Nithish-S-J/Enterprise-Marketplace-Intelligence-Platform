CREATE OR ALTER VIEW dbo.vw_delivery_performance AS
SELECT 
    fd.delivery_id,
    fd.restaurant_id,
    fd.location_id,
    dl.city AS delivery_city,
    dl.area AS delivery_area,
    -- Courier Profile Data
    fd.delivery_person_id,
    fd.delivery_person_age,
    fd.delivery_person_rating,
    -- Operational Signatures
    fd.order_type,
    fd.vehicle_type,
    fd.delivery_time_minutes,
    -- SLA Breach Monitoring
    fd.sla_breach_flag,
    CASE 
        WHEN fd.sla_breach_flag = 'Y' THEN 1 
        ELSE 0 
    END AS is_sla_breached,
    fd.delivery_speed_category,
    fd.delivery_partner_performance
FROM dbo.fact_deliveries fd
LEFT JOIN dbo.dim_location  as dl 
  ON fd.location_id = dl.location_id
WHERE fd.delivery_id IS NOT NULL;
GO
