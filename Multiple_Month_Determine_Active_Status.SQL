WITH months AS
(SELECT
  '2017-01-01' as first_day,
  '2017-01-31' as last_day
UNION
SELECT
  '2017-02-01' as first_day,
  '2017-02-28' as last_day
UNION
SELECT
  '2017-03-01' as first_day,
  '2017-03-31' as last_day
),
cross_join AS
(SELECT *
FROM subscriptions
CROSS JOIN months),
-- Add status temporary table here
status AS
(SELECT cross_join.id,
cross_join.first_day as month,
CASE WHEN cross_join.subscription_start< cross_join.first_day AND 
(
    cross_join.subscription_end > cross_join.first_day
    OR subscription_end IS NULL
  ) 
THEN 1 
ELSE 0
END AS is_active
from cross_join)
SELECT *
FROM status
LIMIT 100;
