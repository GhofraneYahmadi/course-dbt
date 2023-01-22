select 
    product_id,
    "product_name",
    price,
    inventory, 
    total_events,
    total_sessions as "total_views"
from {{ref('int_product_page')}}