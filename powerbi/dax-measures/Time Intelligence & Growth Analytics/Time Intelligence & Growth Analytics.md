# Time Intelligence & Growth Analytics Measures

## Overview

The Time Intelligence & Growth Analytics layer extends traditional date-based reporting by introducing advanced trend analysis, growth monitoring, rolling performance evaluation, and executive forecasting signals.

Unlike standard MTD/YTD calculations, these measures focus on:

- Revenue Momentum
- Growth Acceleration
- Trend Detection
- Executive Forecasting
- Performance Benchmarking

Display Folder:

```text
Time Intelligence
```

---

# Business Problem Statements

### Executive Challenge

Revenue may be increasing, but:

- Is growth accelerating?
- Is growth slowing down?
- Are we outperforming recent trends?
- Are we heading toward a weak quarter?
- Are customer spending patterns improving?

Traditional KPIs do not answer these questions.

These measures are designed to provide early-warning signals and growth intelligence.

---

# 1. Previous Month Revenue

## DAX

```DAX
Previous Month Revenue =
VAR PreviousMonthRevenue =
    CALCULATE (
        [Total Revenue],
        DATEADD (
            dim_date[full_date],
            -1,
            MONTH
        )
    )

RETURN
    PreviousMonthRevenue
```

## Business Purpose

Provides baseline revenue for month-over-month comparisons.

---

# 2. Revenue Growth %

## DAX

```DAX
Revenue Growth % =
VAR CurrentRevenue =
    [Total Revenue]

VAR PreviousRevenue =
    [Previous Month Revenue]

RETURN

    DIVIDE (
        CurrentRevenue - PreviousRevenue,
        PreviousRevenue
    )
```

## Business Purpose

Measures monthly business growth.

Executive Use:

- Growth Reporting
- Board Reviews
- Performance Monitoring

---

# 3. Rolling 3-Month Revenue

## DAX

```DAX
Rolling 3M Revenue =
VAR RollingRevenue =

    CALCULATE (
        [Total Revenue],

        DATESINPERIOD (
            dim_date[full_date],
            MAX ( dim_date[full_date] ),
            -3,
            MONTH
        )
    )

RETURN
    RollingRevenue
```

## Business Purpose

Reduces monthly volatility.

Executive Use:

- Trend Monitoring
- Revenue Stability Analysis

---

# 4. Rolling 12-Month Revenue

## DAX

```DAX
Rolling 12M Revenue =
VAR RollingRevenue =

    CALCULATE (
        [Total Revenue],

        DATESINPERIOD (
            dim_date[full_date],
            MAX ( dim_date[full_date] ),
            -12,
            MONTH
        )
    )

RETURN
    RollingRevenue
```

## Business Purpose

Measures long-term business performance.

Executive Use:

- Strategic Planning
- Annual Reviews

---

# 5. Revenue Momentum Score

## DAX

```DAX
Revenue Momentum Score =
VAR CurrentRevenue =
    [Total Revenue]

VAR Revenue3M =
    [Rolling 3M Revenue]

RETURN

    DIVIDE (
        CurrentRevenue,
        Revenue3M
    )
```

## Business Purpose

Measures whether current performance exceeds recent trends.

Interpretation:

```text
> 1.00 = Positive Momentum

= 1.00 = Stable

< 1.00 = Weakening Momentum
```

Executive Use:

- Growth Monitoring
- Early Warning Signals

---

# 6. Revenue Acceleration %

## DAX

```DAX
Revenue Acceleration % =
VAR CurrentGrowth =
    [Revenue Growth %]

VAR PreviousGrowth =

    CALCULATE (
        [Revenue Growth %],
        DATEADD (
            dim_date[full_date],
            -1,
            MONTH
        )
    )

RETURN

    CurrentGrowth - PreviousGrowth
```

## Business Purpose

Measures change in growth rate.

Answers:

```text
Is growth accelerating or slowing?
```

Executive Use:

- Strategy Reviews
- Forecast Analysis

---

# 7. Revenue vs Rolling Trend %

## DAX

```DAX
Revenue vs Rolling Trend % =
VAR CurrentRevenue =
    [Total Revenue]

VAR RollingRevenue =
    [Rolling 12M Revenue] / 12

RETURN

    DIVIDE (
        CurrentRevenue - RollingRevenue,
        RollingRevenue
    )
```

## Business Purpose

Compares current performance against long-term trend.

Executive Use:

- Business Health Monitoring
- Revenue Benchmarking

---

# 8. Quarter Performance Index

## DAX

```DAX
Quarter Performance Index =
VAR CurrentQuarterRevenue =
    TOTALQTD (
        [Total Revenue],
        dim_date[full_date]
    )

VAR AverageQuarterRevenue =

    DIVIDE (
        [Rolling 12M Revenue],
        4
    )

RETURN

    DIVIDE (
        CurrentQuarterRevenue,
        AverageQuarterRevenue
    )
```

## Business Purpose

Measures current quarter performance versus historical benchmark.

Executive Use:

- Quarterly Reviews
- Executive Scorecards

---

# 9. Revenue Run Rate Projection

## DAX

```DAX
Revenue Run Rate Projection =
VAR DaysElapsed =

    COUNTROWS (
        DATESMTD (
            dim_date[full_date]
        )
    )

VAR RevenueMTD =
    TOTALMTD (
        [Total Revenue],
        dim_date[full_date]
    )

VAR AverageDailyRevenue =
    DIVIDE (
        RevenueMTD,
        DaysElapsed
    )

RETURN

    AverageDailyRevenue * 30
```

## Business Purpose

Projects expected monthly revenue.

Executive Use:

- Forecast Reviews
- Budget Tracking

---

# 10. Growth Health Indicator

## DAX

```DAX
Growth Health Indicator =
VAR GrowthRate =
    [Revenue Growth %]

RETURN

    SWITCH (
        TRUE(),

        GrowthRate >= 0.15,
            "High Growth",

        GrowthRate >= 0.05,
            "Healthy Growth",

        GrowthRate >= 0,
            "Stable",

        "Declining"
    )
```

## Business Purpose

Provides executive-friendly growth classification.

Executive Use:

- KPI Cards
- Board Reporting
- Strategic Reviews

---

# Time Intelligence KPI Summary

| KPI | Business Question |
|-------|------------------|
| Previous Month Revenue | What was last month's revenue? |
| Revenue Growth % | Are we growing? |
| Rolling 3M Revenue | What is the short-term trend? |
| Rolling 12M Revenue | What is the long-term trend? |
| Revenue Momentum Score | Are we outperforming recent trends? |
| Revenue Acceleration % | Is growth accelerating? |
| Revenue vs Rolling Trend % | Are we ahead of historical performance? |
| Quarter Performance Index | Is this quarter outperforming average? |
| Revenue Run Rate Projection | What is expected month-end revenue? |
| Growth Health Indicator | How healthy is business growth? |

---

