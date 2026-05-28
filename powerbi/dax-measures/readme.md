# Executive KPI Measures

## Overview

This document contains reusable executive KPI measures created in the semantic model using DAX.

These measures support:
- Executive dashboards
- Operational reporting
- Revenue analysis
- SLA monitoring
- Marketplace intelligence

---

# Revenue KPIs

## Total Revenue

```DAX
Total Revenue =
SUM(fact_orders[order_value_inr])
