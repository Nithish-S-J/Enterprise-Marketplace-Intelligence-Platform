DROP TABLE IF EXISTS dbo.dim_customers;
GO

CREATE TABLE dbo.dim_customers (
    customer_id VARCHAR(100) NOT NULL,
    customer_segment VARCHAR(50),
    customer_type VARCHAR(50)
);
GO

INSERT INTO dbo.dim_customers
SELECT 
    customer_id,
    CASE 
        WHEN SUM(order_value_inr) > 12000 THEN 'Platinum VIP'
        WHEN COUNT(order_id) > 10 THEN 'High Frequency'
        ELSE 'Standard'
    END AS customer_segment,
    CASE 
        WHEN COUNT(order_id) = 1 THEN 'New Customer'
        ELSE 'Repeat Customer'
    END AS customer_type
FROM dbo.silver_orders
GROUP BY customer_id;
GO
