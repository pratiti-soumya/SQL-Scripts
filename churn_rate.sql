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
status AS
(SELECT id, first_day as month,
CASE
  WHEN (subscription_start < first_day)
    AND (
      subscription_end > first_day
      OR subscription_end IS NULL
    ) THEN 1
  ELSE 0
END as is_active,
CASE 
  WHEN subscription_end BETWEEN first_day AND last_day THEN 1
  ELSE 0
END as is_canceled
FROM cross_join),
status_aggregate AS
(SELECT
  month,
  SUM(is_active) as active,
  SUM(is_canceled) as canceled
FROM status
GROUP BY month)
-- add your churn calculation here
SELECT month,
1.0*(status_aggregate.canceled)/(status_aggregate.active) as churn_rate
FROM status_aggregate;

--Outputs:
--month	churn_rate
--2017-01-01	0.126811594202899
--2017-02-01	0.124505928853755
--2017-03-01	0.23688155922039

--subscriptions TABLE:
--1000 rows
--id	INTEGER
--subscription_start	TEXT
--subscription_end	TEXT
