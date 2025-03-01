create schema sql_4;
use sql_4;

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) unique,
    Password varchar(100),
    CreatedAt datetime
);
INSERT INTO Users (UserID, Name, Email, Password, CreatedAt) VALUES
(1, 'Henry Miller', 'user1@example.com', '0b14d501a594442a01c6859541bcb3e8164d183d32937b851835442f69d5c94e', '2023-05-25 00:00:00'),
(2, 'Bob Brown', 'user2@example.com', '6cf615d5bcaac778352a8f1f3360d23f02f34ec182e259897fd6ce485d7870d4', '2022-11-01 00:00:00'),
(3, 'Alice Johnson', 'user3@example.com', '5906ac361a137e2d286465cd6588ebb5ac3f5ae955001100bc41577c3d751764', '2022-06-30 00:00:00'),
(4, 'Frank Harris', 'user4@example.com', 'b97873a40f73abedd8d685a7cd5e5f85e4a9cfb83eac26886640a0813850122b', '2022-09-22 00:00:00'),
(5, 'Charlie Davis', 'user5@example.com', '8b2c86ea9cf2ea4eb517fd1e06b74f399e7fec0fef92e3b482a6cf2e2b092023', '2022-01-09 00:00:00'),
(6, 'Grace Lewis', 'user6@example.com', '598a1a400c1dfdf36974e69d7e1bc98593f2e15015eed8e9b7e47a83b31693d5', '2022-01-08 00:00:00'),
(7, 'Bob Brown', 'user7@example.com', '5860836e8f13fc9837539a597d4086bfc0299e54ad92148d54538b5c3feefb7c', '2024-02-20 00:00:00'),
(8, 'Charlie Davis', 'user8@example.com', '57f3ebab63f156fd8f776ba645a55d96360a15eeffc8b0e4afe4c05fa88219aa', '2022-04-18 00:00:00'),
(9, 'Henry Miller', 'user9@example.com', '9323dd6786ebcbf3ac87357cc78ba1abfda6cf5e55cd01097b90d4a286cac90e', '2024-08-25 00:00:00'),
(10, 'Ivy Nelson', 'user10@example.com', 'aa4a9ea03fcac15b5fc63c949ac34e7b0fd17906716ac3b8e58c599cdc5a52f0', '2022-03-26 00:00:00');

Create table Products (
	ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    Category VARCHAR(100),
    Price double,
    StockQuantity int
);
INSERT INTO Products (ProductID, Name, Category, Price, StockQuantity) VALUES
(1, 'Product 1', 'Electronics', 202.53, 46),
(2, 'Product 2', 'Electronics', 341.39, 49),
(3, 'Product 3', 'Home', 223.44, 92),
(4, 'Product 4', 'Clothing', 182.83, 11),
(5, 'Product 5', 'Books', 364.28, 82),
(6, 'Product 6', 'Books', 188.8, 83),
(7, 'Product 7', 'Books', 410.9, 24),
(8, 'Product 8', 'Clothing', 366.99, 91),
(9, 'Product 9', 'Books', 351.52, 49),
(10, 'Product 10', 'Books', 266.92, 96),
(11, 'Product 11', 'Books', 486.87, 83),
(12, 'Product 12', 'Toys', 448.96, 96),
(13, 'Product 13', 'Electronics', 199.79, 60),
(14, 'Product 14', 'Home', 22.75, 51),
(15, 'Product 15', 'Home', 46.24, 80);

create table Orders (
	OrderID INT PRIMARY KEY,
    UserID int,
    OrderDate date,
    Status varchar(50),
    foreign key (UserID) references Users(UserID)
);
INSERT INTO Orders (OrderID, UserID, OrderDate, Status) VALUES
(1, 2, '2024-03-19 00:00:00', 'Shipped'),
(2, 9, '2023-01-02 00:00:00', 'Shipped'),
(3, 10, '2024-12-29 00:00:00', 'Pending'),
(4, 2, '2024-05-24 00:00:00', 'Shipped'),
(5, 9, '2023-07-20 00:00:00', 'Cancelled'),
(6, 2, '2024-12-17 00:00:00', 'Delivered'),
(7, 8, '2024-09-07 00:00:00', 'Pending'),
(8, 5, '2024-12-13 00:00:00', 'Delivered'),
(9, 9, '2024-10-10 00:00:00', 'Shipped'),
(10, 10, '2024-01-01 00:00:00', 'Pending'),
(11, 6, '2024-01-21 00:00:00', 'Shipped'),
(12, 2, '2023-05-21 00:00:00', 'Cancelled'),
(13, 5, '2023-01-17 00:00:00', 'Cancelled'),
(14, 9, '2024-08-05 00:00:00', 'Delivered'),
(15, 8, '2024-09-10 00:00:00', 'Pending'),
(16, 10, '2024-10-02 00:00:00', 'Cancelled'),
(17, 8, '2024-06-28 00:00:00', 'Pending'),
(18, 2, '2024-01-05 00:00:00', 'Pending'),
(19, 9, '2024-08-10 00:00:00', 'Pending'),
(20, 5, '2023-04-22 00:00:00', 'Pending');

