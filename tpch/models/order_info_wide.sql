{{ config(materialized='external', location='order_info_wide.parquet') }}


with orders as (
    SELECT * FROM {{ ref('stg_orders') }}
),

customers as (
    SELECT * FROM {{ ref('stg_customer') }}
),

lineitem as (
    SELECT * FROM {{ ref('stg_lineitem')}}
)

SELECT
{{ dbt_utils.star(from=ref('stg_lineitem'))}},
{{ dbt_utils.star(from=ref('stg_orders'))}},
{{ dbt_utils.star(from=ref('stg_customer'))}},
from lineitem
left join orders 
on lineitem.lineitem_order_key = orders.order_key  
left join customers
on orders.order_cust_key = customers.cust_key