DROP TABLE IF EXISTS dbo.dim_restaurants;
GO

CREATE TABLE dbo.dim_restaurants
(
    restaurant_id INT,
    restaurant_name VARCHAR(200),
    city VARCHAR(100),
    area VARCHAR(100),
    cuisine_types VARCHAR(500),
    average_rating DECIMAL(5,2),
    estimated_delivery_time INT,
    restaurant_rating_category VARCHAR(50),
    total_ratings INT,
    price INT,
    cost_category VARCHAR(50)
);
GO

INSERT INTO dbo.dim_restaurants

SELECT

    restaurant_id,
    restaurant_name,
    city,
    area,
    cuisine_types,
    average_rating,
    estimated_delivery_time,
    restaurant_rating_category,
    total_ratings,
    price,
    cost_category

FROM dbo.silver_restaurants;
GO
