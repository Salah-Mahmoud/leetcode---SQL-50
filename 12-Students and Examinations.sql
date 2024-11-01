with cte_attendance as (
    select
        S.student_id,
        S.student_name,
        Sub.subject_name,
        count(E.student_id) as attended_exams
    from
        Students S
    cross join Subjects Sub
    left join Examinations E
    on E.student_id=S.student_id and E.subject_name=Sub.subject_name
    group by S.student_id,S.student_name,Sub.subject_name
    order by S.student_id ,Sub.subject_name
)
select *
from cte_attendance