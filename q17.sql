Update Instructor
inner join 
(
    select Instructor.id, count(s_id) as n_advisees 
    from Instructor left outer join Advisor
    on Instructor.id = Advisor.i_id
    group by Instructor.id
) as Num_advisees
on Instructor.id = Num_advisees.id
set Instructor.salary = Instructor.salary + Num_advisees.n_advisees*10000;

select * from Instructor;