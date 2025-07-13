#  🛒 E-Commerce Data Pipeline (Azure ETL Project)

This project showcases an end-to-end **ETL pipeline built on Medallion Architecture**, designed to deliver business insights through **Azure Data Services** — with a touch of data visualization.

It serves as a key component of a broader full-stack data platform, combining diverse technologies across data engineering, analytics, and machine learning. The focus here is on turning raw, siloed data into meaningful and actionable information, as a company would in a real-world setting.

The pipeline ingests and processes data from the [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce), which contains over 100,000 anonymized orders from 2016 to 2018 across various Brazilian marketplaces. The dataset spans nine structured CSV files and includes details on customer behavior, product attributes, reviews, shipping logistics, and more.

The goal is to simulate a production-grade data pipeline where messy, fragmented data is transformed into clean, structured, and analytics-ready layers — supporting everything from BI dashboards to predictive modeling.

## What's next?

I believe this dataset opens the door to many exciting analytical possibilities. Here’s what I plan to build next:

- [ ]  **Interactive KPI Dashboard** – Built with Tableau to monitor core business metrics.
- [ ] **RFM Segmentation** – Using Recency, Frequency, and Monetary value to group customers via visualization and **unsupervised learning** algorithms.
- [ ] **Customer behavior** – Combining the [Marketing Funnel by Olist](https://www.kaggle.com/datasets/olistbr/marketing-funnel-olist) to analysis how to promote the business.

---

Stay tuned! This project is continuously evolving as I explore new ideas and techniques. 😊



## 🛠️ Tech Stack

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