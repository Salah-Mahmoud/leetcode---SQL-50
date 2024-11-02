with cte_c as (
    select
        s.user_id,
        CASE
        WHEN c.action = 'confirmed' THEN 1
        ELSE 0
        END AS "confirmation"
    from Signups s
    left join Confirmations c
    on s.user_id=c.user_id
)
select
    user_id,
    round(sum(confirmation)::numeric / count(*)::numeric, 2) as confirmation_rate
from cte_c
group by user_id
