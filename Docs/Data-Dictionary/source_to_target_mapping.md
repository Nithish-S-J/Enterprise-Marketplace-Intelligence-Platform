# Source to Target Mapping

| Source File | Key Columns | Business Purpose | Target Layer |
|-------------|-------------|------------------|--------------|
| swiggy.csv | restaurant_name, city, rating | Restaurant analytics | dim_restaurant |
| Ecommerce_Delivery_Analytics_New.csv | order_id, customer_id, order_value | Revenue & customer analytics | fact_orders |
| Food Delivery Time Prediction Case Study.xlsx | delivery_time, distance, traffic | Delivery SLA analytics | fact_deliveries |
