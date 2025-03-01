<h1> Week 2 Assignment - Order Management System

Part 1: SQL Project

Database Schema
This project involves an SQL database for managing an order processing system. It includes the following tables:
Users: Stores user information (UserID, Name, Email, Password, CreatedAt).
Products: Stores product details (ProductID, Name, Category, Price, StockQuantity).
Orders: Stores order details (OrderID, UserID, OrderDate, Status).
OrderDetails: Stores details of each order, linking orders to products (OrderDetailID, OrderID, ProductID, Quantity, SubTotal).

Database Normalization
To ensure data integrity and eliminate redundancy, the database follows the principles of normalization:
First Normal Form (1NF): Ensures atomicity of data (no repeating groups).
Second Normal Form (2NF): Ensures all non-key attributes are fully dependent on the primary key.
Third Normal Form (3NF): Eliminates transitive dependencies, ensuring each column is only dependent on the primary key.

Query Optimizations
Indexing: Unique constraints on UserID, ProductID, and OrderID improve retrieval speed.
JOIN Optimization: Properly structured joins ensure efficient querying.
Stored Procedures: Reduce query execution time by pre-compiling queries.
Triggers: Automate stock updates when orders are placed.
Common Table Expressions (CTEs): Improve query readability and maintainability.


Part 2: Java Project

Features
CLI-Based Order Management System
View Products
Place Orders
View Order History
Exit System
Object-Oriented Design

Classes:
Product (Base class for Electronics and Clothing subclasses).
Order (Stores order details).
OrderDetails (Links products to orders).
OrderManager (Manages order history using HashMap<Integer, Order> and stores orders in an ArrayList<Order>).
Exception Handling: Implements OutOfStockException for insufficient stock cases.

Java Collections Usage
ArrayList<Order> stores all orders.
HashMap<Integer, Order> manages user order history.

Bonus Features
Implements a CLI menu for user-friendly order placement and history viewing.
Uses polymorphism by overriding calculateDiscount() in subclasses.
Uses inheritance with Electronics and Clothing extending Product.

Example CLI Interaction

--- Order Management System ---
1. View Products
2. Place Order
3. View Order History
4. Exit
Choose an option: 1

--- Available Products ---
1. Product ID: 9b7249de-b9cf-4e61-8ed2-722fda79969a, Name: Laptop, Price: $1200.0, Stock: 10
2. Product ID: 5128794e-9b59-4fbf-a4c0-debe257ac645, Name: T-Shirt, Price: $25.0, Stock: 50

--- Order Management System ---
1. View Products
2. Place Order
3. View Order History
4. Exit
Choose an option: 2

Enter product number to order (or 0 to finish): 
1
Enter quantity: 3

Enter product number to order (or 0 to finish): 
1
Enter quantity: 8
Error: Insufficient stock for Laptop. Available: 7

Enter product number to order (or 0 to finish): 
0
Order placed successfully

--- Order Management System ---
1. View Products
2. Place Order
3. View Order History
4. Exit
Choose an option: 3

--- Your Order History ---
Order ID: 1c5f415f-3be5-40bf-a997-e4ab7161564d, User ID: 71b5a40e-33d1-4c6b-ae02-18e7b58d59dc, Date: Sat Mar 01 08:47:40 GMT+03:00 2025, Details: [Product: 9b7249de-b9cf-4e61-8ed2-722fda79969a, Quantity: 3, SubTotal: $3600.0]

--- Order Management System ---
1. View Products
2. Place Order
3. View Order History
4. Exit
Choose an option: 4
Exiting...

Process finished with exit code 0

