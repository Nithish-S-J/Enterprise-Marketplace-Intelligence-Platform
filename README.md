
# Enterprise Marketplace Intelligence Platform

An end-to-end Microsoft Fabric analytics solution designed to analyze food delivery operations, customer behavior, restaurant performance, and business KPIs using Lakehouse, Data Warehouse, SQL, and Power BI. Built with enterprise-style architecture, medallion data modeling, and interactive executive dashboards for real-world business insights.

![Project_Preview](https://github.com/Nithish-S-J/Enterprise-Marketplace-Intelligence-Platform/blob/main/Docs/Project%20Architecture/Swiggy_Enterprise_Business_Requirements_v1.png.png)
```
swiggy-enterprise-analytics-platform/
│
├── README.md
├── LICENSE
├── .gitignore
│
├── docs/
│   ├── business-requirements/
│   │   └── Swiggy_Business_Requirements.docx
│   │
│   ├── solution-design/
│   │   ├── Enterprise_Solution_Design.docx
│   │   ├── End_to_End_Architecture.png
│   │   ├── Medallion_Architecture.png
│   │   └── Star_Schema_Model.png
│   │
│   ├── governance/
│   │   ├── Naming_Standards.md
│   │   ├── Data_Quality_Framework.md
│   │   └── Security_RBAC_Model.md
│   │
│   ├── kpi-catalog/
│   │   └── Business_KPI_Definitions.xlsx
│   │
│   └── screenshots/
│       ├── fabric_workspace/
│       ├── dataflow_gen2/
│       ├── sql_transformations/
│       ├── warehouse_model/
│       └── powerbi_dashboards/
│
├── data/
│   ├── bronze_raw/
│   │   ├── customers.csv
│   │   ├── restaurants.csv
│   │   ├── orders.csv
│   │   ├── deliveries.csv
│   │   ├── delivery_partners.csv
│   │   └── payments.csv
│   │
│   ├── silver_cleaned/
│   │
│   └── gold_curated/
│
├── sql/
│   ├── ddl/
│   │   ├── create_dimension_tables.sql
│   │   └── create_fact_tables.sql
│   │
│   ├── transformations/
│   │   ├── bronze_to_silver.sql
│   │   └── silver_to_gold.sql
│   │
│   ├── data_quality_checks/
│   │   ├── duplicate_validation.sql
│   │   ├── null_checks.sql
│   │   ├── referential_integrity.sql
│   │   └── delivery_sla_validation.sql
│   │
│   └── analytics/
│       ├── customer_analytics.sql
│       ├── revenue_analysis.sql
│       ├── restaurant_performance.sql
│       └── delivery_operations.sql
│
├── fabric/
│   ├── lakehouse/
│   ├── warehouse/
│   ├── dataflow_gen2/
│   ├── pipelines/
│   └── semantic_model/
│
├── powerbi/
│   ├── datasets/
│   ├── reports/
│   ├── dax_measures/
│   └── pbix/
│
├── monitoring/
│   ├── pipeline_monitoring/
│   ├── refresh_logs/
│   └── audit_tracking/
│
├── automation/
│
└── assets/
    ├── architecture_icons/
    ├── dashboard_themes/
    └── branding/
```
