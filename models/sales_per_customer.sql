-- models/sales_per_customer.sql

-- This model aggregates sales data per customer to provide insights into their total sales.

-- Step 1: Join Customers and Sales tables
WITH customer_sales AS (
    SELECT
        c.customer_id,
        c.customer_name,
        c.customer_email,
        s.sale_id,
        s.product_id,
        s.sale_date,
        s.quantity,
        s.amount
    FROM
        {{ ref('YOUR_POSTGRES_DATABASE.YOUR_TARGET_SCHEMA.customers') }} c
    JOIN
        {{ ref('YOUR_POSTGRES_DATABASE.YOUR_TARGET_SCHEMA.sales') }} s
    ON
        c.customer_id = s.customer_id
)

-- Step 2: Aggregate sales data per customer
SELECT
    customer_id,
    customer_name,
    customer_email,
    COUNT(DISTINCT sale_id) AS total_sales,
    SUM(quantity) AS total_quantity,
    SUM(amount) AS total_amount
FROM
    customer_sales
GROUP BY
    customer_id,
    customer_name,
    customer_email
