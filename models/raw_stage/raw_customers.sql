-- models/raw/customers.sql

{{ config(
	materialized='table',
	tags=["raw"]) }}

SELECT
    customer_id,
    customer_name,
    customer_email,
    insertion_date
 FROM myschema.customers 
