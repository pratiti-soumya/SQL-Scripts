drop table if exists LetterToNumber;


create table LetterToNumber(
    Letter varchar(2),
    Number DECIMAL(3,1)
);

insert into LetterToNumber (Letter, Number) values ("A", 4.0), ("B", 3.0), ("C", 2.0), ("D", 1.0), ("F", 0.0);
insert into LetterToNumber (Letter, Number) values ("A+", 4.3), ("A-", 3.7), ("B+", 3.3), ("B-", 2.7), ("C+", 2.3), ("C+", 1.7), ("D+", 1.3), ("D-", 0.7), ("F+", 0.3), ("F-", -0.3);


select id, sum(number*credits)/sum(credits) as GPA from
(
    select Student_points.id, Student_points.class_id, Student_points.grade, Student_points.Number, Class.credits from Class inner join
    (
        select Takes.id, Takes.class_id, Takes.grade, LetterToNumber.Number from Takes inner join LetterToNumber on Takes.grade = LetterToNumber.Letter
    ) as Student_points
    on Class.class_id = Student_points.class_id
) as Student_points_with_credits
group by id;

