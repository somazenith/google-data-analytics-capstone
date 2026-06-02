# Cyclistic Data SQL Workflow

This repository contains SQL scripts for importing, cleaning, and analyzing the Cyclistic bike-share dataset.  
Scripts are organized into folders by purpose and should be executed in the order below.

---

## 1. Importing CSV Files into SQL Server

1. Open **SQL Server Management Studio**.
2. Right-click on **Databases** → Create a new database → `cyclist_data`.
3. In **Databases → cyclist_data**, right-click → **Tasks → Import Flat File**.
4. In the Import Wizard:
   - Browse and select the CSV file.
   - Click **Next**.
   - In the **Modify Columns** tab:
     - Select **Allow Nulls** for all columns (since some values may be empty).
     - Change `start_station_name` and `end_station_name` to `VARCHAR(MAX)` (names can exceed 50 characters).
5. Repeat this process for all monthly CSV files.

---

## 2. Data Preparation (`01_import.sql`)
- **join_tables** → Combines monthly imports into one master table (`cyclist_data`).
- **add_columns** → Adds derived columns (`trip_duration_minutes`, `month`, `day_of_week`, `season`).
- **populate_derived_columns** → Populates derived columns with values (`DATEDIFF`, `DATENAME`, `CASE`).
- **verify_updates** → Quick check to confirm derived columns were populated correctly.

---

## 3. Data Cleaning (`02_cleaning.sql`)
- **deduplication_query** → Removes duplicate `ride_id`s using `ROW_NUMBER()`.
- **delete_null** → Deletes rows with critical nulls (timestamps, station names).
- **replace_null** → Replaces optional nulls with placeholders (`Unknown Station`).
- **delete_negative_trip_duration_rows** → Removes invalid trips where `ended_at < started_at`.

---

## 4. Core Analyses (`03_core_analysis.sql`)
- **riders_by_member_type** → Counts rides split by member type.
- **rider_by_bike_type_and_member_type** → Counts rides by bike type and member type.
- **most_used_start_station** → Finds busiest start stations overall.
- **most_used_start_station_by_user_type** → Finds busiest start stations by member type.
- **most_used_end_station_by_user_type** → Finds busiest end stations by member type.
- **monthly_riders_by_member_type** → Monthly ride counts with month names.
- **weekly_riders_by_member_type** → Weekly ride counts by day of week.
- **hourly_riders_by_member_type** → Hourly ride counts by member type.
- **ride_length_analysis** → Average, min, max ride length (after filtering negatives).

---

## 5. Advanced Analyses (`04_advanced_analysis.sql`)
- **trip_duration_distribution** → Groups rides into duration buckets (0–5 min, 5–15 min, etc.).
- **seasonal_trends** → Compares usage across Winter, Spring, Summer, Fall.
- **peak_hour_by_user_type** → Identifies busiest hours for casual vs. members.
- **station_pair_analysis** → Finds most common start–end station pairs.
- **geo_spatial_insights** → Aggregates rides by lat/long for heatmaps.

---

## 6. KPI Dashboard (`05_dashboard.sql`)
- **kpi_dashboard** → Provides a one‑shot summary:
  - Total rides
  - Average ride duration
  - Peak month (highest ride count)
  - Member vs casual percentages

---

## 🔎 Execution Order
1. **Import CSVs** → Flat File Wizard.  
2. **Preparation** → Run scripts in `01_import.sql`.  
3. **Cleaning** → Run scripts in `02_cleaning.sql`.  
4. **Core Analyses** → Run scripts in `03_core_analysis.sql`.  
5. **Advanced Analyses** → Run scripts in `04_advanced_analysis.sql`.  
6. **KPI Dashboard** → Run `05_kpi_dashboard.sql` for a quick snapshot summary.  

---

## 📂 Notes
- All scripts assume the master table is named `cyclist_data`.  
- Cleaning scripts should be run before analysis scripts.  
- KPI dashboard provides a concise overview for reporting and presentations.  
