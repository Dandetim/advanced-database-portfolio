USE naijafresh_db;
SELECT * FROM orders;
START TRANSACTION;

INSERT INTO orders (customer_id, total_amount, order_status)
VALUES (1, 1000.00, 'Pending');

SELECT * FROM orders;
ROLLBACK;
SELECT * FROM orders;
START TRANSACTION;
SELECT product_id, product_name, stock_quantity
FROM products
WHERE product_name = 'Frozen Chicken';

INSERT INTO orders (customer_id, total_amount, order_status)
VALUES (2, 2500.00, 'Pending');

COMMIT;

SELECT * FROM orders;
START TRANSACTION;

UPDATE products
SET stock_quantity = stock_quantity - 2
WHERE product_id = 7;
ROLLBACK;
SELECT product_id, product_name, stock_quantity
FROM products
WHERE product_id = 7;
START TRANSACTION;

SELECT *
FROM products
WHERE product_id = 7
FOR UPDATE;
COMMIT