--최근 3년동안 각 지역의 매매량
SELECT si, contract_date, COUNT(contract_date) AS contract_cnt
FROM `gcp-hackathon-project.real_estate.apartment_transaction_2016`
WHERE si = '서울특별시'
GROUP BY si, contract_date
UNION ALL
SELECT si, contract_date, COUNT(contract_date) AS contract_cnt
FROM `gcp-hackathon-project.real_estate.apartment_transaction_2017`
WHERE si = '서울특별시'
GROUP BY si, contract_date
UNION ALL
SELECT si, contract_date, COUNT(contract_date) AS contract_cnt
FROM `gcp-hackathon-project.real_estate.apartment_transaction_2018`
WHERE si = '서울특별시'
GROUP BY si, contract_date
ORDER BY si, contract_date ASC
