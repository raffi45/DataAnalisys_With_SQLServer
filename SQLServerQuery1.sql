EXEC sp_rename 'Order Details', 'OrderDetails';



--- best-selling products based on number of orders
SELECT 
	Products.ProductID,Products.ProductName, 
	COUNT(DISTINCT OrderDetails.OrderID) AS [Number of Orders]
FROM 
	OrderDetails
INNER JOIN 
	Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY 
	Products.ProductName,
	Products.ProductID
ORDER BY 
	[Number of Orders]  DESC
----------------------------------


--- best selling products by quantity
SELECT 
	Products.ProductName, 
	SUM(OrderDetails.Quantity)AS [Quantity Sold]
FROM 
	OrderDetails
INNER JOIN 
	Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY 
	Products.ProductName, 
	Products.ProductID
ORDER BY [Quantity Sold] DESC
--------------------------------


--- company name of the supplier and calculate the total quantity sold for each supplier.
SELECT 
	Suppliers.CompanyName, 
	SUM(OrderDetails.Quantity)AS [Quantity Sold]
FROM 
	OrderDetails
INNER JOIN 
	Products ON OrderDetails.ProductID = Products.ProductID
INNER JOIN 
	Suppliers ON Products.SupplierID = Suppliers.SupplierID
GROUP BY 
	Suppliers.CompanyName
ORDER BY 
	[Quantity Sold] DESC
--------------------------


--- calculate the total money generated for each product after discounts
SELECT 
	OrderDetails.ProductID,
	Products.ProductName ,
	SUM(CONVERT(money,(OrderDetails.Quantity * OrderDetails.UnitPrice)-((OrderDetails.Quantity * OrderDetails.UnitPrice)*OrderDetails.Discount)))AS [Revenue]
FROM 
	OrderDetails
INNER JOIN 
	Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY 
	OrderDetails.ProductID,Products.ProductName
ORDER BY 
	[Revenue] desc
--------------------------


--- calculate the number of products sold for each product and group them based on product name and category
SELECT  
	Products.ProductName, 
	Categories.CategoryName, 
	COUNT(OrderDetails.Quantity) AS [Number of Orders]
FROM 
	OrderDetails
INNER JOIN 
	Products ON OrderDetails.ProductID = Products.ProductID
INNER JOIN 
	Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY 
	Products.ProductName,Categories.CategoryName
ORDER BY 
	[Number of Orders] DESC
-------------------------------------------


--- Identifying Best Selling Product Categories:
SELECT 
	Categories.CategoryName, 
	SUM(OrderDetails.Quantity) AS [number of products sold]
FROM 
	OrderDetails
INNER JOIN 
	Products ON OrderDetails.ProductID = Products.ProductID
INNER JOIN
	Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY 
	Categories.CategoryName
ORDER BY 
	[number of products sold] desc
----------------------------------------------


-------- products and categories are generating the most revenue based on the total quantity sold 
--------and 
--------- total revenue generated for each product within its respective category
SELECT 
    Products.ProductName, 
    Categories.CategoryName, 
    SUM(OrderDetails.Quantity) AS [UnitsSold] ,
    SUM(OrderDetails.Quantity* OrderDetails.UnitPrice) AS [TotalRevenue]
FROM 
    OrderDetails
INNER JOIN 
    Products ON OrderDetails.ProductID = Products.ProductID
INNER JOIN 
    Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY 
    Products.ProductName,
    Categories.CategoryName
ORDER BY 
		[TotalRevenue] DESC;
-----------------------------------


----- Identifying the Largest Transactions
SELECT Orders.OrderID,
	Customers.CompanyName,
	Customers.Country,
	SUM(CONVERT(money,(OrderDetails.Quantity * OrderDetails.UnitPrice)-((OrderDetails.Quantity * OrderDetails.UnitPrice)*OrderDetails.Discount)))AS [Revenue]
FROM 
	Orders
INNER JOIN	
	OrderDetails ON Orders.OrderID = OrderDetails.OrderID
INNER JOIN 
	Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY 
	Orders.OrderID,
	Customers.CompanyName,
	Customers.Country
ORDER BY 
	[Revenue] desc
---------------------------------------


------ Measuring Annual Income:

SELECT 
    YEAR(Orders.OrderDate) AS [Year],
	SUM(CONVERT(money,(OrderDetails.Quantity * OrderDetails.UnitPrice)-((OrderDetails.Quantity * OrderDetails.UnitPrice)*OrderDetails.Discount))) AS [Revenue]
FROM 
    OrderDetails
INNER JOIN 
    Orders ON OrderDetails.OrderID = Orders.OrderID
INNER JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY 
    YEAR(Orders.OrderDate)
ORDER BY 
    [Year] ASC;

-------------- calculate the total revenue generated annually from each customer's country

SELECT 
    YEAR(Orders.OrderDate) AS [Year],
    Customers.Country AS [Customer Country],
    SUM(CONVERT(money,(OrderDetails.Quantity * OrderDetails.UnitPrice)-
        ((OrderDetails.Quantity * OrderDetails.UnitPrice)*OrderDetails.Discount))) AS [Revenue]
FROM 
    OrderDetails
INNER JOIN 
    Orders ON OrderDetails.OrderID = Orders.OrderID
INNER JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID
WHERE 
	YEAR(Orders.OrderDate) = '1998'
GROUP BY 
    YEAR(Orders.OrderDate),
	Customers.Country
ORDER BY 
    [Revenue] DESC;

---------calculates the total revenue generated each month from each customer's country for a specific year
SELECT 
    YEAR(Orders.OrderDate) AS [Year],
    DATENAME(month,Orders.OrderDate) AS [Month],
    Customers.Country AS [Customer Country],
    SUM(CONVERT(money,(OrderDetails.Quantity * OrderDetails.UnitPrice)-
        ((OrderDetails.Quantity * OrderDetails.UnitPrice)*OrderDetails.Discount))) AS [Revenue]
FROM 
    OrderDetails
INNER JOIN 
    Orders ON OrderDetails.OrderID = Orders.OrderID
INNER JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID
WHERE 
    YEAR(Orders.OrderDate) = 1998
GROUP BY 
    YEAR(Orders.OrderDate),
    DATENAME(month,Orders.OrderDate),
    Customers.Country
ORDER BY 
    [Year],
    [Month],
    [Revenue] DESC;



