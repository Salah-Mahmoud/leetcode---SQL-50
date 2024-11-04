select
    contest_id,
    round((count(*)::numeric / (select count(distinct user_id) from Users)::numeric )*100, 2) as percentage
from
    Register
group by contest_id
order by percentage desc,contest_id