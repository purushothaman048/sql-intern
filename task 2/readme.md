#  E-commerce Management System (MySQL Project)

##  Overview
This project is a simple **E-commerce Management System** built using **MySQL**. It allows you to store and manage data about customers, products, orders, order items, and payments using SQL queries and relational tables.

---

##  Database Schema

### 1. `Customer` Table
Stores details about registered customers.

- `customer_id` – Primary Key
- `name` – Customer name
- `email` – Unique email address
- `phone` – Contact number
- `address` – Customer address

### 2. `Product` Table
Stores product catalog information.

- `product_id` – Primary Key
- `name` – Product name
- `description` – Product details
- `price` – Unit price
- `stock` – Number of units available

### 3. `Orders` Table
Stores customer orders.

- `order_id` – Primary Key
- `customer_id` – Foreign Key referencing `Customer.customer_id`
- `order_date` – Date of the order
- `status` – Order status (e.g., Pending, Shipped)

### 4. `OrderItem` Table
Stores the individual items in each order.

- `id` – Primary Key
- `order_id` – Foreign Key referencing `Orders.order_id`
- `product_id` – Foreign Key referencing `Product.product_id`
- `quantity` – Quantity of the product
- `price` – Price per unit at time of order

### 5. `Payment` Table
Stores payment information for orders.

- `payment_id` – Primary Key
- `order_id` – Foreign Key referencing `Orders.order_id`
- `payment_date` – Date of payment
- `amount` – Total paid
- `method` – Payment method (e.g., Credit Card, UPI)

---

##  Relationships

- One **Customer** can place many **Orders** (One-to-Many)
- One **Order** can have multiple **OrderItems** (One-to-Many)
- Each **OrderItem** is linked to one **Product**
- One **Order** can have one **Payment** (One-to-One)

---

##  SQL Features Used

- ✅ `CREATE TABLE` – Define table structures
- ✅ `INSERT INTO` – Add records to tables
- ✅ `UPDATE` – Modify existing records
- ✅ `DELETE` – Remove records
- ✅ `SELECT` – Fetch records from tables
- ✅ `FOREIGN KEY` – Establish relationships between tables

---

##  Sample Use Cases

- Add new customers, products, and orders
- Update order status and payment methods
- Track product stock and individual order items
- View and manage all customer orders and payments

---

##  Technology Stack

- **Database**: MySQL
- **Language**: SQL
- **Tool**: MySQL Workbench / phpMyAdmin
