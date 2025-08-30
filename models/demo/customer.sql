{{
    config
    (
        materialized='table'
    )
}}

WITH CUSTOMER_SRC AS 
(
    SELECT
    CUSTOMER_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    PHONE,
    COUNTRY,
    CREATED_AT,
    CURRENT_TIMESTAMP AS INSERT_DTS
    FROM {{source('customer','customer_src')}}

    )

SELECT * FROM CUSTOMER_SRC 