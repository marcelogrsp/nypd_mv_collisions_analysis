-- Alcohol Involvement
WITH CTE AS (

    SELECT 
        contributing_factor_vehicle_1,
        EXTRACT (HOUR FROM timestamp) AS HOUR,
        COUNT(contributing_factor_vehicle_1) AS TOTAL_COLLISIONS

        FROM `bigquery-public-data.new_york_mv_collisions.nypd_mv_collisions` 
        WHERE borough = 'BROOKLYN' AND contributing_factor_vehicle_1 = 'Alcohol Involvement' 
    GROUP BY contributing_factor_vehicle_1, HOUR
    ORDER BY TOTAL_COLLISIONS DESC

)


SELECT * FROM CTE AS CTE1
WHERE TOTAL_COLLISIONS =
(
    SELECT MAX(TOTAL_COLLISIONS) AS TOTAL_COLLISIONS
    FROM CTE AS CTE2 WHERE CTE1.contributing_factor_vehicle_1 = CTE2.contributing_factor_vehicle_1
)
ORDER BY HOUR


-- Unsafe Speed
WITH CTE AS (

    SELECT 
        contributing_factor_vehicle_1,
        EXTRACT (HOUR FROM timestamp) AS HOUR,
        COUNT(contributing_factor_vehicle_1) AS TOTAL_COLLISIONS

        FROM `bigquery-public-data.new_york_mv_collisions.nypd_mv_collisions` 
        WHERE borough = 'BROOKLYN' AND contributing_factor_vehicle_1 = 'Unsafe Speed' 
    GROUP BY contributing_factor_vehicle_1, HOUR
    ORDER BY TOTAL_COLLISIONS DESC

)


SELECT * FROM CTE AS CTE1
WHERE TOTAL_COLLISIONS =
(
    SELECT MAX(TOTAL_COLLISIONS) AS TOTAL_COLLISIONS
    FROM CTE AS CTE2 WHERE CTE1.contributing_factor_vehicle_1 = CTE2.contributing_factor_vehicle_1
)
ORDER BY HOUR
