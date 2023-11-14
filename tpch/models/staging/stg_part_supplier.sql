with source
as (
    select *
    from {{ source('tpch', 'partsupp') }}
    )

SELECT
    ps_partkey as part_supplier_part_key,
    ps_suppkey as part_supplier_supplier_key,
    ps_availqty as part_supplier_available_quantity,
    ps_supplycost as part_supplier_cost,
    ps_comment as part_supplier_comment
from source