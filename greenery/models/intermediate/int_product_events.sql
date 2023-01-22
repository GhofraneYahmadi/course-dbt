select 
    p.product_id,
    p.name,
    p.price,
    p.inventory, 
    count(distinct e.event_id) as total_events,
    count(distinct e.session_id) as total_sessions
from {{ ref('stg_postgres_products') }} p 
left join {{ ref('stg_postgres_events')}} e on p.product_id=e.product_id
group by 1,2,3,4