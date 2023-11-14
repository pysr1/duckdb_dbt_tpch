with source 
as (
    SELECT *
    FROM {{ source('tpch', 'nation') }}
   )


SELECT
    n_nationkey as nation_key,
    n_name as nation_name,
    n_regionkey as nation_region_key,
    n_comment as nation_comment,
FROM 
source