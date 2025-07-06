-- Count unique rides and distinct stations
SELECT 
  COUNT(DISTINCT ride_id) AS unique_rides,
  COUNT(DISTINCT start_station_name) AS unique_start_stations,
  COUNT(DISTINCT end_station_name) AS unique_end_stations
FROM `project.dataset.all_trips_cleaned_final`;

-- Explore ride duration extremes and averages
SELECT 
  MIN(ride_length_seconds) AS min_seconds,
  MAX(ride_length_seconds) AS max_seconds,
  AVG(ride_length_seconds) AS avg_seconds
FROM `project.dataset.all_trips_cleaned_final`;
