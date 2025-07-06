-- Combine all monthly data into one master table
CREATE OR REPLACE TABLE `project.dataset.all_trips` AS
SELECT * FROM `project.dataset.202406_cyclistic_tripdata_3_`
UNION ALL
SELECT * FROM `project.dataset.202407_cyclistic_tripdata`
-- (repeat through 202505)
UNION ALL
SELECT * FROM `project.dataset.202505_cyclistic_tripdata`;

-- Clean data and add ride duration and day of week
CREATE OR REPLACE TABLE `project.dataset.all_trips_cleaned_final` AS
SELECT 
  *,
  TIMESTAMP_DIFF(ended_at, started_at, SECOND) AS ride_length_seconds,
  EXTRACT(DAYOFWEEK FROM started_at) AS day_of_week
FROM `project.dataset.all_trips`
WHERE 
  started_at IS NOT NULL
  AND ended_at IS NOT NULL
  AND member_casual IS NOT NULL
  AND rideable_type IS NOT NULL
  AND TIMESTAMP_DIFF(ended_at, started_at, SECOND) BETWEEN 60 AND 21600;
