-- models/raw/products.sql

{{ config(materialized='table') }}

SELECT
    product_id,
    product_name,
    product_category
FROM {{ source('products') }};
