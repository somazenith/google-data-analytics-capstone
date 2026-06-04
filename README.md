# 🚴‍♂️ Cyclistic Bike-Share Case Study: How Does a Bike-Share Navigate Speedy Success?

Welcome to my portfolio project for the Google Data Analytics Professional Certificate. This case study analyzes historical trip data from a fictional bike-share company in Chicago (Cyclistic) to uncover behavioral differences between casual riders and annual members. The ultimate goal is to design a data-driven marketing strategy to convert casual riders into profitable annual members.

---

## 🛠️ Tech Stack & Tools Used
*   **Data Cleaning & Manipulation:** SQL (BigQuery), Python (Pandas)
*   **Statistical Analysis:** RStudio
*   **Data Visualization:** Tableau Public, Excel
*   **Documentation:** Markdown / GitHub

---

## 📋 Table of Contents
1. [Title and Introduction](#1-title-and-introduction)
2. [Ask (Business Task)](#2-ask-business-task)
3. [Prepare (Data Sources)](#3-prepare-data-sources)
4. [Process (Data Cleaning & SQL Code)](#4-process-data-cleaning--sql-code)
5. [Analyze (Data Insights)](#5-analyze-data-insights)
6. [Share (Data Visualization)](#6-share-data-visualization)
7. [Act (Recommendations)](#7-act-recommendations)
8. [References & Links](#8-references--portfolio-links)

---

## 1. Title and Introduction
*   **Project Title:** Cyclistic Bike-Share Case Study: Converting Casual Riders to Annual Members
*   **Author:** Soma Ganesh Dokku
*   **Company Summary:** Cyclistic is a successful bike-share program in Chicago featuring over 5,800 bicycles and 692 geotracked docking stations. The company offers inclusive options like reclining bikes, hand tricycles, and cargo bikes. While 30% of users commute daily, the majority ride for leisure.

---

## 2. Ask (Business Task)
*   **Objective:** Analyze historical bike trip data to identify how casual riders and annual members use Cyclistic bikes differently. 
*   **Business Task:** Design data-backed marketing strategies to convert casual riders into profitable annual members.
*   **Stakeholders:** 
    *   **Lily Moreno (Director of Marketing):** Responsible for launching the campaigns.
    *   **Cyclistic Marketing Analytics Team:** Team responsible for data collection and reporting.
    *   **Cyclistic Executive Team:** The detail-oriented board deciding on campaign approval.
*   **Core Question:** How do annual members and casual riders use Cyclistic bikes differently?

---

## 3. Prepare (Data Sources)
*   **Data Source:** The analysis utilizes Cyclistic’s historical trip data from January 2025 to December 2025 stored securely in an AWS S3 bucket.
*   **Dataset Structure:** The dataset consists of 12 monthly CSV files containing 13 columns: `ride_id`, `rideable_type`, `started_at`, `ended_at`, `start_station_name`, `start_station_id`, `end_station_name`, `end_station_id`, `start_lat`, `start_lng`, `end_lat`, `end_lng`, and `member_casual`.
*   **Data Integrity & Privacy:** The data is public domain. Personally identifiable information (PII) like credit card numbers or home addresses is omitted to ensure user privacy. 

---

## 4. Process (Data Cleaning & SQL Code)
To ensure transparency and reproducibility, the entire data cleaning process was executed using SQL. Due to the size of the queries, the comprehensive script has been organized into the scripts folder.

*   📄 **View the full data cleaning script:** [data cleaning script](./scripts/sql/02_cleaning.sql)

### Summary of SQL Operations Performed:
1.  **Data Aggregation:** Combined 12 individual monthly data tables from 2025 using `UNION ALL`.
2.  **Duplicate Removal:** Verified uniqueness of `ride_id` records using `DISTINCT`.
3.  **Data Filtering:** Removed rows containing `NULL` values in critical location columns (`start_station_name`, `end_station_name`).
4.  **Feature Engineering:** Calculated ride lengths using `TIMESTAMP_DIFF` and extracted day-of-the-week attributes using `EXTRACT`.
5.  **Anomaly Handling:** Filtered out negative trip durations and rides lasting less than 1 minute.


---

## 5. Analyze (Data Insights)

### User Volume & Bike Preference
*   **Volume:** Total annual members consistently outnumber casual riders throughout the year.
*   **Equipment:** Both groups prefer classic bikes over electric bikes.

### Seasonal & Monthly Patterns
*   **Seasonality:** Both groups peak during the summer and hit their lowest volumes in winter. 
    *   **Casuals:** Peak in summer (**619,313** rides) and drop significantly in winter (**55,285** rides).
    *   **Members:** Peak in summer (**828,987** rides) and drop to their lowest in winter (**250,296** rides).
*   **Peak Months:** Member rides peak in **September** and hit a low in **December**. Casual rides peak in **August** and hit a low in **January**.

### Weekly & Hourly Behaviors
*   **Weekly Trends:** Members ride most frequently during the mid-week (**Tuesday through Thursday**). Casual riders heavily dominate the weekends (**Saturday and Sunday**).
*   **Hourly Peaks:** 
    *   **Members:** Peak sharply at **5:00 PM** (commute hours) and drop to their lowest at **3:00 AM**. Member volume at 5:00 PM is significantly higher than casual volume.
    *   **Casuals:** Peak during the middle of the day at **1:00 PM** and hit their lowest point at **4:00 AM**.

### Trip Duration & Distribution
*   **Average Ride Times:** Casual riders log significantly longer trips than members across the entire week:
    *   **Casuals:** Peak on Sunday (**25.94 mins**) and Saturday (**25.24 mins**), with their lowest average on Wednesday (**18.35 mins**).
    *   **Members:** Peak on Sunday (**13.84 mins**) and Saturday (**13.68 mins**), with their lowest average on Wednesday (**11.80 mins**).
*   **Peak Duration Counts:** 
    *   The single most common ride duration for members is **5 minutes** (**190,124** riders). 
    *   The single most common ride duration for casuals is **7 minutes** (**70,981** riders).
*   **Duration Breakdown:**
    *   **Short Trips (5–15 mins):** Dominated by members (**1,170,930** rides) compared to casuals (**562,506** rides).
    *   **Long Trips (60+ mins):** Highly dominated by casuals (**79,997** rides) compared to members (**14,347** rides).

### Geographic Preferences
*   **Top Casual Station:** *DuSable Lake Shore Dr & Monroe St* (Leisure/tourist waterfront location).
*   **Top Member Station:** *Kingsbury St & Kinzie St* (Commercial/office commuting zone).

---

## 6. Share (Data Visualization)
*   **Visual Assets:** 
    *   **Line Charts:** Formatted to map hourly trends (highlighting the 5:00 PM member commute spike vs. the midday casual hump) and monthly timelines to visualize seasonal drops.
    *   **Bar Charts:** Formatted to compare member vs. casual ride counts by the day of the week, preferred bike types, and ride duration buckets (5–15 mins vs. 60+ mins).
*   **Key Visual Takeaway:** The charts visually separate users into two distinct profiles: **Members are structured commuters** (mid-week, fixed 5:00 PM peaks, short 5-minute rides to office zones), while **Casuals are leisure seekers** (weekend-heavy, afternoon peaks, long 25+ minute rides near waterfront stations).

---

## 7. Act (Recommendations)

Based on the data trends discovered, here are three recommendations to convert casual riders into annual members:

1.  **Introduce a "Weekend Warrior" or "Seasonal Summer" Membership Pass**
    *   *Data Justification:* Casual rides peak massively on weekends and during the summer season (619,313 rides vs. only 55,285 in winter). 
    *   *Action:* Launch an annual membership variant that offers unlimited weekend riding or a discounted 4-month summer membership to capture leisure riders.
2.  **Target Physical Marketing at Leisure Hotspots**
    *   *Data Justification:* The number-one station for casual riders is *DuSable Lake Shore Dr & Monroe St*, a major leisure waterfront destination.
    *   *Action:* Deploy physical advertisements, digital signs, and pop-up marketing teams at this specific station during peak casual hours (1:00 PM on weekends) showing cost savings of a membership.
3.  **Gamify and Incentivize "Long-Duration" Trips**
    *   *Data Justification:* Casual riders dominate long trips, with nearly 80,000 rides lasting over an hour, and an average weekend ride time of ~25 minutes. 
    *   *Action:* Update the Cyclistic app to show casual riders a "Cost Savings Calculator" after any ride exceeding 15 minutes, highlighting how an annual membership eliminates single-ride overage fees.

---

## 8. References & Portfolio Links
*   **Data Source:** Cyclistic Historical Dataset (Jan 2025 – Dec 2025)
*   **GitHub Repository:** [Cyclistic Bike Share](https://github.com/somazenith/google-data-analytics-capstone)
*   **Tableau Dashboard:** [Tableau Dashboard](https://public.tableau.com/views/cyclistic_analysis_17720239638910/RidersByMemberType?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
*   **Certification:** [Google Data Analytics](https://coursera.org/share/7a9ab4e3826964c56cd47fc4d4b1db16)
*   **Credly:** [Credly Badge](https://www.credly.com/badges/0c0be63d-eae0-4d43-b1e0-a9fbe7e8369a/public_url)
