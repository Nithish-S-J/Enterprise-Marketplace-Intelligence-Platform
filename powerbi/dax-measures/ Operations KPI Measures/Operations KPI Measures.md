# Operations KPI Measures

## Overview

Operations KPI Measures provide visibility into delivery efficiency, SLA compliance, logistics performance, and operational excellence.

These measures support:

- Operations Dashboard
- SLA Monitoring
- Delivery Performance Analysis
- Logistics Intelligence
- Executive Operations Reporting

Display Folder:

```text
Operations KPIs
```

---

# 1. Total Deliveries

## DAX

```DAX
Total Deliveries =
COUNT ( fact_deliveries[delivery_id] )
```

## Business Purpose

Measures total completed deliveries.

Used for:

- Operations Monitoring
- Capacity Analysis
- Logistics Reporting

---

# 2. Average Delivery Duration

## DAX

```DAX
Average Delivery Duration =
AVERAGE (
    fact_deliveries[delivery_time_minutes]
)
```

## Format

```text
Decimal Number
1 Decimal Place
```

## Business Purpose

Measures average delivery completion time.

Used for:

- Efficiency Monitoring
- Service Performance Analysis

---

# 3. Average Delivery Partner Rating

## DAX

```DAX
Average Delivery Partner Rating =
AVERAGE (
    fact_deliveries[delivery_person_rating]
)
```

## Format

```text
Decimal Number
2 Decimal Places
```

## Business Purpose

Measures overall delivery partner performance.

Used for:

- Partner Quality Monitoring
- Operational Excellence Programs

---

# 4. SLA Breach Deliveries

## DAX

```DAX
SLA Breach Deliveries =
CALCULATE (
    COUNTROWS ( fact_deliveries ),
    fact_deliveries[sla_breach_flag] = "Yes"
)
```

## Business Purpose

Measures deliveries breaching SLA targets.

Used for:

- SLA Monitoring
- Operations Reviews

---

# 5. SLA Compliance %

## DAX

```DAX
SLA Compliance % =
1 - DIVIDE (
    [SLA Breach Deliveries],
    [Total Deliveries]
)
```

## Format

```text
Percentage
2 Decimal Places
```

## Business Purpose

Measures percentage of deliveries completed within SLA.

Used for:

- Executive KPI Reporting
- Delivery Operations Dashboard

---

# 6. SLA Breach %

## DAX

```DAX
SLA Breach % =
DIVIDE (
    [SLA Breach Deliveries],
    [Total Deliveries]
)
```

## Format

```text
Percentage
2 Decimal Places
```

## Business Purpose

Measures percentage of delayed deliveries.

Used for:

- Root Cause Analysis
- Operational Monitoring

---

# 7. Fast Deliveries

## DAX

```DAX
Fast Deliveries =
CALCULATE (
    COUNTROWS ( fact_deliveries ),
    fact_deliveries[delivery_speed_category] = "Fast"
)
```

## Business Purpose

Tracks high-performing deliveries.

Used for:

- Operational Excellence Tracking

---

# 8. Fast Delivery %

## DAX

```DAX
Fast Delivery % =
DIVIDE (
    [Fast Deliveries],
    [Total Deliveries]
)
```

## Format

```text
Percentage
2 Decimal Places
```

---

# 9. Average Deliveries Per Partner

## DAX

```DAX
Average Deliveries Per Partner =
DIVIDE (
    [Total Deliveries],
    DISTINCTCOUNT (
        fact_deliveries[delivery_person_id]
    )
)
```

## Business Purpose

Measures partner productivity.

Used for:

- Workforce Planning
- Logistics Capacity Analysis

---

# 10. Delivery Efficiency Score

## DAX

```DAX
Delivery Efficiency Score =
(
    [SLA Compliance %] * 0.7
)
+
(
    DIVIDE (
        [Average Delivery Partner Rating],
        5
    ) * 0.3
)
```

## Format

```text
Percentage
2 Decimal Places
```

## Business Purpose

Composite operational health score.

Used for:

- Executive Operations Dashboard
- Performance Benchmarking

---

# Operations KPI Summary

| KPI | Purpose |
|------|----------|
| Total Deliveries | Delivery volume |
| Average Delivery Duration | Operational efficiency |
| Average Delivery Partner Rating | Partner quality |
| SLA Breach Deliveries | Delayed deliveries |
| SLA Compliance % | Service reliability |
| SLA Breach % | Delay monitoring |
| Fast Deliveries | Operational excellence |
| Fast Delivery % | Speed performance |
| Average Deliveries Per Partner | Workforce productivity |
| Delivery Efficiency Score | Overall operations score |

---

# Semantic Model Structure

```text
_MEASURES

├── Executive KPIs
├── Revenue KPIs
│
└── Operations KPIs
    ├── Total Deliveries
    ├── Average Delivery Duration
    ├── Average Delivery Partner Rating
    ├── SLA Breach Deliveries
    ├── SLA Compliance %
    ├── SLA Breach %
    ├── Fast Deliveries
    ├── Fast Delivery %
    ├── Average Deliveries Per Partner
    └── Delivery Efficiency Score
```
