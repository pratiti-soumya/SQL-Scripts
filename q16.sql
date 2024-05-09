Update Student
inner join
(
    select Takes.id, SUM(Class.credits) as actual_tot_cred 
    from Class inner join Takes 
    on Takes.class_id = Class.class_id 
    group by Takes.id
) as Actual_cred
on Student.id = Actual_cred.id
set Student.tot_cred = Actual_cred.actual_tot_cred
;

select * from Student;
