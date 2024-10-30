-- By lag function
WITH ordered_weather AS (
  SELECT
    id,
    temperature,
    recordDate
  FROM
    Weather
  ORDER BY
    recordDate
),
cte_lag AS (
  SELECT
    id,
    temperature,
    recordDate,
    LAG(temperature, 1) OVER () AS previous_temp,
    LAG(recordDate, 1) OVER () AS previous_date
  FROM
    ordered_weather
)
SELECT id
FROM cte_lag
WHERE temperature > previous_temp
  AND (recordDate - previous_date) = 1;

 -- By join
select
    w1.id
from
    Weather w1
join Weather w2
on w1.recordDate-w2.recordDate=1
where w1.temperature > w2.temperature
