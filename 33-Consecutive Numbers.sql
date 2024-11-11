with cte_lag as (
    SELECT
        num,
        LAG(num, 1) OVER (ORDER BY id) as prev1,
        LAG(num, 2) OVER (ORDER BY id) as prev2
    FROM
        Logs
)
SELECT DISTINCT
    num AS ConsecutiveNums
FROM
    cte_lag
WHERE
    num = prev1 AND num = prev2