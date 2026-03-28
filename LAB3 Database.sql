DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
customer_id INT PRIMARY KEY,
name VARCHAR(100),
email VARCHAR(100)
);

CREATE TABLE orders(
order_id INT PRIMARY KEY,
order_date DATE,
customer_id INT,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE products(
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
price DECIMAL(10,2)
);

CREATE TABLE order_items(
order_id INT,
product_id INT,
quantity INT,
PRIMARY KEY(order_id, product_id),
FOREIGN KEY(order_id) REFERENCES orders(order_id),
FOREIGN KEY(product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1,'Raju'),
(2,'Sham'),
(3,'Paul');

INSERT INTO orders(order_id,order_date,customer_id)VALUES
(4,'2024-04-04',2),
(1,'2024-01-01',1),
(2,'2024-02-01',2),
(3,'2024-03-01',3);


INSERT INTO products(product_id,product_name,price) VALUES
(1,'Laptop',55000.00),
(2,'Cable',250.00),
(3,'Mouse',500.00),
(4,'Keyboard',800.00);

INSERT INTO order_items (order_id,product_id,quantity) VALUES
(4,4,1),
(1,1,1),
(1,2,2),
(2,1,1),
(3,3,1),
(3,2,3),
(1,4,4);

SELECT 
    c.name,
    o.order_id,
    o.order_date,
    p.product_name,
    oi.quantity,
    p.price,
    (oi.quantity * p.price) AS total_price
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;
SELECT order_id
FROM orders;
SELECT product_id
FROM products;
SELECT order_id, product_id
FROM order_items;