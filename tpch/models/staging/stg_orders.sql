with source
as (
    select *
    from {{ source('dev', 'orders') }}
    )

SELECT o_orderkey as order_key,
       o_custkey as order_cust_key,
       o_orderstatus as order_status,
       o_totalprice as order_total_price,
       o_orderdate as order_date,
       o_orderpriority as order_priority,
       replace(o_clerk, 'Clerk#', '')  as order_clerk,
       o_shippriority as order_ship_priority,
       o_comment as order_comment
from source
