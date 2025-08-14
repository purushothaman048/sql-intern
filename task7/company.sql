task7_views.sql
-- 1️⃣ Create Database
CREATE DATABASE CompanyDB;
USE CompanyDB;

-- 2️⃣ Create Table: Employees
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    joining_date DATE NOT NULL
);

-- 3️⃣ Insert Sample Data
INSERT INTO Employees (name, department, salary, joining_date) VALUES
('John Doe', 'HR', 50000, '2020-01-15'),
('Jane Smith', 'Finance', 60000, '2019-03-12'),
('Michael Brown', 'IT', 75000, '2021-07-23'),
('Emily Davis', 'Finance', 65000, '2018-11-05'),
('David Wilson', 'IT', 80000, '2017-05-10'),
('Sarah Lee', 'HR', 55000, '2022-02-14');

-- 4️⃣ Simple View: Employees in Finance Department
CREATE VIEW FinanceEmployees AS
SELECT emp_id, name, salary
FROM Employees
WHERE department = 'Finance';

-- 5️⃣ Complex View: Average Salary by Department
CREATE VIEW AvgSalaryByDept AS
SELECT department, ROUND(AVG(salary), 2) AS avg_salary
FROM Employees
GROUP BY department;

-- 6️⃣ Updateable View: HR Employees
CREATE VIEW HREmployees AS
SELECT emp_id, name, salary
FROM Employees
WHERE department = 'HR'
WITH CHECK OPTION; -- Ensures inserted/updated data stays in HR dept

-- 7️⃣ View Usage Examples
-- Select all Finance employees
SELECT * FROM FinanceEmployees;

-- Select average salary by department
SELECT * FROM AvgSalaryByDept;

-- Update salary via view (allowed)
UPDATE HREmployees
SET salary = 58000
WHERE emp_id = 1;

-- 8️⃣ Drop a View
DROP VIEW IF EXISTS FinanceEmployees;

-- 9️⃣ Security Example: View showing only names (hide salary)
CREATE VIEW EmployeeNames AS
SELECT name, department
FROM Employees;