# Find all student names who took a class without taking its prerequisite (eventually)


select name from Student inner join
(
    select id from
    (
        select Takes.id, Takes.class_id, Prereq.prereq_id from Takes inner join Prereq on Takes.class_id = Prereq.class_id
    ) as Students_taking_class_with_prereqs
    where id not in
    (
        select Takes.id from Takes inner join
        (
            select Takes.id, Takes.class_id, Prereq.prereq_id from Takes inner join Prereq on Takes.class_id = Prereq.class_id
        ) as Students_taking_class_with_prereqs
        on Takes.id=Students_taking_class_with_prereqs.id and Takes.class_id=Students_taking_class_with_prereqs.prereq_id
    )
) as Student_ids_taking_class_without_prereqs
on Student.id = Student_ids_taking_class_without_prereqs.id
;
