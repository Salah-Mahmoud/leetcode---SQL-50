with salary_rank_cte as
(
    select
        d.name as Department,
        e.name as Employee,
        Salary,
        DENSE_RANK () OVER (
            PARTITION BY departmentId
            ORDER BY salary DESC
        ) salary_rank
    from Employee e
    join Department d
    on e.departmentId = d.id
)
select
    Department,
    Employee,
    Salary
from salary_rank_cte
where salary_rank<=3