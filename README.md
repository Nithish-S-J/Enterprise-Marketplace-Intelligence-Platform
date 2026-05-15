```
swiggy-enterprise-analytics-platform/
│
├── README.md
├── LICENSE
├── .gitignore
│
├── docs/
│   │
│   ├── business-requirements/
│   │   └── Swiggy_Business_Requirements.docx
│   │
│   ├── project-documentation/
│   │   ├── Project_Overview.md
│   │   ├── Data_Dictionary.xlsx
│   │   ├── KPI_Definitions.md
│   │   └── Data_Quality_Checks.md
│   │
│   ├── architecture/
│   │   ├── Solution_Architecture.png
│   │   ├── Medallion_Architecture.png
│   │   ├── Star_Schema_Model.png
│   │   └── End_to_End_Project_Flow.pptx
│   │
│   └── screenshots/
│       ├── fabric/
│       ├── sql/
│       ├── powerbi/
│       └── dashboards/
│
├── data/
│   │
│   ├── bronze_raw/
│   │   ├── customers.csv
│   │   ├── orders.csv
│   │   ├── restaurants.csv
│   │   ├── deliveries.csv
│   │   └── delivery_partners.csv
│   │
│   ├── silver_cleaned/
│   │
│   └── gold_business/
│
├── sql/
│   │
│   ├── ddl/
│   │   ├── create_tables.sql
│   │   └── create_views.sql
│   │
│   ├── dml/
│   │   ├── insert_data.sql
│   │   └── merge_queries.sql
│   │
│   ├── transformations/
│   │   ├── data_cleaning.sql
│   │   ├── validation_checks.sql
│   │   └── business_rules.sql
│   │
│   ├── warehouse_modeling/
│   │   ├── dim_customer.sql
│   │   ├── dim_restaurant.sql
│   │   ├── dim_date.sql
│   │   ├── dim_location.sql
│   │   └── fact_orders.sql
│   │
│   ├── kpi_queries/
│   │   ├── revenue_kpis.sql
│   │   ├── delivery_kpis.sql
│   │   ├── customer_kpis.sql
│   │   └── restaurant_kpis.sql
│   │
│   └── analytical_queries/
│       ├── churn_analysis.sql
│       ├── sla_analysis.sql
│       ├── city_performance.sql
│       └── customer_segmentation.sql
│
├── fabric/
│   │
│   ├── lakehouse/
│   │
│   ├── warehouse/
│   │
│   ├── dataflow_gen2/
│   │
│   ├── pipelines/
│   │
│   └── semantic_model/
│
├── notebooks/
│   ├── exploratory_analysis/
│   └── advanced_analytics/
│
├── powerbi/
│   │
│   ├── datasets/
│   │
│   ├── reports/
│   │
│   ├── themes/
│   │
│   └── pbix/
│
├── monitoring/
│   ├── pipeline_logs/
│   └── refresh_tracking/
│
├── tests/
│   ├── data_quality_tests/
│   └── sql_validation_tests/
│
└── assets/
    ├── icons/
    ├── dashboard_mockups/
    └── diagrams/
```
