SELECT 
    contributing_factor_vehicle_1,
    SUM(number_of_cyclist_killed + number_of_motorist_killed + number_of_pedestrians_killed + number_of_persons_killed) AS FATAL_COLLISIONS

FROM `bigquery-public-data.new_york_mv_collisions.nypd_mv_collisions` 
WHERE borough = 'BROOKLYN' AND contributing_factor_vehicle_1 <> 'Unspecified'
GROUP BY contributing_factor_vehicle_1, (number_of_cyclist_killed + number_of_motorist_killed + number_of_pedestrians_killed + number_of_persons_killed)
ORDER BY FATAL_COLLISIONS DESC 
