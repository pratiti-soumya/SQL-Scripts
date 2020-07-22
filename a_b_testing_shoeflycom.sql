import codecademylib
import pandas as pd
import numpy as np

ad_clicks = pd.read_csv('ad_clicks.csv')
-- 1. Examine the first few rows of ad_clicks.
print(ad_clicks.head())

--2. How many views (i.e., rows of the table) came from each utm_source?
source_views= ad_clicks.groupby('utm_source').user_id.count().reset_index()

print('Source Views:',source_views)

--3. If the column ad_click_timestamp is not null, then someone actually clicked on the ad that was displayed.
--Create a new column called is_click, which is True if ad_click_timestamp is not null and False otherwise.

ad_clicks['is_click']= ad_clicks.ad_click_timestamp.apply(lambda x: False if pd.isnull(x) else True)

print(ad_clicks.head())

-- 4. We want to know the percent of people who clicked on ads from each utm_source.

clicks_by_source = ad_clicks.groupby(['utm_source','is_click']).user_id.count().reset_index()

print(clicks_by_source)

clicks_pivot= clicks_by_source.pivot(
  columns='is_click',
  index='utm_source',
  values='user_id'
).reset_index()
print('Pivoted')
print(clicks_pivot)

clicks_pivot['percent_clicked']=(clicks_pivot[True])/(clicks_pivot[True]+clicks_pivot[False])
print(clicks_pivot)

-- Percent users who clicked from each experimental group

ab_views=ad_clicks.groupby('experimental_group').user_id.count().reset_index()


ab_clicks= ad_clicks.groupby(['experimental_group','is_click']).user_id.count().reset_index()

ab_clicks_pivot= ab_clicks.pivot(
                  columns='is_click',
              index='experimental_group',
                  values='user_id').reset_index()

print(ab_clicks_pivot)
                                                                                      
--8.percentage of users clicked on Ad A or Ad B.
                                                                                      
ab_clicks_pivot['percent_clicked']=(ab_clicks_pivot[True])/(ab_clicks_pivot[True]+ab_clicks_pivot[False])
print(ab_clicks_pivot)
---/////////////////////////////////
--9. A/ B Testing                                                                                                  
                                                                                                  
a_clicks= ad_clicks[ad_clicks['experimental_group']=='A']
b_clicks= ad_clicks[ad_clicks['experimental_group']=='B']

print(a_clicks)
print(b_clicks)

day_click_a= a_clicks.groupby(['day','is_click']).user_id.count().reset_index()

day_click_b= b_clicks.groupby(['day','is_click']).user_id.count().reset_index()

day_click_a_pivot= day_click_a.pivot(
  columns='is_click',
  index='day',
  values='user_id'
).reset_index()

day_click_a_pivot['percent_clicked']=(day_click_a_pivot[True])/(day_click_a_pivot[True]+day_click_a_pivot[False])

print(day_click_a_pivot)

day_click_b_pivot= day_click_b.pivot(
  columns='is_click',
  index='day',
  values='user_id'
).reset_index()

day_click_b_pivot['percent_clicked']=(day_click_b_pivot[True])/(day_click_b_pivot[True]+day_click_b_pivot[False])

print(day_click_b_pivot)
