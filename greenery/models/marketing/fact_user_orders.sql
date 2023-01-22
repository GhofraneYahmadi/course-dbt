with user_orders as (
    select 
        user_id,
        count(distinct o.order_id) as total_orders, 
        sum(order_total) as total_spend, 
        min(created_at) as first_order,
        max(created_at) as last_order        
    from {{ref('stg_postgres_orders')}} o
    group by user_id
)

select 
    u.user_id, 
    concat(u.first_name,' ',u.last_name) as full_user_name,
    u.email, 
    o.total_orders, 
    o.total_spend, 
    o.first_order,
    o.last_order
from {{ref('stg_postgres_users')}} u
left join user_orders o on u.user_id = o.user_id