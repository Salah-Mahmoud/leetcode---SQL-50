-- bad solution
with cte_process as (
    select
        A1.machine_id,
        A1.process_id,
        abs(A1.timestamp - A2.timestamp) as processing_t
    from
        Activity A1
    join Activity A2
    on A1.machine_id = A2.machine_id
       and A1.process_id = A2.process_id
       and A1.activity_type != A2.activity_type
    where A2.activity_type='start'

)
select
    machine_id,
    round(avg(processing_t)::numeric, 3) as processing_time
from cte_process
group by machine_id

-- good solution
SELECT  machine_id,
        ROUND(
            AVG(
            CASE
                WHEN activity_type = 'start' THEN -timestamp
                ELSE timestamp
            END)::decimal * 2
            , 3) AS processing_time
FROM Activity
GROUP BY machine_id
ORDER BY machine_id ASC;