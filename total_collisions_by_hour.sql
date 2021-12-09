SELECT 
    FORMAT_DATETIME ("%H",timestamp) AS HOUR,
    contributing_factor_vehicle_1,
    COUNT(contributing_factor_vehicle_1) AS TOTAL_COLLISIONS

FROM `bigquery-public-data.new_york_mv_collisions.nypd_mv_collisions` 
WHERE borough = 'BROOKLYN' AND contributing_factor_vehicle_1 <> 'Unspecified' 

GROUP BY HOUR, contributing_factor_vehicle_1
ORDER BY HOUR, TOTAL_COLLISIONS DESC
