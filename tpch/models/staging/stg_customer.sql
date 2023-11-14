with source
as (
    SELECT *
    FROM {{ source('tpch', 'customer') }}
   )

SELECT c_custkey as cust_key,
       c_name as cust_name,
       c_address as cust_address,
       c_nationkey as cust_nation_key,
       c_phone as cust_phone,
       c_acctbal as cust_account_balance,
       c_mktsegment as cust_market_segment,
       c_comment as cust_comment
from source