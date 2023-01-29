with events as (
    select 
        *
    from {{ref('stg_postgres_events')}}
)

{%- set event_types = dbt_utils.get_column_values(
      table=ref('stg_postgres_events') 
      ,column='event_type'
      ,order_by='event_type asc'
      ) 
-%}

select 
    session_id
    , product_id
    , order_id
    {%- for event_type in event_types %}
    , {{aggregation('event_type', event_type)}} as {{event_type}}
    {%- endfor %}
from events
group by 1,2,3
