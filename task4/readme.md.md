# 📚 Task 4 – Aggregate Functions & Grouping (SQL Developer Internship)

## 📝 Objective
Use **aggregate functions** and **GROUP BY** in SQL to summarize and analyze data from a library borrow records table.  

This task demonstrates:
- Applying `SUM`, `COUNT`, and `AVG` on numeric columns.
- Grouping results with `GROUP BY`.
- Filtering grouped data using `HAVING`.

---

## 🛠 Tools Used
- **MySQL Workbench** (compatible with DB Browser for SQLite)
- SQL

---

## 📂 Database Structure

### Database Creation
```sql
CREATE DATABASE LibraryDB;
USE LibraryDB;
Table Creation
sql
Copy
Edit
CREATE TABLE BorrowRecords (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    member_name VARCHAR(50),
    book_category VARCHAR(50),
    borrow_date DATE,
    return_date DATE,
    fine_amount DECIMAL(10,2)
);
Sample Data
sql
Copy
Edit
INSERT INTO BorrowRecords (member_name, book_category, borrow_date, return_date, fine_amount) VALUES
('Surya', 'Fiction', '2023-05-01', '2023-05-10', 0),
('Anjali', 'Science', '2023-05-03', '2023-05-15', 50),
('Ravi', 'Fiction', '2023-05-04', '2023-05-09', 0),
('Priya', 'History', '2023-05-05', '2023-05-20', 100),
('Karan', 'Science', '2023-05-06', '2023-05-18', 25),
('Neha', 'Fiction', '2023-05-07', '2023-05-12', 0),
('Amit', 'History', '2023-05-08', '2023-05-19', 50);
📊 Queries & Expected Results
1️⃣ Total Fine Collected

sql
Copy
Edit
SELECT SUM(fine_amount) AS total_fine FROM BorrowRecords;
✅ Expected: 225.00

2️⃣ Average Fine Amount

sql
Copy
Edit
SELECT AVG(fine_amount) AS avg_fine FROM BorrowRecords;
✅ Expected: 32.14

3️⃣ Books Borrowed per Category

sql
Copy
Edit
SELECT book_category, COUNT(*) AS books_borrowed
FROM BorrowRecords
GROUP BY book_category;
✅ Fiction: 3 | Science: 2 | History: 2

4️⃣ Total Fine by Category

sql
Copy
Edit
SELECT book_category, SUM(fine_amount) AS total_fine
FROM BorrowRecords
GROUP BY book_category;
✅ Fiction: 0 | Science: 75 | History: 150

5️⃣ Categories with Total Fine > 50

sql
Copy
Edit
SELECT book_category, SUM(fine_amount) AS total_fine
FROM BorrowRecords
GROUP BY book_category
HAVING SUM(fine_amount) > 50;
✅ Science | History

6️⃣ Monthly Borrow Summary

sql
Copy
Edit
SELECT MONTH(borrow_date) AS month, COUNT(*) AS total_borrows
FROM BorrowRecords
GROUP BY MONTH(borrow_date);
✅ May: 7 borrows

7️⃣ Unique Members

sql
Copy
Edit
SELECT COUNT(DISTINCT member_name) AS unique_members
FROM BorrowRecords;
✅ Expected: 7

📌 Key Learnings
GROUP BY helps categorize and summarize data.

HAVING filters grouped results (after aggregation).

Aggregate functions (SUM, COUNT, AVG) provide quick statistical insights.

COUNT(*) counts all rows; COUNT(column) ignores NULL values.

📤 Submission
GitHub Repository: (Add your repo link here)

Submission Form: Submit Here

yaml
Copy
Edit
