select name from Instructor inner join
(
    select id from Teaches where class_id like "CS-3%" group by id
) as Instructor_ids_cs_3
on Instructor.id = Instructor_ids_cs_3.id;
