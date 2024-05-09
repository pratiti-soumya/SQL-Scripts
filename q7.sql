# Display the names of all students who have never taken a class in the Spring quarter of either 2009 or 2010

select name from Student where name not in 
(
    select Student.name from Student inner join Takes on Student.id=Takes.id where semester="Spring"
);