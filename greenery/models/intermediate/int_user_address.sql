select
  user_id, 
  concat(first_name,' ',last_name) as full_name,
  email, 
  phone_number, 
  created_at::timestamp as created_at_utc, 
  updated_at::timestamp as updated_at_utc, 
  u.address_id,
  address,
  zipcode,
  state,
  country
 
from  {{ref('stg_postgres_users')}} u
left join {{ref('stg_postgres_addresses')}} a on u.address_id = a.address_id