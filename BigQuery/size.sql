SELECT
  SIZE, transaction_cnt, 
  ROUND((transaction_cnt / (SELECT COUNT(use_space) FROM `gcp-hackathon-project.real_estate.apartment_transaction_2017`) * 100), 2) AS ratio
FROM
  (
  SELECT
    '60m^2 이하' as size
    ,COUNT(use_space) AS transaction_cnt
  FROM `gcp-hackathon-project.real_estate.apartment_transaction_2017` 
  WHERE use_space <= 60
  UNION ALL
  SELECT 
    '61~85m^2 이하' as size,
    COUNT(use_space) AS transaction_cnt
  FROM `gcp-hackathon-project.real_estate.apartment_transaction_2017` 
  WHERE use_space between 61 and 85
  UNION ALL
  SELECT 
    '85m^2 초과' as size
    ,COUNT(use_space) AS transaction_cnt
  FROM `gcp-hackathon-project.real_estate.apartment_transaction_2017` 
  WHERE use_space > 85
  ORDER BY size DESC) as x
