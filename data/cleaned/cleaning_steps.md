# Data Cleaning & Analysis Workflow

This document explains the steps taken to clean the raw trip data and prepare summary outputs for analysis.

---

## 1. Raw Data Import
- Imported 12 monthly CSV files (Jan–Dec 2025) into Excel Power Query.
- Combined them into a single dataset (`all_trips_2025`).

---

## 2. Data Cleaning
- Removed duplicate rows based on `ride_id`.
- Filtered out null values in `start_station_name` and `end_station_name`.
- Standardized date/time columns (`started_at`, `ended_at`) to proper DateTime format.
- Converted trip duration into minutes (`trip_duration_minutes`).

---

## 3. New Columns Added
- **Month** → Extracted using `Date.MonthName([started_at])`.
- **Day of Week** → Extracted using `Date.DayOfWeekName([started_at])`.
- **Season** → Custom column logic:
  - Dec, Jan, Feb → Winter
  - Mar, Apr, May → Spring
  - Jun, Jul, Aug → Summer
  - Sep, Oct, Nov → Fall
- **Trip Duration (minutes)** → `(ended_at - started_at)` converted to minutes.

---

## 4. Monthly Summary
- PivotTable created with:
  - Rows = Month
  - Values = Total Rides, Avg Duration, Member Rides, Casual Rides
- Saved as `monthly_summary` sheet in `all_trips_summary.xlsx`.

---

## 5. Seasonal Summary
- PivotTable created with:
  - Rows = Season
  - Values = Total Rides, Avg Duration
  - Columns = Rider Type (Member vs Casual)
- Added **Member %** and **Casual %** using “Show Values As → % of Row Total”.
- Saved as `seasonal_summary` sheet.

---

## 6. Top Stations
- PivotTable created with:
  - Rows = Start Station Name
  - Values = Total Rides
- Applied **Value Filter → Top 10** to show busiest stations.
- Saved as `top_stations` sheet.

---

## 7. KPI Dashboard
- Created a new sheet `KPI_dashboard` with formulas:
  - Overall Rides = `=SUM('monthly_summary'!D2:D14)`
  - Avg Trip Duration = `=AVERAGE('monthly_summary'!E2:E13)`
  - Peak Month Rides = `=MAX('monthly_summary'!D2:D13)`
  - Peak Month Name = `=INDEX(monthly_summary!A2:A13, MATCH(MAX(monthly_summary!D2:D13), monthly_summary!D2:D13, 0))`
  - Member % Overall = linked from Seasonal Summary total row
  - Casual % Overall = linked from Seasonal Summary total row
- Formatted as a clean KPI dashboard.

---

## 8. Outputs Saved
- `all_trips_summary.xlsx` → contains Monthly, Seasonal, Top Stations, KPI Dashboard.
- `sample_cleaned.csv` → representative cleaned dataset (1–2 months).
- `data_dictionary.md` → explains all columns.
