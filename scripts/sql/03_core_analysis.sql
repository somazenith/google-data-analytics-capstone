-- Core_Analysis

-- riders_by_member_type
SELECT
    COUNT(ride_id) AS number_of_riders,
    member_casual
FROM cyclist_data
GROUP BY member_casual;



-- riders_by_bike_type_and_member_type
SELECT
    COUNT(ride_id) AS number_of_riders,
    rideable_type,
    member_casual
FROM cyclist_data
GROUP BY rideable_type, member_casual
ORDER BY number_of_riders DESC;



-- most_used_start_station
SELECT
    COUNT(start_station_name) AS number,
    start_station_name
FROM cyclist_data
GROUP BY start_station_name
ORDER BY number DESC;



-- most_used_start_station_by_user_type
SELECT 
    COUNT(ride_id) AS number_of_riders,
    start_station_name,
    member_casual
FROM cyclist_data
GROUP BY start_station_name, member_casual
ORDER BY number_of_riders DESC;



-- most_used_end_station_by_user_type
SELECT 
    COUNT(ride_id) AS number_of_riders,
    end_station_name,
    member_casual
FROM cyclist_data
GROUP BY end_station_name, member_casual
ORDER BY number_of_riders DESC;



-- monthly_riders_by_members_type
SELECT 
    COUNT(ride_id) AS number_of_riders,
    DATENAME(MONTH, started_at) AS started_month,
    member_casual
FROM cyclist_data
GROUP BY member_casual, DATENAME(MONTH, started_at)
ORDER BY number_of_riders DESC;



-- weekly_riders_by_member_type
SELECT 
    COUNT(ride_id) AS number_of_riders,
    DATENAME(WEEKDAY, started_at) AS day_of_week,
    member_casual
FROM cyclist_data
GROUP BY member_casual, DATENAME(WEEKDAY, started_at)
ORDER BY number_of_riders DESC;



-- hourly_riders_by_member_type
SELECT 
    COUNT(ride_id) AS number_of_riders,
    DATEPART(HOUR, started_at) AS hour_of_day,
    member_casual
FROM cyclist_data
GROUP BY member_casual, DATEPART(HOUR, started_at)
ORDER BY number_of_riders DESC;



-- ride_length_analysis(exclude_negative_durations)
SELECT 
    member_casual,
    AVG(trip_duration_minutes) AS avg_duration,
    MIN(trip_duration_minutes) AS min_duration,
    MAX(trip_duration_minutes) AS max_duration
FROM cyclist_data
WHERE trip_duration_minutes >= 0
GROUP BY member_casual;
