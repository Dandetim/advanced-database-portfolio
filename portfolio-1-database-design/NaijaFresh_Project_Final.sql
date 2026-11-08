CREATE DATABASE naijafresh_db;
USE naijafresh_db;
CREATE TABLE customers (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
phone VARCHAR(20),
address VARCHAR(255),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DESCRIBE customers;
CREATE TABLE categories (
category_id INT AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(100) NOT NULL UNIQUE,
description VARCHAR(255)
);
DESCRIBE categories;
CREATE TABLE products (
product_id INT AUTO_INCREMENT PRIMARY KEY,
category_id INT NOT NULL,
product_name VARCHAR(150) NOT NULL,
description VARCHAR(255),
price DECIMAL (10,2) NOT NULL,
stock_quantity INT NOT NULL DEFAULT 0,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,   
FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
DESCRIBE products;
CREATE TABLE orders (
order_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT NOT NULL,
order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
total_amount DECIMAL (10,2) NOT NULL DEFAULT 0.00,
order_status VARCHAR(30) NOT NULL DEFAULT 'pending',
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE order_items (
order_item_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT NOT NULL,
product_id INT NOT NULL,
quantity INT NOT NULL,
unit_price DECIMAL(10,2) NOT NULL,
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
); 
CREATE TABLE payments (
payment_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT NOT NULL,
payment_method VARCHAR(50) NOT NULL,
amount DECIMAL(10,2) NOT NULL,
payment_status VARCHAR(30) NOT NULL DEFAULT 'pending',
 transaction_reference VARCHAR(100) UNIQUE,
 payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (order_id) REFERENCES orders(order_id)
 );
DESCRIBE payments;
CREATE TABLE deliveries (
delivery_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT NOT NULL UNIQUE,
delivery_address Varchar(255) NOT NULL,
delivery_status VARCHAR(30) NOT NULL DEFAULT 'pending',
delivery_date DATE,
delivered_at TIMESTAMP NULL,
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
DESCRIBE deliveries;
CREATE TABLE reviews (
review_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT NOT NULL,
product_id INT NOT NULL,
rating INT NOT NULL,
review_comment VARCHAR(500),
review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (product_id) REFERENCES products(product_id),
CONSTRAINT chk_rating CHECK (rating BETWEEN 1 AND 5)
);
DESCRIBE reviews;
INSERT INTO customers
(first_name, last_name, email, phone, address)
VALUES
('Adebayo', 'Johnson', 'adebayo@example.com', '08012345678', 'Ikeja, Lagos'),
('Chioma', 'Okafor', 'chioma@example.com', '08023456789', 'Yaba, Lagos'),
('Ibrahim', 'Musa', 'ibrahim@example.com', '08034567890', 'Abuja'),
('Funke', 'Adeyemi', 'funke@example.com', '08045678901', 'Surulere, Lagos'),
('Daniel', 'Obi', 'daniel@example.com', '08056789012', 'Lekki, Lagos');
SELECT * FROM customers;
INSERT INTO categories (category_name, description)
VALUES
('Vegetables', 'Fresh vegetables and leafy greens'),
('Fruits', 'Fresh seasonal fruits'),
('Grains', 'Rice, beans and other grains'),
('Meat and Poultry', 'Fresh meat and poultry products'),
('Beverages', 'Drinks and other beverages');

SELECT * FROM categories;
INSERT INTO products
(category_id, product_name, description, price, stock_quantity)
VALUES
(1, 'Fresh Tomatoes', 'Basket of fresh tomatoes', 5000.00, 40),
(1, 'Red Onions', 'Fresh red onions', 3500.00, 30),
(2, 'Sweet Bananas', 'Fresh ripe bananas', 2500.00, 50),
(2, 'Fresh Oranges', 'Juicy oranges', 3000.00, 35),
(3, 'Ofada Rice', 'Locally produced Ofada rice', 45000.00, 20),
(3, 'Honey Beans', 'Premium Nigerian honey beans', 38000.00, 25),
(4, 'Frozen Chicken', 'Pack of frozen chicken', 12000.00, 15),
(4, 'Beef', 'Fresh assorted beef', 8000.00, 20),
(5, 'Malt Drink', 'Non-alcoholic malt beverage', 1500.00, 60),
(5, 'Bottled Water', 'Packaged drinking water', 500.00, 100);

SELECT * FROM products;
USE naijafresh_db;

INSERT INTO orders (customer_id, total_amount, order_status)
VALUES
(1, 62000.00, 'Pending'),
(2, 9000.00, 'Pending'),
(3, 83000.00, 'Pending');

SELECT * FROM orders;
DESCRIBE orders;
INSERT INTO order_items
(order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 5000.00),
(1, 5, 1, 45000.00),
(1, 7, 1, 12000.00),

(2, 2, 1, 3500.00),
(2, 3, 1, 2500.00),
(2, 4, 1, 3000.00),

(3, 5, 1, 45000.00),
(3, 6, 1, 38000.00);

SELECT * FROM order_items;
INSERT INTO order_items
(order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 5000.00),
(1, 5, 1, 45000.00),
(1, 7, 1, 12000.00),

(2, 2, 1, 3500.00),
(2, 3, 1, 2500.00),
(2, 4, 1, 3000.00),

(3, 5, 1, 45000.00),
(3, 6, 1, 38000.00);

SELECT * FROM order_items;

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
INSERT INTO payments
(order_id, payment_method, amount, payment_status, transaction_reference)
VALUES
(1, 'Bank Transfer', 62000.00, 'successful', 'NF-PAY-001'),
(2, 'Card', 9000.00, 'successful', 'NF-PAY-002'),
(3, 'Bank Transfer', 83000.00, 'pending', 'NF-PAY-003');

SELECT * FROM payments;
INSERT INTO deliveries
(order_id, delivery_address, delivery_status, delivery_date)
VALUES
(1, 'Ikeja, Lagos', 'in transit', '2026-11-07'),
(2, 'Yaba, Lagos', 'pending', '2026-11-07'),
(3, 'Abuja', 'delivered', '2026-11-05');

SELECT * FROM deliveries;
INSERT INTO reviews
(customer_id, product_id, rating, review_comment)
VALUES
(1, 1, 5, 'Fresh tomatoes and good quality'),
(2, 3, 4, 'Sweet bananas and good value'),
(3, 5, 5, 'Excellent Ofada rice'),
(4, 7, 4, 'Good quality frozen chicken'),
(5, 9, 5, 'Enjoyed the malt drink');

SELECT * FROM reviews;
