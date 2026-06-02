# Raw Data

Raw Cyclistic trip datasets are not included in this repository due to size limitations and licensing restrictions.  
However, this project uses the official **Divvy/Cyclistic bike-share trip data** covering the period **January 2025 to December 2025**.

## 📂 Dataset Source
The datasets can be downloaded directly from the official Divvy data portal:  
[Divvy Trip Data Archive](https://divvy-tripdata.s3.amazonaws.com/index.html)

## 📌 Notes
- Each monthly dataset is provided as a CSV file (e.g., `2025-01-divvy-tripdata.csv`, `2025-02-divvy-tripdata.csv`, … `2025-12-divvy-tripdata.csv`).  
- These files contain detailed trip-level information such as:
  - Ride ID  
  - Start and end time  
  - Start and end station/location  
  - Rider type (casual vs. member)  
  - Bike type (classic, docked, electric)  
- The raw files are large (often >25 MB each), so they are not stored in this GitHub repository.  

## ✅ Usage
To reproduce this project:
1. Download the monthly CSV files for **Jan–Dec 2025** from the official source.  
2. Place them in the folder:  
3. Run the cleaning and analysis scripts provided in the `scripts/` and `notebooks/` folders.  

---
