```sql
CREATE DATABASE CompanyDB;
USE CompanyDB;

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO Employees (emp_name, department, salary) VALUES
('John Doe', 'IT', 50000),
('Jane Smith', 'HR', 45000),
('Alice Brown', 'Finance', 60000),
('Bob White', 'IT', 55000);
Stored Procedure Example
Increase salaries in a given department by a percentage.

sql
Copy
Edit
DELIMITER //
CREATE PROCEDURE IncreaseSalaryByDept(
    IN dept_name VARCHAR(50),
    IN percent_increase DECIMAL(5,2)
)
BEGIN
    UPDATE Employees
    SET salary = salary + (salary * percent_increase / 100)
    WHERE department = dept_name;
END //
DELIMITER ;

-- Example Call:
CALL IncreaseSalaryByDept('IT', 10);
Function Example
Calculate the yearly salary for a specific employee.

sql
Copy
Edit
DELIMITER //
CREATE FUNCTION GetAnnualSalary(empID INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE annual_salary DECIMAL(10,2);
    SELECT salary * 12 INTO annual_salary
    FROM Employees
    WHERE emp_id = empID;
    RETURN annual_salary;
END //
DELIMITER ;

-- Example Usage:
SELECT GetAnnualSalary(1) AS Annual_Salary;