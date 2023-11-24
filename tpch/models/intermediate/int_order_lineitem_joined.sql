---{% set date_cols = ['order_date', 'lineitem_ship_date', 'lineitem_commit_date'] %}
{% set cols = ['r', 'f', 'm'] %}

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
{% set date_cols = ['order_date', 'lineitem_ship_date', 'lineitem_commit_date'] %}

{% for col in date_cols -%}
    year({{ col }} ) as {{ col }}_year,
    month({{ col }} ) as {{ col }}_month,
    day({{ col }} ) as {{ col }}_day,
    quarter({{ col }} ) as {{ col }}_year,
{% endfor -%}


from lineitem
left join orders 
on lineitem.lineitem_order_key = orders.order_key  
left join customers
on orders.order_cust_key = customers.cust_key