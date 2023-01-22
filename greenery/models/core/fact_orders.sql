select
    o.order_id,
    o.created_at,
    o.status,
    o.ESTIMATED_DELIVERY_AT,
	o.DELIVERED_AT ,
    o.user_id,
    u.first_name,
    u.last_name,
    p.product_id,
    p.name as "product_name",
    i.quantity,
    p.price,
    pr.discount,
    o.order_cost,
    datediff('hour',o.created_at,o.delivered_at) as hours_till_delivery
from {{ref('stg_postgres_orders')}} o
left join {{ref('stg_postgres_users')}} u on o.user_id=u.user_id
left join {{ ref('stg_postgres_order_items') }} i on i.order_id=o.order_id
left join {{ ref('stg_postgres_products') }} p on i.product_id=p.product_id
left join {{ ref('stg_postgres_promos') }} pr on pr.promo_id=o.promo_id

