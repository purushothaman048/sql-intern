CREATE DATABASE JoinDemo;
USE JoinDemo;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
2. Insert Sample Data
sql
Copy
Edit
INSERT INTO Customers VALUES
(1, 'Alice', 'Chennai'),
(2, 'Bob', 'Delhi'),
(3, 'Charlie', 'Mumbai');

INSERT INTO Orders VALUES
(101, 1, '2025-08-01', 250.00),
(102, 2, '2025-08-02', 450.00),
(103, 1, '2025-08-03', 300.00);
3. SQL Join Queries
INNER JOIN
sql
Copy
Edit
SELECT Customers.customer_name, Orders.order_id, Orders.amount
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;
LEFT JOIN
sql
Copy
Edit
SELECT Customers.customer_name, Orders.order_id, Orders.amount
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;
RIGHT JOIN
sql
Copy
Edit
SELECT Customers.customer_name, Orders.order_id, Orders.amount
FROM Customers
RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;
FULL OUTER JOIN (MySQL Alternative using UNION)
sql
Copy
Edit
SELECT Customers.customer_name, Orders.order_id, Orders.amount
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id
UNION
SELECT Customers.customer_name, Orders.order_id, Orders.amount
FROM Customers
RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;