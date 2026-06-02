# Cyclistic Bike-Share Data Analysis Case Study
## Google Data Analytics Certificate Capstone Project

---

## 📌 Project Overview
This project analyzes historical trip data from Cyclistic, a fictional bike-share company in Chicago, to identify behavioral differences between casual riders and annual members. The final objective is to design data-driven marketing strategies to convert casual riders into loyal, long-term annual members.

### 🛡️ Core Competencies Demonstrated (Cybersecurity Relevance)
While this is a data analytics project, the methodologies directly mirror fundamental security operations:
* **Data Cleaning & Integrity:** Standardizing timestamps, resolving null values, and stripping corrupt logs (corresponds to SIEM log ingestion).
* **Big Data Processing:** Querying large datasets with optimized SQL queries (corresponds to security threat hunting and database auditing).
* **Pattern & Anomaly Detection:** Recognizing behavioral patterns across massive event pools (corresponds to identifying network intrusion signatures).

---

## 🛠️ Tech Stack & Tools
* **Data Extraction & Ingestion:** SQL (BigQuery)
* **Data Cleaning & Wrangling:** Python (Pandas/NumPy) & R (tidyverse)
* **Data Visualization & Reporting:** Tableau / R (ggplot2)

---

## 📐 Data Analysis Process (Methodology)

### 1. Ask
* **Business Objective:** Maximize annual memberships by converting casual riders.
* **Key Question:** How do annual members and casual riders use Cyclistic bikes differently?

### 2. Prepare
* **Data Source:** Publicly available historical trip data from Cyclistic.
* **Data Privacy:** Data anonymized to protect User PII (Personally Identifiable Information).

### 3. Process (Data Cleaning Documentation)
* Merged 12 individual monthly CSV datasets into a single database.
* Removed duplicate entries and rows with missing critical tracking IDs.
* Stripped negative `ride_length` anomalies caused by system maintenance testing.
* Standardized date/time formats across all columns for query efficiency.

### 4. Analyze & Share
*(Tip: Replace this text later with 2-3 of your key high-level findings!)*
* **Finding 1:** Casual riders use bikes significantly longer on weekends, suggesting leisure use.
* **Finding 2:** Annual members show sharp usage peaks around 8:00 AM and 5:00 PM, indicating a daily commuter profile.
* **Visualizations:** [Link to your Tableau Dashboard or embed your project charts here]

### 5. Act (Strategic Recommendations)
1. **Targeted Campaigns:** Launch digital marketing campaigns tailored to weekend leisure hotspots.
2. **Seasonal Promotions:** Introduce seasonal or weekend-only membership plans designed specifically for current casual riders.

---

## 📁 Repository Directory Layout
* `/scripts` — Contains raw `.sql` files, Python scripts, and R Markdown files.
* `/visualizations` — Contains exported `.png` or `.pdf` data charts and Tableau workbooks.
* `/docs` — Executive summary report outlining the business recommendations.

---

## 🚀 How to Run the Scripts
1. Clone this repository: `git clone https://github.com`
2. Open the SQL scripts inside Google BigQuery or a local PostgreSQL instance.
3. Install required Python packages: `pip install pandas numpy matplotlib`
4. Execute the cleanup script: `python scripts/data_cleaning.py`