Create Table OrderDetails (
	OrderDetailID INT PRIMARY KEY,
    OrderID int,
    ProductID int,
    Quantity int, 
    SubTotal double,
    foreign key (OrderID) references Orders(OrderID),
    foreign key (ProductID) references Products(ProductID)
);
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, SubTotal) VALUES
(1, 10, 3, 2, 446.88),
(2, 9, 15, 2, 92.48),
(3, 11, 14, 4, 91.0),
(4, 2, 8, 2, 733.98),
(5, 9, 12, 4, 1795.84),
(6, 11, 5, 4, 1457.12),
(7, 9, 12, 4, 1795.84),
(8, 20, 15, 2, 92.48),
(9, 5, 7, 4, 1643.6),
(10, 12, 2, 3, 1024.17),
(11, 10, 15, 1, 46.24),
(12, 14, 3, 4, 893.76),
(13, 6, 14, 5, 113.75),
(14, 7, 3, 1, 223.44),
(15, 12, 1, 5, 1012.65),
(16, 20, 11, 4, 1947.48),
(17, 4, 7, 3, 1232.7),
(18, 10, 14, 4, 91.0),
(19, 19, 14, 5, 113.75),
(20, 12, 5, 5, 1821.4),
(21, 10, 13, 4, 799.16),
(22, 2, 1, 4, 810.12),
(23, 3, 15, 5, 231.2),
(24, 17, 14, 1, 22.75),
(25, 8, 7, 3, 1232.7),
(26, 17, 12, 4, 1795.84),
(27, 14, 8, 1, 366.99),
(28, 9, 5, 2, 728.56),
(29, 16, 5, 3, 1092.84),
(30, 19, 6, 5, 944.0),
(31, 3, 14, 5, 113.75),
(32, 10, 15, 1, 46.24),
(33, 12, 10, 2, 533.84),
(34, 18, 15, 5, 231.2),
(35, 20, 13, 1, 199.79),
(36, 19, 2, 2, 682.78),
(37, 1, 8, 1, 366.99),
(38, 16, 15, 3, 138.72),
(39, 10, 12, 2, 897.92),
(40, 1, 15, 1, 46.24),
(41, 15, 1, 1, 202.53),
(42, 6, 5, 5, 1821.4),
(43, 1, 4, 4, 731.32),
(44, 18, 6, 2, 377.6),
(45, 6, 7, 2, 821.8),
(46, 1, 4, 2, 365.66),
(47, 19, 7, 4, 1643.6),
(48, 13, 11, 4, 1947.48),
(49, 3, 6, 5, 944.0),
(50, 20, 9, 5, 1757.6);

-- Normalization
	-- 1NF (First Normal Form):
		-- All columns have atomic values (no repeating groups or arrays).
		-- Each table has a primary key ensuring uniqueness.
    -- 2NF (Second Normal Form):
		-- The table must be in 1NF.
		-- Users.UserID, Products.ProductID, Orders.OrderID, and OrderDetails.OrderDetailID
			-- are the primary keys in their tables, and all other attributes depend on thim (No partial dependencies).
		-- Since there are no partial dependencies, all tables are in 2NF.
    -- 3NF
		-- The table must be in 2NF.
        -- No transitive dependencies in Users, Products, Orders, and OrderDetails.
        -- All tables are already in 3NF.

-- 1. Retrieve all orders along with user details using JOINs.
select o.OrderID, o.UserID, o.OrderDate, o.Status, u.Name, u.Email, u.CreatedAt
from orders o join users u
on o.UserID = u.UserID;

select * from orders;

-- 2. Get the total sales per product category using GROUP BY.
select o.ProductID, p.Name as ProductName, sum(o.SubTotal) as TotalSales 
from orderdetails o join products p
on o.ProductID = p.ProductID
group by o.ProductID;

