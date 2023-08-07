
{{ config(materialized='table') }}


SELECT
    product_id,
    product_name,
    product_category,
    insertion_date
FROM myschema.products
