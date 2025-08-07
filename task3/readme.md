# Task 3 – Basic SELECT Queries

## 🎯 Objective
To demonstrate the ability to extract and filter data using basic SQL `SELECT` statements, including the use of `WHERE`, `ORDER BY`, `LIMIT`, and more.

---

## 🛠 Tools Used
- **MySQL Workbench**
- **XAMPP (MySQL Server running on port 3306)**

---

## 📂 Database Used
**Database Name:** `employees`  
**Table:** `employees`

### 📊 Table Structure:
| Column Name   | Data Type     |
|---------------|---------------|
| id            | INT (Primary Key) |
| name          | VARCHAR(100)  |
| department    | VARCHAR(50)   |
| salary        | DECIMAL(10,2) |
| joining_date  | DATE          |

---

## 🔢 Sample Queries Included:
- `SELECT * FROM employees;`
- `SELECT name, salary FROM employees WHERE department = 'Engineering';`
- `SELECT * FROM employees WHERE salary BETWEEN 50000 AND 70000;`
- `SELECT * FROM employees WHERE name LIKE '%a%';`
- `SELECT * FROM employees ORDER BY salary DESC;`
- `SELECT DISTINCT department FROM employees;`
- `SELECT name AS EmployeeName, salary AS MonthlySalary FROM employees;`
- `SELECT * FROM employees LIMIT 2;`

---

## 📌 How to Run
1. Open **MySQL Workbench**
2. Connect to your **XAMPP MySQL server** (`127.0.0.1`, port `3306`, user: `root`)
3. Run the SQL script `task3_queries.sql` included in this repo
4. Observe results and test variations as needed

---

## ✅ Outcome
- Understanding of filtering (`WHERE`, `LIKE`, `BETWEEN`)
- Data projection (`SELECT specific columns`, `AS`)
- Sorting (`ORDER BY`)
- Row limiting (`LIMIT`)
- Uniqueness with `DISTINCT`
