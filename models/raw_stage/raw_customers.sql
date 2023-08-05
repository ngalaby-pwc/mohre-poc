-- models/raw/customers.sql

{{ config(materialized='table') }}

SELECT
    customer_id,
    customer_name,
    customer_email
FROM {{ source('customers') }};
