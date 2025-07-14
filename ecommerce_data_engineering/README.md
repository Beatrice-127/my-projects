#  E-Commerce Data Pipeline (Azure ETL Project)



This project simulates a **production-grade end-to-end data pipeline** built on **Azure Data Services**, using the **Medallion Architecture** (Bronze → Silver → Gold). It transforms messy, fragmented e-commerce data into analytics-ready layers that support BI dashboards and machine learning workflows.

The pipeline ingests data from the [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce), which includes over 100,000 anonymized orders, covering customer behavior, product attributes, reviews, and shipping logistics.



## Architecture Overview

<img src="images/ecomm_engineer.png" alt="pipeline" width="80%"/>

This pipeline follows a layered architecture with well-defined separation of concerns:

1. **Ingestion**: Raw data from CSV files is ingested using **Azure Data Factory** into **ADLS Gen2 (Bronze layer)**.
2. **Processing**: **Azure Databricks (PySpark)** transforms and joins datasets into the **Silver layer**.
3. **Enrichment**: External lookup data from **MongoDB** is merged to add business context (e.g., category names).
4. **Analytics**: The **Gold layer** is used by **Azure Synapse** and **Tableau** for BI and modeling purposes.



### What's next?

I believe this dataset opens the door to many exciting analytical possibilities. Here’s what I plan to build next:

- [ ] **Interactive KPI Dashboard** – Built with Tableau to monitor core business metrics.
- [ ] **RFM Segmentation** – Using Recency, Frequency, and Monetary value to group customers via visualization and **unsupervised learning** algorithms.
- [ ] **Customer behavior** – Combining the [Marketing Funnel by Olist](https://www.kaggle.com/datasets/olistbr/marketing-funnel-olist) to analysis how to promote the business.

---

Stay tuned! This project is continuously evolving as I explore new ideas and techniques. 😊



##  Data Quality Monitoring

Implemented core data validation checks at each pipeline stage:

- Schema validation and column type enforcement  
- Null & duplicate detection in key fields (`order_id`, `customer_id`)  
- Referential integrity across orders, products, and customers  
- Date consistency: e.g., delivery date > purchase date  
- Business logic: no negative freight or payment values  



## Governance & Access Control

-  Bronze layer access restricted to ingestion users  
-  Silver/Gold accessible by BI and analytics teams  
-  Parquet format + Synapse views allow for future row-level security  



## BI-Ready Outputs

The pipeline is designed to serve the following analytics needs:

- **Daily Sales KPI Dashboard** (Total Revenue, Freight, Avg Rating)  
- **Customer Segmentation via RFM**  
- **Order Fulfillment Analysis** (delays, regions, trends)  

_Tableau dashboards in progress and planned for publication._



## Tech Stack

###  Cloud & Storage

- **Azure Data Factory** – Orchestration and data ingestion (GitHub API, SQL sources).
- **Azure Data Lake Storage Gen2 (ADLS Gen2)** – Centralized data lake for Bronze, Silver, and Gold layers.
- **Azure Synapse Analytics** – Querying and analysis-ready storage for downstream BI tools.

### Data Processing & Transformation

- **Azure Databricks (PySpark)** – Data cleaning, joining, enrichment, and transformation using scalable distributed computing.
- **MongoDB** – Used for enrichment (external lookup data for categories, suppliers, etc.).

###  Data Visualization

- **Azure Databricks** – a quick taste of data visualization.
- **Tableau** – Interactive visual analytics and KPI tracking (planned).

###  Development & Utilities

- **Python (PySpark, pandas)** – Scripting and transformation logic.
- **Jupyter Notebooks / Databricks Notebooks** – Interactive development and exploration.
- **Git & GitHub** – Version control and code collaboration.

###  Architecture

- **Medallion Architecture** (Bronze → Silver → Gold) – A structured, layered data flow supporting clean separation between raw, processed, and analytics-ready data.

---

