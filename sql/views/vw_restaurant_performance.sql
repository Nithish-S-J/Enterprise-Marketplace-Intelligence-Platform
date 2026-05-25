CREATE OR ALTER VIEW dbo.vw_restaurant_performance AS
SELECT 
    dr.restaurant_id,
    dr.restaurant_name,
    dr.cuisine_types,
    dr.average_rating AS restaurant_avg_rating,
    dr.restaurant_rating_category,
    dr.total_ratings AS historical_rating_count,
    -- Commercial Tiers
    dr.price_tier,
    dr.cost_category,
    -- Operational Status derived from historical performance markers
    CASE 
        WHEN dr.average_rating >= 4.5 THEN 'Top Tier Partner'
        WHEN dr.average_rating >= 3.5 THEN 'Standard Partner'
        ELSE 'Needs Operational Review'
    END AS partner_strategic_tier
FROM dbo.dim_restaurants dr
WHERE dr.restaurant_id IS NOT NULL;
GO
