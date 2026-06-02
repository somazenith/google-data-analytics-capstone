-- KPI_dashboard_summary

USE cyclist_data;

-- 1. overall_rides
SELECT COUNT(*) AS total_rides FROM cyclist_data;

-- 2. average_ride_duration(valid_trips_only)
SELECT AVG(trip_duration_minutes) AS avg_duration_minutes
FROM cyclist_data
WHERE trip_duration_minutes >= 0;

-- 3. peak_month(highest_ride_count)
SELECT TOP 1
    DATENAME(MONTH, started_at) AS peak_month,
    COUNT(*) AS ride_count
FROM cyclist_data
GROUP BY DATENAME(MONTH, started_at)
ORDER BY ride_count DESC;

-- 4. member_vs_casual_percentages
SELECT 
    member_casual,
    COUNT(*) AS ride_count,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM cyclist_data), 2) AS percentage
FROM cyclist_data
GROUP BY member_casual;
