SELECT 
    ADDRESS_ID ,
	ADDRESS ,
	ZIPCODE ,
	STATE ,
	COUNTRY 
FROM {{ source('postgres', 'addresses') }}