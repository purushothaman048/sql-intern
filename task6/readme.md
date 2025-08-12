# Task 6 - Subqueries and Nested Queries

## 📌 Objective
The goal of this task is to practice **advanced SQL query skills** using **subqueries** and **nested queries** in different clauses such as `SELECT`, `WHERE`, and `FROM`.  
This includes:
- Scalar subqueries
- Correlated subqueries
- Nested subqueries
- Derived tables
- Using `IN`, `EXISTS`, and comparison operators with subqueries

---

## 🗄 Database Structure

### **Database Name:** `CompanyDB`

#### **Tables Created**
1. **Employees**
   - emp_id (INT, Primary Key)
   - emp_name (VARCHAR)
   - department (VARCHAR)
   - salary (DECIMAL)
   - manager_id (INT)

2. **Departments**
   - dept_id (INT, Primary Key)
   - dept_name (VARCHAR)
   - location (VARCHAR)

3. **Projects**
   - project_id (INT, Primary Key)
   - project_name (VARCHAR)
   - dept_id (INT, Foreign Key)
   - budget (DECIMAL)

---

## 📥 Sample Data
**Employees**
| emp_id | emp_name | department | salary  | manager_id |
|--------|----------|-----------|---------|------------|
| 1      | Alice    | HR        | 50000   | NULL       |
| 2      | Bob      | IT        | 70000   | 1          |
| 3      | Charlie  | IT        | 80000   | 2          |
| 4      | David    | Finance   | 60000   | 1          |
| 5      | Eva      | Finance   | 65000   | 4          |

**Departments**
| dept_id | dept_name | location       |
|---------|-----------|----------------|
| 101     | HR        | New York       |
| 102     | IT        | San Francisco  |
| 103     | Finance   | Chicago        |

**Projects**
| project_id | project_name     | dept_id | budget   |
|------------|------------------|---------|----------|
| 201        | Recruitment      | 101     | 200000   |
| 202        | Website Upgrade  | 102     | 500000   |
| 203        | Audit            | 103     | 300000   |

---

## 🛠 SQL Queries

### 1️⃣ Scalar Subquery
```sql
SELECT emp_name, salary
FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees);
Find employees earning more than the average salary.

2️⃣ Correlated Subquery
sql
Copy
Edit
SELECT emp_name, department, salary
FROM Employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
    WHERE department = e.department
);
Find employees earning above their department's average salary.

3️⃣ Subquery with IN
sql
Copy
Edit
SELECT emp_name, department
FROM Employees
WHERE department IN (
    SELECT dept_name
    FROM Departments d
    JOIN Projects p ON d.dept_id = p.dept_id
    WHERE p.budget > 300000
);
Employees in departments with projects having budgets over 300,000.

4️⃣ Derived Table
sql
Copy
Edit
SELECT department, MAX(salary) AS highest_salary
FROM Employees
GROUP BY department;
Highest salary in each department.

5️⃣ Using EXISTS
sql
Copy
Edit
SELECT dept_name
FROM Departments d
WHERE EXISTS (
    SELECT 1
    FROM Projects p
    WHERE p.dept_id = d.dept_id
);