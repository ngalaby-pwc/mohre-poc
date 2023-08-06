-- models/raw/products.sql

{{ config(
	materialized='table',
	tags=["raw"]) }}

SELECT
    product_id,
    product_name,
    product_category,
    insertion_date
FROM myschema.products
