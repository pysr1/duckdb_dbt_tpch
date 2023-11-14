
with source
as (
    select *
    from {{ source('tpch', 'part') }}
    )

SELECT
    p_partkey as part_key,
    p_name as part_name,
    p_mfgr as part_mrgr,
    p_brand as part_brand,
    p_type as part_type,
    p_size as part_size,
    p_container as part_container,
    p_retailprice as part_retail_price,
    p_comment as part_comment
from source