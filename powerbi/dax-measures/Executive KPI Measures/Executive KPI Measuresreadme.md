# Executive KPI Measures

## Overview

The Executive KPI Measures layer forms the foundation of the **Swiggy Enterprise Analytics Semantic Model**.

These measures are designed to support:

- Executive Dashboard Reporting
- Business Performance Monitoring
- Revenue Intelligence
- Operational Analytics
- Customer Experience Tracking
- PL-300 Best Practices
- Enterprise Power BI Reporting

All measures are stored in the dedicated:

```text
_MEASURES
```

table within the semantic model.

---

# Measure Category

```text
Executive KPIs
```

---

# 1. Total Revenue

## DAX

```DAX
Total Revenue =
SUM ( fact_orders[order_value_inr] )
```

## Format

```text
Currency (INR)
Decimal Places: 2
```

## Business Purpose

Measures total platform revenue generated from all customer orders.

Used for:

- Executive KPI Cards
- Revenue Trend Analysis
- Platform Benchmarking
- Financial Reporting

---

# 2. Total Orders

## DAX

```DAX
Total Orders =
COUNT ( fact_orders[order_id] )
```

## Format

```text
Whole Number
```

## Business Purpose

Measures total number of completed customer orders.

Used for:

- Order Volume Tracking
- Demand Analysis
- Growth Monitoring

---

# 3. Average Order Value (AOV)

## DAX

```DAX
Average Order Value =
DIVIDE (
    [Total Revenue],
    [Total Orders]
)
```

## Format

```text
Currency (INR)
Decimal Places: 2
```

## Business Purpose

Measures average revenue generated per order.

Used for:

- Basket Size Analysis
- Revenue Optimization
- Customer Spending Analysis

---

# 4. Average Delivery Time

## DAX

```DAX
Average Delivery Time =
AVERAGE (
    fact_orders[delivery_time_minutes]
)
```

## Format

```text
Decimal Number
1 Decimal Place
```

## Business Purpose

Measures average order delivery duration.

Used for:

- Operations Monitoring
- Delivery Performance Tracking
- SLA Evaluation

---

# 5. Average Service Rating

## DAX

```DAX
Average Service Rating =
AVERAGE (
    fact_orders[service_rating]
)
```

## Format

```text
Decimal Number
2 Decimal Places
```

## Business Purpose

Measures overall customer satisfaction.

Used for:

- Customer Experience Monitoring
- Service Quality Analysis
- Executive Reporting

---

# 6. Refunded Orders

## DAX

```DAX
Refunded Orders =
CALCULATE (
    COUNTROWS ( fact_orders ),
    fact_orders[refund_requested] = "Yes"
)
```

## Format

```text
Whole Number
```

## Business Purpose

Measures total refunded orders.

Used for:

- Refund Monitoring
- Customer Issue Analysis
- Operational Risk Reporting

---

# 7. Refund Rate %

## DAX

```DAX
Refund Rate % =
DIVIDE (
    [Refunded Orders],
    [Total Orders]
)
```

## Format

```text
Percentage
2 Decimal Places
```

## Business Purpose

Measures percentage of refunded orders.

Used for:

- Customer Experience Analytics
- Quality Assurance Monitoring
- Executive KPI Reporting

---

# 8. SLA Breach Orders

## DAX

```DAX
SLA Breach Orders =
CALCULATE (
    COUNTROWS ( fact_orders ),
    fact_orders[sla_breach_flag] = "Yes"
)
```

## Format

```text
Whole Number
```

## Business Purpose

Measures total orders breaching delivery SLA.

Used for:

- Operations Performance Monitoring
- Logistics Analysis
- Delivery Excellence Reporting

---

# 9. SLA Breach %

## DAX

```DAX
SLA Breach % =
DIVIDE (
    [SLA Breach Orders],
    [Total Orders]
)
```

## Format

```text
Percentage
2 Decimal Places
```

## Business Purpose

Measures percentage of orders breaching SLA.

Used for:

- Executive Operations Dashboard
- SLA Compliance Monitoring
- Delivery Performance Reviews

---

# 10. High Value Orders

## DAX

```DAX
High Value Orders =
CALCULATE (
    COUNTROWS ( fact_orders ),
    fact_orders[high_value_order_flag] = "High"
)
```

## Format

```text
Whole Number
```

## Business Purpose

Measures total high-value orders.

Used for:

- Premium Customer Analysis
- Revenue Segmentation
- Business Growth Monitoring

---

# 11. High Value Order %

## DAX

```DAX
High Value Order % =
DIVIDE (
    [High Value Orders],
    [Total Orders]
)
```

## Format

```text
Percentage
2 Decimal Places
```

## Business Purpose

Measures contribution of high-value orders to total order volume.

Used for:

- Executive Revenue Analysis
- Customer Value Segmentation
- Strategic Planning

---

# Executive KPI Summary

| KPI | Purpose |
|------|----------|
| Total Revenue | Overall business revenue |
| Total Orders | Demand and transaction volume |
| Average Order Value | Customer spending behavior |
| Average Delivery Time | Operational efficiency |
| Average Service Rating | Customer satisfaction |
| Refunded Orders | Customer issue tracking |
| Refund Rate % | Refund performance monitoring |
| SLA Breach Orders | Delivery operations tracking |
| SLA Breach % | SLA compliance monitoring |
| High Value Orders | Premium order tracking |
| High Value Order % | Revenue segmentation analysis |

---

# Enterprise Reporting Usage

These measures power:

```text
Executive Overview Dashboard
Revenue Intelligence Dashboard
Operations Performance Dashboard
Customer Intelligence Dashboard
Platform Benchmark Dashboard
Restaurant Performance Dashboard
```

---

# Semantic Model Structure

```text
_MEASURES
│
├── Executive KPIs
│   ├── Total Revenue
│   ├── Total Orders
│   ├── Average Order Value
│   ├── Average Delivery Time
│   ├── Average Service Rating
│   ├── Refunded Orders
│   ├── Refund Rate %
│   ├── SLA Breach Orders
│   ├── SLA Breach %
│   ├── High Value Orders
│   └── High Value Order %
```

These Executive KPIs represent the foundational business metrics used across all executive and operational reporting within the Swiggy Enterprise Analytics Platform.
