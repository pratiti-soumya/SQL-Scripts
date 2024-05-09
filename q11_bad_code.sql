select id from 
(
    select n_classes_2010.id, n_classes_2010.n_classes as n_classes_2010, n_classes_2009.n_classes as n_classes_2009 from
    (
        select All_student_ids.id, Count(Takes_in_2010.class_id) as n_classes from
        (
            select Student.id from Student
        ) as All_student_ids left outer join
        (
            select Takes.id, Takes.class_id from Takes where Takes.year=2010
        ) as Takes_in_2010
        on All_student_ids.id = Takes_in_2010.id
        group by All_student_ids.id
        
    ) as n_classes_2010

    inner join

    (
        select All_student_ids.id, Count(Takes_in_2009.class_id) as n_classes from
        (
            select Student.id from Student
        ) as All_student_ids left outer join
        (
            select Takes.id, Takes.class_id from Takes where Takes.year=2009
        ) as Takes_in_2009
        on All_student_ids.id = Takes_in_2009.id
        group by All_student_ids.id

    ) as n_classes_2009

    on n_classes_2010.id=n_classes_2009.id

) as n_classes_table
where n_classes_table.n_classes_2009>n_classes_table.n_classes_2010;

