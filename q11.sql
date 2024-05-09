SELECT N.id
FROM (
    SELECT id, COUNT(*) count9
    FROM Takes
    WHERE year = 2009
    GROUP BY id) N
LEFT OUTER JOIN (
    SELECT id, COUNT(*) count10
    FROM Takes
    WHERE year = 2010
    GROUP BY id) T ON N.id = T.id
WHERE count9 > count10
OR count10 IS NULL
GROUP BY N.id;
