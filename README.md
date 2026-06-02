# Cyclistic Bike-Share Case Study (Data Integrity & Analysis)
### Google Data Analytics Professional Certificate Capstone Project

---

## 📌 Project Overview
This repository contains an end-to-end data analysis project focusing on historical trip data from Cyclistic, a bike-share company in Chicago. The core objective is to analyze customer behaviors to identify distinct usage patterns between casual riders and annual members, ultimately delivering data-driven strategies to maximize annual membership conversion.

### 🛡️ Technical Relevance to Cybersecurity
While this project focuses on business intelligence, the underlying pipeline directly mirrors core security workflows:
* **Data Hygiene & ETL:** Ingesting, parsing, and cleaning large-scale raw data sets—identical to managing SIEM log ingestion pipeline workflows.
* **Anomaly Identification:** Writing structured filters to flag system errors, negative values, and temporal discrepancies, simulating intrusion detection signatures.
* **Integrity Validation:** Verifying that data constraints (e.g., matching unique keys, format alignment) remain consistent post-processing.

---

## 🛠️ Tooling & Tech Stack
* **Languages:** SQL, Python, R
* **Data Engineering:** Python (Pandas/NumPy), R (dplyr, tidyverse)
* **Analytics Environment:** BigQuery SQL, Jupyter Notebooks
* **Visualization & Dashboards:** Tableau, ggplot2, Matplotlib

---

## 📐 Data Pipeline & Methodology

### 1. Ingestion & Preparation (Ask & Prepare)
* **Dataset:** Public historical trip metrics (anonymized to protect user PII).
* **Scope:** 12 monthly CSV files consolidated to evaluate long-term trends.

### 2. Processing & Data Integrity (Process)
* Handled missing value vectors (`null` values) across critical tracking fields.
* Stripped systemic anomalies (e.g., negative duration fields caused by maintenance testing).
* Standardized Unix/ISO timestamps across all data frames to ensure temporal alignment.

### 3. Analysis & Threat-Hunting Analogy (Analyze)
* Aggregated usage metrics based on time, day, week, and geographic station variables.
* **Key Finding:** Casual riders exhibit localized, high-duration usage spikes on weekends, whereas annual members display predictable, high-frequency commuting peaks at 08:00 and 17:00 on weekdays.

### 4. Strategic Recommendations (Act)
* Implement targeted digital marketing near weekend leisure hubs during peak casual rider hours.
* Introduce flexible weekend-only or seasonal membership variants tailored to casual user profiles.

---

## 📂 Repository Architecture
```text
├── data/
│   ├── raw/           # Source datasets (Omitted from remote due to file size constraints)
│   └── cleaned/       # Parsed datasets, data dictionaries, and cleaning logs
├── scripts/           # Production scripts categorized by environment (SQL, R, Python)
├── notebooks/         # Interactive Jupyter (.ipynb) and R Markdown (.Rmd) workflows
├── visualizations/    # Static PNG/JPG charts and interactive Tableau dashboards (.twbx)
└── docs/              # High-level executive reports and document summaries
```

---

## 🚀 Execution & Reproduction
1. **Clone the repository:**
   ```bash
   git clone https://github.com
   ```
2. **Execute Python Environment Cleanup:**
   ```bash
   pip install pandas numpy matplotlib
   python scripts/python/your_script_name.py
   ```
3. **Database Engine:** Upload files to Google BigQuery or local PostgreSQL and execute query assets from `/scripts/sql/`.
