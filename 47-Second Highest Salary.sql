with cte_e as (
select  id,
        salary,
        DENSE_RANK() OVER (
		ORDER BY salary desc
	    ) dense_rank_number
from Employee 
)
SELECT 
    CASE 
        WHEN EXISTS (SELECT 1 FROM cte_e WHERE dense_rank_number = 2) 
        THEN (SELECT salary FROM cte_e WHERE dense_rank_number = 2 limit 1)
        ELSE NULL
    END AS SecondHighestSalary;