-- trip_duration_distribution
SELECT 
    member_casual,
    CASE 
        WHEN trip_duration_minutes < 5 THEN '0–5 min'
        WHEN trip_duration_minutes BETWEEN 5 AND 15 THEN '5–15 min'
        WHEN trip_duration_minutes BETWEEN 15 AND 30 THEN '15–30 min'
        WHEN trip_duration_minutes BETWEEN 30 AND 60 THEN '30–60 min'
        ELSE '60+ min'
    END AS duration_bucket,
    COUNT(*) AS ride_count
FROM cyclist_data
WHERE trip_duration_minutes >= 0
GROUP BY member_casual,
         CASE 
            WHEN trip_duration_minutes < 5 THEN '0–5 min'
            WHEN trip_duration_minutes BETWEEN 5 AND 15 THEN '5–15 min'
            WHEN trip_duration_minutes BETWEEN 15 AND 30 THEN '15–30 min'
            WHEN trip_duration_minutes BETWEEN 30 AND 60 THEN '30–60 min'
            ELSE '60+ min'
         END
ORDER BY member_casual, duration_bucket;



-- seasonal_trends
SELECT 
    season,
    member_casual,
    COUNT(*) AS total_rides,
    AVG(trip_duration_minutes) AS avg_duration
FROM cyclist_data
WHERE trip_duration_minutes >= 0
GROUP BY season, member_casual
ORDER BY season;



-- peak_hour_by_user_type
SELECT 
    DATEPART(HOUR, started_at) AS hour_of_day,
    member_casual,
    COUNT(*) AS ride_count
FROM cyclist_data
GROUP BY DATEPART(HOUR, started_at), member_casual
ORDER BY hour_of_day, member_casual;



-- station_pair_analysis
-- find most common start–end station pairs
SELECT TOP 10
    start_station_name,
    end_station_name,
    COUNT(*) AS ride_count
FROM cyclist_data
GROUP BY start_station_name, end_station_name
ORDER BY ride_count DESC;



-- geo_spatial_insights
-- Use lat/long to prepare heatmaps in Tableau/Power BI

SELECT 
    start_lat, start_lng, COUNT(*) AS ride_count
FROM cyclist_data
GROUP BY start_lat, start_lng
ORDER BY ride_count DESC;

---Export this to visualize hotspots

