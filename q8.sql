# As above, but display the IDs of the students also, not just the names. (Keep IDs as the first column).

select id, name from Student where name not in 
(
    select Student.name from Student inner join Takes on Student.id=Takes.id where semester="Spring"
);