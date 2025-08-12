1. Create Database & Table
sql
Copy
Edit
-- Create Database
CREATE DATABASE CompanyDB;
USE CompanyDB;

-- Employees Table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    manager_id INT
);

-- Departments Table
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

-- Projects Table
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    dept_id INT,
    budget DECIMAL(12,2)
);
2. Insert Sample Data
sql
Copy
Edit
-- Employees Data
INSERT INTO Employees VALUES
(1, 'Alice', 'HR', 50000, NULL),
(2, 'Bob', 'IT', 70000, 1),
(3, 'Charlie', 'IT', 80000, 2),
(4, 'David', 'Finance', 60000, 1),
(5, 'Eva', 'Finance', 65000, 4);

-- Departments Data
INSERT INTO Departments VALUES
(101, 'HR', 'New York'),
(102, 'IT', 'San Francisco'),
(103, 'Finance', 'Chicago');

-- Projects Data
INSERT INTO Projects VALUES
(201, 'Recruitment', 101, 200000),
(202, 'Website Upgrade', 102, 500000),
(203, 'Audit', 103, 300000);
3. Example Subqueries
Scalar Subquery (Single Value)
sql
Copy
Edit
-- Find employees earning more than the average salary
SELECT emp_name, salary
FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees);
Correlated Subquery
sql
Copy
Edit
-- Find employees whose salary is greater than their department's average salary
SELECT emp_name, department, salary
FROM Employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
    WHERE department = e.department
);
Subquery with IN
sql
Copy
Edit
-- List employees working in departments that have a project budget over 300,000
SELECT emp_name, department
FROM Employees
WHERE department IN (
    SELECT dept_name
    FROM Departments d
    JOIN Projects p ON d.dept_id = p.dept_id
    WHERE p.budget > 300000
);
Subquery in FROM Clause (Derived Table)
sql
Copy
Edit
-- Show department and its highest salary
SELECT department, MAX(salary) AS highest_salary
FROM Employees
GROUP BY department;
(Here you can nest it for more complexity if required)

Using EXISTS
sql
Copy
Edit
-- Find departments that have at least one project
SELECT dept_name
FROM Departments d
WHERE EXISTS (
    SELECT 1
    FROM Projects p
    WHERE p.dept_id = d.dept_id
);