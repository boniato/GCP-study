SELECT
   AVG(CAST(st_year AS FLOAT64))     AS average  /*st_year column is string type.*/
  ,CAST( st_year AS FLOAT64)         AS cast_result
  ,SAFE_CAST(st_year AS FLOAT64)     AS safe_cast_result
  ,CAST(null AS FLOAT64)             AS cast_null
  ,SAFE_CAST(null AS FLOAT64)        AS safe_cast_null
  ,SAFE_CAST('abc' AS FLOAT64)       AS single_blank
  ,SAFE_CAST("abc" AS FLOAT64)       AS double_blank
FROM `gcp.test.sample`
WHERE 1 = 1
AND cast(st_year AS INT64) < 1980
GROUP BY col1, col2, st_year
