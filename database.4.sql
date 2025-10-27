CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE
);

INSERT INTO customers (customer_id, first_name, last_name, email)
VALUES
(1, 'Sara', 'Khan', 'sara.k@example.com'),
(2, 'Tom', 'Hanks', 'tom.h@example.com'),
(3, 'Jia', 'Li', 'jia.l@example.com');

SELECT * FROM customers;


CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    total_amount NUMERIC(10, 2) NOT NULL,
    customer_id INT REFERENCES customers(customer_id)
);

INSERT INTO orders (order_date, total_amount, customer_id)
VALUES
('2025-09-01', 45.99, 1),
('2025-09-02', 120.50, 2),
('2025-09-02', 25.00, 1),
('2025-09-03', 300.75, 3),
('2025-09-04', 15.25, 2);

SELECT * FROM orders;


SELECT
    o.order_id,
    o.order_date,
    o.total_amount,
    c.first_name || ' ' || c.last_name AS customer_full_name
FROM
    orders o
JOIN
    customers c ON o.customer_id = c.customer_id
ORDER BY
    o.order_date, o.order_id;


DROP TABLE orders;
DROP TABLE customers;
