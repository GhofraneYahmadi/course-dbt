with products as (
    select 
        product_id,
        name, 
        price,
        inventory
    from {{ ref('stg_postgres_products') }}
)

,events as (
    select
        event_id,
        session_id,
        user_id,
        event_type,
        page_url,
        created_at,
        order_id,
        product_id
    from {{ ref('stg_postgres_events')}}
)

select 
    p.product_id,
    p.name as "product_name",
    p.price,
    p.inventory,
    count(distinct e.event_id) as total_events,
    count(distinct session_id) as total_sessions
from products p 
left join events e on p.product_id=e.product_id
group by 1,2,3,4