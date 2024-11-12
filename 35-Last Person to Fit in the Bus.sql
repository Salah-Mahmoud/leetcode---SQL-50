with cte_Total_sum as (
    SELECT
        person_name,
        sum(weight) OVER (ORDER BY turn)  as Total_sum
    FROM Queue
)
select
    person_name
from cte_Total_sum
where Total_sum = (SELECT MAX(Total_sum) FROM cte_Total_sum WHERE Total_sum <= 1000);
