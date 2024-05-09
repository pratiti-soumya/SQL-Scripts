DELETE from Instructor where id in (select id from Student);

select * from Instructor;