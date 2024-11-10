WITH cte_manager AS (
    SELECT
        E1.reports_to,
        E1.age,
        E2.employee_id AS manager_id,
        E2.name AS manager_name
    FROM Employees E1
    JOIN Employees E2
    ON E1.reports_to = E2.employee_id
)
SELECT
    manager_id AS employee_id,
    manager_name AS name,
    COUNT(reports_to) AS reports_count,
    ROUND(AVG(age)) AS average_age
FROM
    cte_manager
GROUP BY
    manager_id, manager_name
ORDER BY
    manager_id;
