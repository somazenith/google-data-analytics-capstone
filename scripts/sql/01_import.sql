-- Step 1: join_tables

USE cyclistic_data;

-- Combine all monthly tables into one master table
SELECT
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    start_station_id,
    end_station_name,
    end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual
INTO cyclist_data
FROM dbo.[202501-divvy-tripdata]
UNION ALL
SELECT
    ride_id, rideable_type, started_at, ended_at,
    start_station_name, start_station_id,
    end_station_name, end_station_id,
    start_lat, start_lng, end_lat, end_lng,
    member_casual
FROM dbo.[202502-divvy-tripdata]
UNION ALL
SELECT
    ride_id, rideable_type, started_at, ended_at,
    start_station_name, start_station_id,
    end_station_name, end_station_id,
    start_lat, start_lng, end_lat, end_lng,
    member_casual
FROM dbo.[202503-divvy-tripdata]
UNION ALL
SELECT
    ride_id, rideable_type, started_at, ended_at,
    start_station_name, start_station_id,
    end_station_name, end_station_id,
    start_lat, start_lng, end_lat, end_lng,
    member_casual
FROM dbo.[202504-divvy-tripdata]
UNION ALL
SELECT
    ride_id, rideable_type, started_at, ended_at,
    start_station_name, start_station_id,
    end_station_name, end_station_id,
    start_lat, start_lng, end_lat, end_lng,
    member_casual
FROM dbo.[202505-divvy-tripdata]
UNION ALL
SELECT
    ride_id, rideable_type, started_at, ended_at,
    start_station_name, start_station_id,
    end_station_name, end_station_id,
    start_lat, start_lng, end_lat, end_lng,
    member_casual
FROM dbo.[202506-divvy-tripdata]
UNION ALL
SELECT
    ride_id, rideable_type, started_at, ended_at,
    start_station_name, start_station_id,
    end_station_name, end_station_id,
    start_lat, start_lng, end_lat, end_lng,
    member_casual
FROM dbo.[202507-divvy-tripdata]
UNION ALL
SELECT
    ride_id, rideable_type, started_at, ended_at,
    start_station_name, start_station_id,
    end_station_name, end_station_id,
    start_lat, start_lng, end_lat, end_lng,
    member_casual
FROM dbo.[202508-divvy-tripdata]
UNION ALL
SELECT
    ride_id, rideable_type, started_at, ended_at,
    start_station_name, start_station_id,
    end_station_name, end_station_id,
    start_lat, start_lng, end_lat, end_lng,
    member_casual
FROM dbo.[202509-divvy-tripdata]
UNION ALL
SELECT
    ride_id, rideable_type, started_at, ended_at,
    start_station_name, start_station_id,
    end_station_name, end_station_id,
    start_lat, start_lng, end_lat, end_lng,
    member_casual
FROM dbo.[202510-divvy-tripdata]
UNION ALL
SELECT
    ride_id, rideable_type, started_at, ended_at,
    start_station_name, start_station_id,
    end_station_name, end_station_id,
    start_lat, start_lng, end_lat, end_lng,
    member_casual
FROM dbo.[202511-divvy-tripdata]
UNION ALL
SELECT
    ride_id, rideable_type, started_at, ended_at,
    start_station_name, start_station_id,
    end_station_name, end_station_id,
    start_lat, start_lng, end_lat, end_lng,
    member_casual
FROM dbo.[202512-divvy-tripdata];


-- Step 2: add_columns

ALTER TABLE cyclist_data 
ADD trip_duration_minutes INT, 
	month NVARCHAR(20), 
	day_of_week NVARCHAR(20), 
	season NVARCHAR(10);


-- Step 3: populate_derived_columns

USE cyclistic_data;

UPDATE cyclist_data
SET trip_duration_minutes = DATEDIFF(MINUTE, started_at, ended_at),
    month = DATENAME(MONTH, started_at),
    day_of_week = DATENAME(WEEKDAY, started_at),
    season = CASE 
        WHEN MONTH(started_at) IN (12,1,2) THEN 'Winter'
        WHEN MONTH(started_at) IN (3,4,5) THEN 'Spring'
        WHEN MONTH(started_at) IN (6,7,8) THEN 'Summer'
        WHEN MONTH(started_at) IN (9,10,11) THEN 'Fall'
    END;



-- Step 4: verify_updates

USE cyclistic_data;

SELECT TOP 10 
    ride_id, started_at, ended_at, trip_duration_minutes, month, day_of_week, season
FROM cyclist_data;
