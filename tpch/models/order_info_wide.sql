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
lineitem.*, 
orders.*,
customers.*
from lineitem
left join orders 
on lineitem.lineitem_order_key = orders.order_key  
left join customers
on orders.order_cust_key = customers.cust_key