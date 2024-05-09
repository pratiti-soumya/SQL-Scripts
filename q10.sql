#Find the names all students who never took a class from their home department if any.

select name from Student where name not in
(
    select Student.name from Student inner join 
        (
            select Takes.id, Class.dept from Takes inner join Class on Takes.class_id = Class.class_id
        ) as Takes_in_dept
    on Student.id = Takes_in_dept.id where Student.dept=Takes_in_dept.dept 
);