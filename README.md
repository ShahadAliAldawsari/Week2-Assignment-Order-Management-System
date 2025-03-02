<h1>Week 2 Assignment - Order Management System</h1>

<h2>Part 1: SQL Project</h2>

<h3>Database Schema</h3>
This project involves an SQL database for managing an order processing system. It includes the following tables:<br>
  - Users: Stores user information (UserID, Name, Email, Password, CreatedAt).<br>
  - Products: Stores product details (ProductID, Name, Category, Price, StockQuantity).<br>
  - Orders: Stores order details (OrderID, UserID, OrderDate, Status).<br>
  - OrderDetails: Stores details of each order, linking orders to products (OrderDetailID, OrderID, ProductID, Quantity, SubTotal).<br>
<br>
<h3>Database Normalization</h3>
To ensure data integrity and eliminate redundancy, the database follows the principles of normalization:<br>
- First Normal Form (1NF): Ensures atomicity of data (no repeating groups).<br>
- Second Normal Form (2NF): Ensures all non-key attributes are fully dependent on the primary key.<br>
- Third Normal Form (3NF): Eliminates transitive dependencies, ensuring each column is only dependent on the primary key.<br>
<br>
<h3>Query Optimizations</h3>
- Indexing: Unique constraints on UserID, ProductID, and OrderID improve retrieval speed.<br>
- JOIN Optimization: Properly structured joins ensure efficient querying.<br>
- Stored Procedures: Reduce query execution time by pre-compiling queries.<br>
- Triggers: Automate stock updates when orders are placed.<br>
- Common Table Expressions (CTEs): Improve query readability and maintainability.<br>
<br>
<br>
<h2>Part 2: Java Project</h2>

<h3>Features</h3>
- CLI-Based Order Management System<br>
- View Products<br>
- Place Orders<br>
- View Order History<br>
- Exit System<br>
- Object-Oriented Design<br>
<br>
<h3>Classes</h3>
- Product (Base class for Electronics and Clothing subclasses).<br>
- Order (Stores order details).<br>
- OrderDetails (Links products to orders).<br>
- OrderManager (Manages order history using HashMap<Integer, Order> and stores orders in an ArrayList<Order>).<br>
- Exception Handling: Implements OutOfStockException for insufficient stock cases.<br>
<br>
<h3>Java Collections Usage</h3>
- ArrayList<Order> stores all orders.<br>
- HashMap<Integer, Order> manages user order history.<br>

<h3>Bonus Features</h3>
- Implements a CLI menu for user-friendly order placement and history viewing.<br>
- Uses polymorphism by overriding calculateDiscount() in subclasses.<br>
- Uses inheritance with Electronics and Clothing extending Product.<br>

<h3>Example CLI Interaction</h3>
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


<h2>Part 3: ASP.NET Core MVC</h2>

<h3>Overview</h3>
This project is a web application simulating Amazon.sa, built using ASP.NET Core MVC (.NET Core 8/9). It allows users to browse products, place orders, and view their order history.

<h3>Project Structure</h3>
Order Management System/<br>
│-- Controllers/<br>
│   ├── ProductController.cs  # Handles product retrieval<br>
│   ├── OrderController.cs    # Manages order placement and history<br>
│<br>
│-- Models/<br>
│   ├── User.cs         # Represents registered users<br>
│   ├── Product.cs      # Stores product details<br>
│   ├── Order.cs        # Stores order information<br>
│   ├── OrderDetails.cs # Links products to orders<br>
│<br>
│-- Views/<br>
│   ├── Product/<br>
│   │   ├── Index.cshtml  # Displays the product list<br>
│   ├── Order/<br>
│   │   ├── PlaceOrder.cshtml  # Order placement form<br>
│   │   ├── OrderHistory.cshtml  # Displays user order history<br>
│<br>
│-- wwwroot/  # Static files (CSS, JS, Images)<br>
│-- appsettings.json  # Configuration settings<br>
│-- Program.cs  # Main application entry point<br>
│-- TechJobPortal.csproj  # Project file<br>
<br>

<h3>Features</h3>
- Product Management: Displays a list of available products.<br>
- Order Processing: Allows users to place orders.<br>
- Order History: Shows past orders for a specific user.<br>
- Model Validation: Ensures correct data input.<br>
- UI Enhancement: Uses Bootstrap for a responsive design.<br>

<h3>Getting Started</h3>
1- Clone the repository:<br>
	git clone <repository-url><br>
	cd TechJobPortal<br>
2- Run the application:<br>
	dotnet run<br>
3- Open https://localhost:5001/Products in your browser.<br>
