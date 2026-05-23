CREATE TABLE dim_restaurants
AS

SELECT

    restaurant_id,
    restaurant_name,
    city,
    area,
    cuisine_types,

    average_rating,
    restaurant_rating_category,

    total_ratings,

    price,
    cost_category,

    estimated_delivery_time_minutes,

    CASE
        WHEN average_rating >= 4.5 THEN 'Top Performer'
        WHEN average_rating >= 4 THEN 'Strong Performer'
        ELSE 'Average Performer'
    END AS restaurant_performance_segment

FROM silver_restaurants;
