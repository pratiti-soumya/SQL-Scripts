select semester, year, class_id, sec_id, Enrolled from
(
    select semester, year, class_id, sec_id, Count(id) as Enrolled from Takes group by semester, year, class_id, sec_id
) as Course_enrollment
group by semester, year, class_id
having Enrolled=MAX(Enrolled);