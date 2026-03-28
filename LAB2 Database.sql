CREATE TABLE customer (
cust_id SERIAL PRIMARY KEY,
cust_name VARCHAR(100) NOT NULL
);

SELECT * FROM customer;

CREATE TABLE orders (
ord_id SERIAL PRIMARY KEY,
ord_date DATE NOT NULL,
ord_amount NUMERIC NOT NULL,
cust_id INT NOT NULL,
FOREIGN KEY (cust_id)
REFERENCES customer(cust_id)
);

SELECT * FROM orders;

INSERT INTO customer (cust_name)
VALUES
('Ahmad'),
('Ali'),
('Paul'),
('Alex');

INSERT INTO orders (ord_date, ord_amount, cust_id)
VALUES
('2026-03-02',250.00,1),
('2026-03-05',600.00,2),
('2026-03-06',350.00,4),
('2026-04-08',900.00,1),
('2026-02-08',620.00,2),
('2026-03-09',370.00,4);

SELECT *
FROM customer
INNER JOIN orders
ON orders.cust_id = customer.cust_id;

SELECT cust_name
FROM customer
INNER JOIN orders
ON orders.cust_id = customer.cust_id
GROUP BY cust_name;

SELECT cust_name
FROM customer, orders
WHERE customer.cust_id = orders.cust_id;

SELECT *
FROM customer
LEFT JOIN orders
ON orders.cust_id = customer.cust_id;

SELECT customer.cust_id,
customer.cust_name,
orders.ord_date,
orders.ord_amount
FROM customer
LEFT OUTER JOIN orders
ON customer.cust_id = orders.cust_id;

SELECT *
FROM customer
RIGHT JOIN orders
ON orders.cust_id = customer.cust_id;