-- 3. Find the top 3 customers based on total spending.
-- orderdetails.SubTotal
-- orders.UserID ,
select o.UserID, sum(d.SubTotal) as TotalSpending
from OrderDetails d join orders o
on d.orderID = o.orderID
group by o.userID 
order by TotalSpending desc limit 3;

-- 4. Write a stored procedure to insert a new order and update stock quantity.
DELIMITER $$
CREATE PROCEDURE InsertNewOrder (
    IN p_UserID INT,
    IN p_Status VARCHAR(50),
    IN p_ProductIDs JSON,
    IN p_Quantities JSON
)
BEGIN
    DECLARE v_OrderID INT;
    DECLARE v_ProductID INT;
    DECLARE v_Quantity INT;
    DECLARE v_Stock INT;
    DECLARE v_Price DECIMAL(10, 2);
    DECLARE v_SubTotal DECIMAL(10, 2);
    DECLARE i INT DEFAULT 0;
    DECLARE numItems INT;
    -- Start Transaction
    START TRANSACTION;
    -- Step 1: Insert into Orders table
    INSERT INTO Orders (UserID, OrderDate, Status)
    VALUES (p_UserID, NOW(), p_Status);
    SET v_OrderID = LAST_INSERT_ID();
    -- Step 2: Get number of items in order
    SET numItems = JSON_LENGTH(p_ProductIDs);
    -- Step 3: Loop through each product in the order
    WHILE i < numItems DO
	SET v_ProductID = CAST(JSON_UNQUOTE(JSON_EXTRACT(p_ProductIDs, CONCAT('$[', i, ']'))) AS UNSIGNED);
	SET v_Quantity = CAST(JSON_UNQUOTE(JSON_EXTRACT(p_Quantities, CONCAT('$[', i, ']'))) AS UNSIGNED);
        -- Step 4: Check stock availability
        SELECT StockQuantity, Price INTO v_Stock, v_Price 
        FROM Products 
        WHERE ProductID = v_ProductID;
        IF v_Stock < v_Quantity THEN
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Insufficient stock for one or more products';
        END IF;
        -- Step 5: Calculate SubTotal
        SET v_SubTotal = v_Quantity * v_Price;
        -- Step 6: Insert into OrderDetails table
		INSERT INTO OrderDetails (OrderID, ProductID, Quantity, SubTotal)
		VALUES (v_OrderID, v_ProductID, v_Quantity, v_SubTotal);
        -- Step 7: Update Stock Quantity
        UPDATE Products 
        SET StockQuantity = StockQuantity - v_Quantity
        WHERE ProductID = v_ProductID;
        -- Increment Counter
        SET i = i + 1;
    END WHILE;
    -- Commit Transaction
    COMMIT;
END$$
DELIMITER ;
-- Creates an order for UserID = 1 with status Pending Orders 2 units of ProductID = 1 and 1 unit of ProductID = 2.
CALL InsertNewOrder(
    1, 
    'Pending', 
    CAST('[1, 2]' AS JSON), 
    CAST('[2, 1]' AS JSON)
);

-- 5. Create a trigger to automatically update stock when an order is placed.
DELIMITER $$
CREATE TRIGGER UpdateStockAfterOrder
AFTER INSERT ON OrderDetails
FOR EACH ROW
BEGIN
    -- Update the stock quantity
    UPDATE Products 
    SET StockQuantity = StockQuantity - NEW.Quantity
    WHERE ProductID = NEW.ProductID;
    -- Optional: Check for negative stock and raise an error
    IF (SELECT StockQuantity FROM Products WHERE ProductID = NEW.ProductID) <= 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Insufficient stock for this order';
    END IF;
END$$
DELIMITER ;
-- Test the Trigger by placing a new order
CALL InsertNewOrder(
    1, 
    'Pending', 
    CAST('[1, 2]' AS JSON), 
    CAST('[2, 1]' AS JSON)
);
-- Verify the Stock Update
SELECT ProductID, StockQuantity FROM Products WHERE ProductID IN (1, 2);

-- 6. Use Common Table Expressions (CTE) to list products that have never been ordered.
-- with CTE
with orderedProductsCTE as (
	select * from products
	where productID not in (
		select distinct productID from orderdetails)
)
select productID from orderedProductsCTE;

-- without CTE way number 1
select productID from products
where productID not in (
	select distinct productID from orderdetails);
    
-- without CTE way number 2
select distinct p.productID
from products p right join orderdetails o
on p.productID = o.productID
where o.productID is null;