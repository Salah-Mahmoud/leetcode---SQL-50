with categories (category) as (
    values 
        ('Low Salary'), 
        ('Average Salary'), 
        ('High Salary')
),
cte_c as (
    SELECT 
        CASE 
            WHEN income < 20000 THEN 'Low Salary' 
            WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary' 
            WHEN income > 50000 THEN 'High Salary' 
        END AS category       
    FROM Accounts 
)

select 
    ca.category, 
    COALESCE(count(ct.category), 0) as accounts_count 
from categories ca
left join cte_c ct
on ca.category = ct.category
group by ca.category;