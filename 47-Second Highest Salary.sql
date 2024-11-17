WITH rank_second_salary AS (
    SELECT
        salary AS SecondHighestSalary,
        RANK() OVER (ORDER BY salary DESC) AS Salary_rank
    FROM Employee
)
SELECT
    SecondHighestSalary
FROM
    rank_second_salary
WHERE Salary_rank = 2
UNION ALL
SELECT
    NULL
WHERE NOT EXISTS (
    SELECT 1
    FROM rank_second_salary
    WHERE Salary_rank = 2
);
