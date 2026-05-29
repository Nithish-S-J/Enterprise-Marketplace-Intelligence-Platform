DROP TABLE IF EXISTS dbo.dim_date;
GO

CREATE TABLE dbo.dim_date
(
    full_date DATE NOT NULL,
    [year] INT,
    quarter_num INT,
    quarter_name VARCHAR(10),
    [month] INT,
    month_name VARCHAR(20),
    month_year VARCHAR(20),
    weekday_name VARCHAR(20),
    week_number INT,
    weekend_flag VARCHAR(10)
);
GO

INSERT INTO dbo.dim_date

SELECT DISTINCT

    order_date AS full_date,

    YEAR(order_date) AS [year],

    DATEPART(QUARTER, order_date) AS quarter_num,

    CONCAT('Q', DATEPART(QUARTER, order_date)) AS quarter_name,

    MONTH(order_date) AS [month],

    DATENAME(MONTH, order_date) AS month_name,

    FORMAT(order_date,'MMM yyyy') AS month_year,

    DATENAME(WEEKDAY, order_date) AS weekday_name,

    DATEPART(WEEK, order_date) AS week_number,

    CASE
        WHEN DATENAME(WEEKDAY, order_date) IN ('Saturday','Sunday')
        THEN 'Weekend'
        ELSE 'Weekday'
    END AS weekend_flag

FROM dbo.silver_orders
WHERE order_date IS NOT NULL;
GO
