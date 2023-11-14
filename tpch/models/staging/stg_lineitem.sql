with source 
as (
    SELECT *
    FROM {{ source('tpch', 'lineitem') }}
   )

SELECT 
    {{ dbt_utils.generate_surrogate_key(['l_orderkey', 'l_linenumber']) }} as lineitem_key,
    l_orderkey as lineitem_order_key, 
    l_partkey as lineitem_part_key, 
    l_suppkey as lineitem_supplied_key,
    l_linenumber as lineitem_linenumber,
    ---- I'm gonna assume that any value that isn't 'N' is a return 
    case when l_returnflag = 'N' then l_quantity else 0 - l_quantity end as lineitem_quantity,
    l_extendedprice as lineitem_extended_price,
    l_discount as lineitem_discount, 
    l_tax as lineitem_tax, 
    (l_extendedprice *  (1 - l_discount)) as lineitem_line_total,
    ((l_extendedprice *  (1 - l_discount)) * (1 + l_tax)) as lineitem_line_total_tax,
    l_returnflag as lineitem_return_flag,
    l_linestatus as lineitem_line_status,
    l_shipmode as lineitem_ship_mode,
    l_comment as lineitem_comment,
    l_shipinstruct as lineitem_ship_instruct,
    l_shipdate as lineitem_ship_date, 
    l_commitdate as lineitem_commit_date, 
    l_receiptdate as lineitem_receipt_date
from source