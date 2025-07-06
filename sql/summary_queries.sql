-- Average ride duration in minutes by rider type
SELECT 
  member_casual,
  ROUND(AVG(ride_length_seconds) / 60, 2) AS avg_duration_min
FROM `project.dataset.all_trips_cleaned_final`
GROUP BY member_casual;

-- Total rides by member vs casual
SELECT 
  member_casual,
  COUNT(*) AS total_rides
FROM `project.dataset.all_trips_cleaned_final`
GROUP BY member_casual;

-- Ride patterns by day of week and user type
SELECT 
  member_casual,
  day_of_week,
  COUNT(*) AS total_rides,
  ROUND(AVG(ride_length_seconds) / 60, 2) AS avg_duration_min
FROM `project.dataset.all_trips_cleaned_final`
GROUP BY member_casual, day_of_week
ORDER BY member_casual, day_of_week;
