DROP TABLE IF EXISTS dbo.dim_date;
GO

CREATE TABLE dbo.dim_date (
    full_date DATE NOT NULL,
    [year] INT,
    quarter INT,
    [month] INT,
    month_name VARCHAR(20),
    weekday VARCHAR(20),
    week_number INT
);
GO

INSERT INTO dbo.dim_date
SELECT DISTINCT
    order_date AS full_date,
    DATEPART(YEAR, order_date) AS [year],
    DATEPART(QUARTER, order_date) AS quarter,
    DATEPART(MONTH, order_date) AS [month],
    DATENAME(MONTH, order_date) AS month_name,
    DATENAME(WEEKDAY, order_date) AS weekday,
    DATEPART(WEEK, order_date) AS week_number
FROM dbo.silver_orders
WHERE order_date IS NOT NULL;
GO
