
-- MIT8103 Advanced Database Systems
-- Portfolio 2: Query Processing and Optimisation
-- Case Study: NaijaFresh Online Store

USE naijafresh_db;

-- QUERY 1: Retrieve customer orders and their products
-- This query joins four related tables.

SELECT
    o.order_id,
    c.first_name,
    c.last_name,
    p.product_name,
    oi.quantity,
    oi.unit_price
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
ORDER BY o.order_id;

-- QUERY 2: Examine the execution plan
-- EXPLAIN shows how MySQL processes the query.

EXPLAIN
SELECT
    o.order_id,
    c.first_name,
    c.last_name,
    p.product_name,
    oi.quantity,
    oi.unit_price
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
ORDER BY o.order_id;
