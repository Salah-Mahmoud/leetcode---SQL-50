select
    employee_id
from Employees
WHERE salary < 30000
  AND manager_id NOT IN (SELECT employee_id FROM Employees WHERE employee_id IS NOT NULL)
  order by employee_id
