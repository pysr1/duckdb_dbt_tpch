with order_info as (
    SELECT * FROM {{ ref('int_order_info_joined') }}
),

cust_rfm_aggs as (
SELECT 
    cust_key,
    max(order_date) as recency,
    count(distinct order_key) as frequency,
    sum(order_total_price) monetary_value,

from order_info
group by 1)

SELECT 
ntile(3) over(order by recency asc) as recency,
ntile(3) over(order by frequency asc) as frequency,
ntile(3) over(order by monetary_value asc) as monetary_value
FROM cust_rfm_aggs
order by recency desc

