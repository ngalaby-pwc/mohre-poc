
{{ config(materialized='table', tags=["raw"]) }}

SELECT
    customer_id,
    customer_name,
    customer_email
FROM myschema.customers


