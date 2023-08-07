
{{ config(materialized='table') }}

SELECT
    customer_id,
    customer_name,
    customer_email
FROM {{ source('postgres','customers') }};
