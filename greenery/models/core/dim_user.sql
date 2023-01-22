select 
  user_id, 
  full_name,
  email, 
  phone_number, 
  created_at_utc, 
  updated_at_utc, 
  address_id,
  address,
  zipcode,
  state,
  country
from {{ref('int_user_address')}} 