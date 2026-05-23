-------------------------------------------------------create_dim_date---------------------------------------------------------

CREATE TABLE dim_date
(
    date_key INT,
    full_date DATE,
    year INT,
    quarter INT,
    month INT,
    month_name VARCHAR(20),
    day_of_month INT,
    day_name VARCHAR(20),
    weekday_number INT,
    weekend_flag VARCHAR(10)
);


-------------------------------------------------------------------------------------------------------------------------------------------------------
#insert below query


WITH numbers AS
(
    SELECT 0 AS n
    UNION ALL SELECT 1
    UNION ALL SELECT 2
    UNION ALL SELECT 3
    UNION ALL SELECT 4
    UNION ALL SELECT 5
    UNION ALL SELECT 6
    UNION ALL SELECT 7
    UNION ALL SELECT 8
    UNION ALL SELECT 9
)

INSERT INTO dim_date
SELECT
    CAST(FORMAT(DATEADD(DAY,
        ROW_NUMBER() OVER (ORDER BY a.n) - 1,
        '2025-01-01'),'yyyyMMdd') AS INT),

    DATEADD(DAY,
        ROW_NUMBER() OVER (ORDER BY a.n) - 1,
        '2025-01-01'),

    YEAR(DATEADD(DAY,
        ROW_NUMBER() OVER (ORDER BY a.n) - 1,
        '2025-01-01')),

    DATEPART(QUARTER,
        DATEADD(DAY,
        ROW_NUMBER() OVER (ORDER BY a.n) - 1,
        '2025-01-01')),

    MONTH(DATEADD(DAY,
        ROW_NUMBER() OVER (ORDER BY a.n) - 1,
        '2025-01-01')),

    DATENAME(MONTH,
        DATEADD(DAY,
        ROW_NUMBER() OVER (ORDER BY a.n) - 1,
        '2025-01-01')),

    DAY(DATEADD(DAY,
        ROW_NUMBER() OVER (ORDER BY a.n) - 1,
        '2025-01-01')),

    DATENAME(WEEKDAY,
        DATEADD(DAY,
        ROW_NUMBER() OVER (ORDER BY a.n) - 1,
        '2025-01-01')),

    DATEPART(WEEKDAY,
        DATEADD(DAY,
        ROW_NUMBER() OVER (ORDER BY a.n) - 1,
        '2025-01-01')),

    CASE
        WHEN DATENAME(WEEKDAY,
            DATEADD(DAY,
            ROW_NUMBER() OVER (ORDER BY a.n) - 1,
            '2025-01-01'))
        IN ('Saturday','Sunday')
        THEN 'Weekend'
        ELSE 'Weekday'
    END

FROM numbers a
CROSS JOIN numbers b
CROSS JOIN numbers c;
