SELECT
  TBL_TOTAL.contributing_factor_vehicle_1,
  TBL_TOTAL.TOTAL,
  ROUND((TBL_TOTAL.TOTAL/SUM(TBL_TOTAL.TOTAL) OVER ())* 100, 2)  AS PERCENTAGE,
  ROUND(((SUM(TBL_TOTAL.TOTAL) OVER (ORDER BY TOTAL DESC))/SUM(TBL_TOTAL.TOTAL) OVER ())* 100, 2) AS PERCENTAGE_CUM
FROM 
(
    SELECT 
    contributing_factor_vehicle_1,
    COUNT(contributing_factor_vehicle_1) AS TOTAL
    FROM `bigquery-public-data.new_york_mv_collisions.nypd_mv_collisions` 
    WHERE borough = 'BROOKLYN' AND contributing_factor_vehicle_1 <> 'Unspecified'
    GROUP BY contributing_factor_vehicle_1
    ORDER BY TOTAL DESC 
) TBL_TOTAL

ORDER BY TOTAL DESC 
