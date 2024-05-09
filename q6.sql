select Student.name, id_credits_sum.credits_sum from Student inner join
(
    select Takes.id, SUM(Class.credits) as credits_sum from Class inner join Takes on Takes.class_id = Class.class_id group by Takes.id
) as id_credits_sum
on Student.id=id_credits_sum.id;