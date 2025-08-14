# Task 7 – Creating and Using Views in SQL

## 🎯 Objective
Learn to create, use, and manage **SQL views** for data abstraction, security, and reusability.

---

## 🛠 Tools Used
- MySQL Workbench / DB Browser for SQLite

---

## 📋 Steps Performed

### 1️⃣ Create Database
```sql
CREATE DATABASE CompanyDB;
USE CompanyDB;
2️⃣ Create Table and Insert Sample Data
sql
Copy
Edit
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    joining_date DATE NOT NULL
);

INSERT INTO Employees (name, department, salary, joining_date) VALUES
('John Doe', 'HR', 50000, '2020-01-15'),
('Jane Smith', 'Finance', 60000, '2019-03-12'),
('Michael Brown', 'IT', 75000, '2021-07-23'),
('Emily Davis', 'Finance', 65000, '2018-11-05'),
('David Wilson', 'IT', 80000, '2017-05-10'),
('Sarah Lee', 'HR', 55000, '2022-02-14');
3️⃣ Create Views
a) Simple View – Finance Employees
sql
Copy
Edit
CREATE VIEW FinanceEmployees AS
SELECT emp_id, name, salary
FROM Employees
WHERE department = 'Finance';
b) Complex View – Average Salary by Department
sql
Copy
Edit
CREATE VIEW AvgSalaryByDept AS
SELECT department, ROUND(AVG(salary), 2) AS avg_salary
FROM Employees
GROUP BY department;
c) Updateable View – HR Employees with WITH CHECK OPTION
sql
Copy
Edit
CREATE VIEW HREmployees AS
SELECT emp_id, name, salary
FROM Employees
WHERE department = 'HR'
WITH CHECK OPTION;
d) Security View – Show Only Names & Department
sql
Copy
Edit
CREATE VIEW EmployeeNames AS
SELECT name, department
FROM Employees;
4️⃣ Using Views
Select from a View

sql
Copy
Edit
SELECT * FROM FinanceEmployees;
Update through an Updateable View

sql
Copy
Edit
UPDATE HREmployees
SET salary = 58000
WHERE emp_id = 1;
Drop a View

sql
Copy
Edit
DROP VIEW IF EXISTS FinanceEmployees;