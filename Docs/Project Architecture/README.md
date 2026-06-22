# Project Architecture

This project follows a modern Microsoft Fabric analytics architecture to transform raw operational data into business-ready insights.

---

## Architecture Flow

Source Datasets
→ Lakehouse (Bronze Layer)
→ Dataflow Gen2
→ Silver Tables
→ Warehouse
→ SQL Modeling
→ Semantic Model
→ Power BI Reports

---

## 1. Source Datasets

Three datasets were used as the foundation of the analytics platform:

- Ecommerce Delivery Analytics
- Food Delivery Time Prediction
- Swiggy Restaurant Dataset

These datasets provide information related to orders, customers, deliveries, restaurants, ratings, and operational performance.

Screenshot:

![Lakehouse_raw_Preview](https://github.com/Nithish-S-J/Swiggy-Enterprise-Analytics-Platform/blob/main/Docs/Project%20Architecture/Lakehouse_raw.png)


---

## 2. Bronze Layer (Lakehouse)

The raw source files were loaded into Microsoft Fabric Lakehouse.

Purpose:
- Store original source data
- Preserve data lineage
- Enable future reprocessing

Artifacts:
- Ecommerce_Delivery_Analytics_New.csv
- Food Delivery Time Prediction Case Study.xlsx
- swiggy.csv
---

## 3. Dataflow Gen2

Dataflow Gen2 was used to ingest and transform raw data.

Activities:
- Data cleaning
- Data standardization
- Data type correction
- Business rule implementation
- Data quality validation

Screenshot:
![df_bronze_to_silver_Preview](https://github.com/Nithish-S-J/Swiggy-Enterprise-Analytics-Platform/blob/main/Docs/Project%20Architecture/df_bronze_to_silver.png)


---

## 4. Silver Layer

Cleaned and analytics-ready datasets were created.

Silver Tables:
- silver_orders
- silver_deliveries
- silver_restaurants

Purpose:
- Trusted analytical datasets
- Standardized business data
- Foundation for warehouse modeling

Screenshot:
![silver_layer_tables_Preview](https://github.com/Nithish-S-J/Swiggy-Enterprise-Analytics-Platform/blob/main/Docs/Project%20Architecture/silver_layer_tables.png)


---

## 5. Warehouse Layer

A Fabric Warehouse was used to build the enterprise data model.

Activities:
- Fact table creation
- Dimension table creation
- SQL transformations
- Business KPI preparation

Screenshot:
![Warehouse_goldlayer_sqlvws_Preview](https://github.com/Nithish-S-J/Swiggy-Enterprise-Analytics-Platform/blob/main/Docs/Project%20Architecture/Warehouse_goldlayer_sqlvws.png)


---

## 6. Data Modeling

A Star Schema model was implemented.

Dimension Tables:
- dim_date
- dim_customers
- dim_restaurants
- dim_location

Fact Tables:
- fact_orders
- fact_deliveries

Purpose:
- Optimized reporting
- Efficient analytical queries
- Scalable semantic modeling

---

## 7. Analytical SQL Layer

SQL views were created to support business reporting and KPI calculations.

Examples:
- Revenue Analysis
- Customer Intelligence
- Restaurant Performance
- Delivery Operations

Purpose:
- Reusable business logic
- Curated reporting datasets

---

## 8. Semantic Model

The warehouse model was connected to a Power BI Semantic Model.

Purpose:
- Centralized business definitions
- KPI management
- Relationship management
- Consistent reporting layer

---

## 9. Power BI Reporting

The semantic model was used to build executive dashboards.

Report Pages:
- Home
- Executive Overview
- Revenue Intelligence
- Customer Intelligence
- Restaurant Performance
- Delivery Operations
- Geographic Insights

---

## Business Outcome

The platform provides a unified view of:

- Revenue Performance
- Customer Behavior
- Restaurant Intelligence
- Delivery Operations
- Geographic Performance

enabling data-driven decision making across business and operational teams.
