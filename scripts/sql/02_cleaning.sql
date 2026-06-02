-- Step 1: deduplication_query

WITH cte AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY ride_id ORDER BY started_at) AS rn
    FROM cyclist_data
)
DELETE FROM cte WHERE rn > 1;


-- Step 2: delete_nulls
-- Delete rows with critical nulls (station names, timestamps)

DELETE FROM cyclist_data
WHERE started_at IS NULL 
   OR ended_at IS NULL
   OR start_station_name IS NULL
   OR end_station_name IS NULL;

----------------------OR---------------------------

-- Step 2: replace_nulls
-- Replace optional nulls with placeholders

UPDATE cyclist_data
SET start_station_name = ISNULL(start_station_name, 'Unknown Station'),
    end_station_name   = ISNULL(end_station_name, 'Unknown Station');



-- Step 3: delete_negative_trip-duration

DELETE FROM cyclist_data
WHERE trip_duration_minutes < 0;

