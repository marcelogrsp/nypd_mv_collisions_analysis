SELECT FORMAT_DATETIME ("%Y-%m",timestamp) AS DATE,
COUNT(borough) COLLISIONS,
ROUND(AVG(COUNT(borough)) OVER() ) AS AVERAGE
FROM `bigquery-public-data.new_york_mv_collisions.nypd_mv_collisions` 
WHERE borough = 'BROOKLYN' AND timestamp BETWEEN '2021-01-01' AND '2021-11-30'

GROUP BY DATE
order by date
