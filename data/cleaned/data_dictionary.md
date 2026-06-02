# Data Dictionary – Cleaned Trip Data

This file describes the columns in the cleaned dataset (`sample_cleaned.csv`).

---

## Trip Information
- **ride_id**  
  - Type: Text  
  - Description: Unique identifier for each ride.  
  - Example: "C123456789"

- **started_at**  
  - Type: DateTime  
  - Description: Start time of the ride.  
  - Example: "2025-06-15 08:32:00"

- **ended_at**  
  - Type: DateTime  
  - Description: End time of the ride.  
  - Example: "2025-06-15 08:52:00"

- **trip_duration_minutes**  
  - Type: Number  
  - Description: Ride duration in minutes, calculated as `ended_at - started_at`.  
  - Example: 20.0

---

## Rider Information
- **member_casual**  
  - Type: Text  
  - Description: Rider type – either "Member" (annual subscriber) or "Casual" (single-ride or day-pass user).  
  - Example: "Member"

---

## Station Information
- **start_station_name**  
  - Type: Text  
  - Description: Name of the station where the ride started.  
  - Example: "Navy Pier"

- **end_station_name**  
  - Type: Text  
  - Description: Name of the station where the ride ended.  
  - Example: "Union Station"

---

## Derived Columns
- **Month**  
  - Type: Text  
  - Description: Full month name extracted from `started_at`.  
  - Example: "January"

- **Day_of_Week**  
  - Type: Text  
  - Description: Day of the week extracted from `started_at`.  
  - Example: "Monday"

- **Season**  
  - Type: Text  
  - Description: Season assigned based on month.  
    - Winter = December, January, February  
    - Spring = March, April, May  
    - Summer = June, July, August  
    - Fall = September, October, November  
  - Example: "Summer"
