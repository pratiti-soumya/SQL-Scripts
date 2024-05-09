# Find the names of all students who have ever received a grade of A- or above.

select name from Student where name not in 
(
    select name from Student where name not in 
    (
        select Student.name from Student inner join Takes on Student.id = Takes.id where Takes.grade in ("A-", "A")
    )

);
