🛠 Tools Used
MySQL Workbench / DB Browser for SQLite

📂 Task Overview
Created two related tables (Customers and Orders).

Used INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN.

Learned differences between join types and their use cases.

📝 Step-by-Step Implementation
1. Create Database & Tables
sql
Copy
Edit
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
3. SQL Joins
INNER JOIN
Returns records with matching values in both tables.

sql
Copy
Edit
SELECT Customers.customer_name, Orders.order_id, Orders.amount
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;
LEFT JOIN
Returns all records from the left table, and matched records from the right table.

sql
Copy
Edit
SELECT Customers.customer_name, Orders.order_id, Orders.amount
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;
RIGHT JOIN
Returns all records from the right table, and matched records from the left table.

sql
Copy
Edit
SELECT Customers.customer_name, Orders.order_id, Orders.amount
FROM Customers
RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id;
FULL OUTER JOIN (MySQL Alternative using UNION)
Returns all records from both tables, matched where possible.

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
