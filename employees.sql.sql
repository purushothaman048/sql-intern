-- Create a database
CREATE DATABASE employees;
USE employees;

-- Create a sample table
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    joining_date DATE
);

-- Insert sample data
INSERT INTO employees (name, department, salary, joining_date) VALUES
('Alice', 'HR', 50000, '2022-01-10'),
('Bob', 'Engineering', 70000, '2021-11-15'),
('Charlie', 'Sales', 60000, '2023-03-20'),
('Diana', 'Engineering', 75000, '2020-06-05');

-- Sample SELECT queries for Task 3
SELECT * FROM employees;

SELECT name, salary FROM employees WHERE department = 'Engineering';

SELECT * FROM employees WHERE salary BETWEEN 50000 AND 70000;

SELECT * FROM employees WHERE name LIKE '%a%';

SELECT * FROM employees ORDER BY salary DESC;

SELECT DISTINCT department FROM employees;

SELECT name AS EmployeeName, salary AS MonthlySalary FROM employees;

SELECT * FROM employees LIMIT 2;
