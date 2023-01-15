**# question 1: How many UNIQUE users do we have?** 

`SELECT
    COUNT(DISTINCT USER_ID)
FROM DEV_DB.DBT_GHOFRANEYAHMADIAUDIBENEDE.STG_POSTGRES_USERS;`

*# answer 1: 130 users*


**# question 2: On average, how many orders do we receive per hour?**

`WITH orders_by_hour AS (
    SELECT 
        COUNT(DISTINCT order_id) as orders,
        HOUR(created_at) 
    FROM DEV_DB.DBT_GHOFRANEYAHMADIAUDIBENEDE.STG_POSTGRES_ORDERS 
    GROUP by 2)
SELECT AVG(orders) FROM orders_by_hour;`

*# answer 2: 15.041667 orders per hour*


**# question 3: On average, how long does an order take from being placed to being delivered?**

`SELECT 
    AVG(DATEDIFF('hour', created_at, delivered_at)) as hours_to_deliver,
    AVG(DATEDIFF('day', created_at, delivered_at)) as days_to_deliver
FROM DEV_DB.DBT_GHOFRANEYAHMADIAUDIBENEDE.STG_POSTGRES_ORDERS;`

*# answer 3: 93.403279 hours to deliver or 3.891803 days to deliver*


**# question 4: How many users have only made one purchase? Two purchases? Three+ purchases?**

`WITH orders_by_user AS ( 
    SELECT 
        user_id, 
        COUNT(DISTINCT order_id) AS orders 
    FROM DEV_DB.DBT_GHOFRANEYAHMADIAUDIBENEDE.STG_POSTGRES_ORDERS 
    GROUP BY user_id )

SELECT 
    SUM(case when orders = 1 then 1 else 0 end) AS users_with_one_purchase, 
    SUM(case when orders = 2 then 1 else 0 end) AS users_with_two_purchase, 
    SUM(case when orders >= 3 then 1 else 0 end) AS users_with_more_three_purchase 
FROM orders_by_user;`

*# answer 4: 25 users with one purchase,	28 users with two purchases, 71 users with 3+ purchases*


**# question 5: On average, how many unique sessions do we have per hour?**

`WITH sessions_by_hour AS (
    SELECT 
        COUNT(DISTINCT SESSION_ID) as sessions,
        HOUR(created_at) 
    FROM DEV_DB.DBT_GHOFRANEYAHMADIAUDIBENEDE.STG_POSTGRES_EVENTS 
    GROUP by 2)
SELECT AVG(sessions) FROM sessions_by_hour;`

*# answer 5: 39.458333 sessions per hour*