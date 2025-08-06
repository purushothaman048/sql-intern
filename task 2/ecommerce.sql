CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT
);
INSERT INTO Customer (name, email, phone, address) VALUES
('Surya', 'surya@example.com', '9876543210', 'Chennai'),
('Anjali', 'anjali@example.com', '9123456789', 'Bangalore'),
('Ravi Kumar', 'ravi.k@example.com', '9988776655', 'Hyderabad');

UPDATE Customer SET phone = '9123456780', address = 'Hyderabad, India' WHERE customer_id = 1;

DELETE FROM Customer WHERE customer_id = 1;

SELECT * FROM Customer;


CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0
);
INSERT INTO Product (name, description, price, stock) VALUES
('Laptop', 'Dell Inspiron i5 11th Gen', 59999.99, 10),
('Smartphone', 'Samsung Galaxy M14', 14999.50, 25),
('Headphones', 'Boat Rockerz Wireless', 1299.99, 50),
('Keyboard', 'Logitech Mechanical Keyboard', 3499.00, 15);

UPDATE Product SET stock = 8, price = 57999.99 WHERE product_id = 1;

DELETE FROM Product WHERE product_id = 1;

SELECT * FROM Product;


CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE DEFAULT CURRENT_DATE,
    status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
INSERT INTO Orders (customer_id, order_date, status) VALUES
(1, '2025-08-01', 'Pending'),
(2, '2025-08-02', 'Shipped'),
(3, '2025-08-03', 'Delivered'),
(1, '2025-08-04', 'Cancelled');

UPDATE Orders SET status = 'Shipped' WHERE order_id = 1;

DELETE FROM Orders WHERE order_id = 1;

SELECT * FROM Orders;

CREATE TABLE OrderItem (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 59999.99),  -- 1 Laptop
(1, 3, 2, 1299.99),   -- 2 Headphones
(2, 2, 1, 14999.50),  -- 1 Smartphone
(3, 4, 1, 3499.00),   -- 1 Keyboard
(4, 1, 1, 59999.99);  -- 1 Laptop (cancelled)

UPDATE OrderItem SET quantity = 3 WHERE id = 1;

DELETE FROM OrderItem WHERE id = 1;

SELECT * FROM OrderItem;


CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_date DATE DEFAULT CURRENT_DATE,
    amount DECIMAL(10, 2),
    method VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
INSERT INTO Payment (order_id, payment_date, amount, method) VALUES
(1, '2025-08-01', 62599.97, 'Credit Card'),
(2, '2025-08-02', 14999.50, 'UPI'),
(3, '2025-08-03', 3499.00, 'Net Banking');

UPDATE Payment SET method = 'UPI' WHERE payment_id = 1;

DELETE FROM Payment WHERE payment_id = 1;


SELECT * FROM Payment;
