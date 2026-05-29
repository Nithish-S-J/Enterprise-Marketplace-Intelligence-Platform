# Semantic Model Architecture

## Overview

The semantic model was designed using enterprise-grade star schema principles to support scalable Power BI reporting, KPI engineering, and executive analytics.

The model was built in Microsoft Fabric using Direct Lake semantic modeling.

---

#scemantice_model_preview

![scemantic_model_preview](https://github.com/Nithish-S-J/Swiggy-Enterprise-Analytics-Platform/blob/main/fabric/scemantic_model/new_scemantic_model.png)

# Model Architecture

## Fact Tables

### fact_orders
Contains transactional order-level metrics.

Key metrics:
- Revenue
- Delivery Time
- Service Ratings
- SLA Breach Indicators
- Refund Flags

### fact_deliveries
Contains operational delivery-level information.

Key metrics:
- Delivery Performance
- Vehicle Analysis
- Delivery Partner Ratings
- SLA Monitoring

---

## Dimension Tables

### dim_customers
Customer segmentation and customer classification attributes.

### dim_date
Central calendar dimension supporting:
- Time intelligence
- Monthly trends
- YTD/QTD/MTD reporting
- Executive KPI tracking

### dim_restaurants
Restaurant marketplace attributes including:
- Cuisine categories
- Price tiers
- Restaurant ratings

### dim_location
Geographical hierarchy for:
- City analytics
- Regional delivery analysis
- Operational reporting

---

# Relationships

| From Table | Column | To Table | Column |
|---|---|---|---|
| dim_customers | customer_id | fact_orders | customer_id |
| dim_date | full_date | fact_orders | order_date |
| dim_restaurants | restaurant_id | fact_orders | restaurant_id |
| dim_location | location_id | fact_deliveries | location_id |

---

# Modeling Best Practices Applied

- Star schema architecture
- One-to-many relationships
- Single direction filtering
- Separation of facts and dimensions
- Dedicated measure table for KPI calculations
- Reusable semantic business layer
- Enterprise-ready naming conventions

---

# Business Purpose

The semantic model supports:

- Executive dashboards
- Revenue intelligence
- Delivery SLA analytics
- Customer intelligence
- Restaurant marketplace analysis
- Operational KPI reporting

---

# Technology Stack

- Microsoft Fabric
- Power BI Semantic Model
- Direct Lake Mode
- SQL Warehouse
- DAX
