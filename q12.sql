SELECT name
FROM (SELECT S.id AS id, S.name as name, year, semester, SUM(C.credits) AS credits
    FROM Student S, Class C, Takes T
    WHERE S.id = T.id AND T.class_id = C.class_id AND year = 2009 AND semester = 'Fall'
    GROUP BY S.id, year, semester) student_2009F_credits
WHERE credits <= ALL (SELECT SUM(C.credits) AS credits
    FROM Student S, Class C, Takes T
    WHERE S.id = T.id AND T.class_id = C.class_id AND S.id = student_2009F_credits.id
    GROUP BY year, semester);
