-- COUNT NUMBER OF SUBSCRIBERS TO NEWSPAPER IN EACH MONTH

SELECT month, count(*)
FROM newspaper
CROSS JOIN months
WHERE start_month<=month
and end_month>=month
GROUP BY month;
