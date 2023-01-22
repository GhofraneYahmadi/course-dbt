select 
    product_id,
    name,
    price,
    inventory,
    total_events,
    total_sessions
from {{ref('int_product_events')}} 