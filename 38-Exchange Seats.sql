select
    case
        when id = (select max(id) from Seat) and id %2 != 0 then id
        when id %2 = 0 then id-1
        when id %2 != 0 then id+1
    end as id,
    student
from Seat
order by id
