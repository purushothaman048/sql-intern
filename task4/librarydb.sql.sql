-- Create Database and Table
CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE BorrowRecords (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    member_name VARCHAR(50),
    book_category VARCHAR(50),
    borrow_date DATE,
    return_date DATE,
    fine_amount DECIMAL(10,2)
);

-- Insert Sample Data
INSERT INTO BorrowRecords (member_name, book_category, borrow_date, return_date, fine_amount) VALUES
('Surya', 'Fiction', '2023-05-01', '2023-05-10', 0),
('Anjali', 'Science', '2023-05-03', '2023-05-15', 50),
('Ravi', 'Fiction', '2023-05-04', '2023-05-09', 0),
('Priya', 'History', '2023-05-05', '2023-05-20', 100),
('Karan', 'Science', '2023-05-06', '2023-05-18', 25),
('Neha', 'Fiction', '2023-05-07', '2023-05-12', 0),
('Amit', 'History', '2023-05-08', '2023-05-19', 50);

-- 1. Total Fine Collected
SELECT SUM(fine_amount) AS total_fine
FROM BorrowRecords;

-- 2. Average Fine Amount
SELECT AVG(fine_amount) AS avg_fine
FROM BorrowRecords;

-- 3. Number of Books Borrowed per Category
SELECT book_category, COUNT(*) AS books_borrowed
FROM BorrowRecords
GROUP BY book_category;

-- 4. Total Fine by Book Category
SELECT book_category, SUM(fine_amount) AS total_fine
FROM BorrowRecords
GROUP BY book_category;

-- 5. Categories with Total Fine > 50
SELECT book_category, SUM(fine_amount) AS total_fine
FROM BorrowRecords
GROUP BY book_category
HAVING SUM(fine_amount) > 50;

-- 6. Monthly Borrow Summary
SELECT MONTH(borrow_date) AS month, COUNT(*) AS total_borrows
FROM BorrowRecords
GROUP BY MONTH(borrow_date);

-- 7. Count of Distinct Members
SELECT COUNT(DISTINCT member_name) AS unique_members
FROM BorrowRecords;