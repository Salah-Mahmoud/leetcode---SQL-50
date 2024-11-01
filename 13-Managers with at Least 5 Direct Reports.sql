WITH cte_name AS (
    SELECT
        E1.managerId
    FROM
        Employee E1
    JOIN Employee E2
        ON E1.managerId = E2.id
    GROUP BY E1.managerId
    HAVING COUNT(*) >= 5
)
SELECT
    E1.name
FROM
    cte_name
JOIN Employee E1
    ON cte_name.managerId = E1.managerId;
