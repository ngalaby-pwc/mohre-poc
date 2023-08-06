-- models/raw/products.sql

{{ config(
	materialized='table',
	tags=["raw"]) }}

SELECT
    sale_id,
    customer_id,
    product_id,
    sale_date,
    quantity,
    amount
FROM myschema.sales
