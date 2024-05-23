
--- age category is determined based on the employee's age calculated as of December 30, 1998.
SELECT 
    Employees.EmployeeID,
    CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'full name',
    DATEDIFF(YEAR, Employees.BirthDate, '1998-12-30') AS 'age',
    DATEDIFF(YEAR, Employees.HireDate, '1998-12-30') AS 'years of service',
    Employees.Title,
    CASE 
        WHEN DATEDIFF(YEAR, Employees.BirthDate, '1998-12-30') BETWEEN 15 AND 45 THEN 'productive'
        WHEN DATEDIFF(YEAR, Employees.BirthDate, '1998-12-30') BETWEEN 46 AND 55 THEN 'Senior Level'
        WHEN DATEDIFF(YEAR, Employees.BirthDate, '1998-12-30') > 55 THEN 'Pre-Retirement'
        ELSE 'not productive'
    END AS 'age category'
FROM Employees;
------------------------




---- employees' total transaction amounts for the year 1997
SELECT
    Employees.EmployeeID,
    CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Employee Name',
    Employees.Title,
    SUM(CONVERT(money, (OrderDetails.Quantity * OrderDetails.UnitPrice) -
        ((OrderDetails.Quantity * OrderDetails.UnitPrice) * OrderDetails.Discount))) AS total_transaction
FROM 
    Orders
INNER JOIN 
    Employees ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN 
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
WHERE 
    (Orders.OrderDate IS NOT NULL) AND (YEAR(Orders.OrderDate) = 1997)
GROUP BY 
    Employees.EmployeeID,
    CONCAT(Employees.FirstName, ' ', Employees.LastName),
    Employees.Title,
    YEAR(Orders.OrderDate)
ORDER BY 
    total_transaction DESC;
--------------------




-------- calculates the average revenue for each employee in the year 1997 and categorizes them into 'High', 'Medium', or 'Low' revenue categories based on predefined thresholds
SELECT
    Employees.EmployeeID,
    CONCAT(Employees.FirstName, ' ', Employees.LastName) AS [Employee Name],
    AVG(CONVERT(money, (OrderDetails.Quantity * OrderDetails.UnitPrice) -
        ((OrderDetails.Quantity * OrderDetails.UnitPrice) * OrderDetails.Discount))) AS [Average Revenue],
    CASE
        WHEN AVG(CONVERT(money, (OrderDetails.Quantity * OrderDetails.UnitPrice) -
            ((OrderDetails.Quantity * OrderDetails.UnitPrice) * OrderDetails.Discount))) >= 600 THEN 'High'
        WHEN AVG(CONVERT(money, (OrderDetails.Quantity * OrderDetails.UnitPrice) -
            ((OrderDetails.Quantity * OrderDetails.UnitPrice) * OrderDetails.Discount))) >= 350 THEN 'Medium'
        ELSE 'Low'
    END AS [Revenue Category]
FROM 
    Orders
INNER JOIN 
    Employees ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN 
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
WHERE 
    YEAR(Orders.OrderDate) = 1997
GROUP BY 
    Employees.EmployeeID,
    CONCAT(Employees.FirstName, ' ', Employees.LastName);
--------------------------





--------  calculates the average revenue for each employee in the year 1997 --------------
SELECT
    Employees.EmployeeID,
    CONCAT(Employees.FirstName, ' ', Employees.LastName) AS [Employee Name],
    AVG(CONVERT(money, (OrderDetails.Quantity * OrderDetails.UnitPrice) -
        ((OrderDetails.Quantity * OrderDetails.UnitPrice) * OrderDetails.Discount))) AS [Average Revenue]
FROM 
    Orders
INNER JOIN 
    Employees ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN 
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
WHERE 
    YEAR(Orders.OrderDate) = 1997
GROUP BY 
    Employees.EmployeeID,
    CONCAT(Employees.FirstName, ' ', Employees.LastName);
----------------------------------




--------------- age category is determined based on the employee's age calculated as of December 30, 1998.
SELECT 
    Employees.EmployeeID,
    CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'full name',
    DATEDIFF(YEAR, Employees.BirthDate, '1998-12-30') AS 'age',
    DATEDIFF(YEAR, Employees.HireDate, '1998-12-30') AS 'years of service',
    Employees.Title,
    CASE 
        WHEN DATEDIFF(YEAR, Employees.BirthDate, '1998-12-30') BETWEEN 15 AND 45 THEN 'productive'
        WHEN DATEDIFF(YEAR, Employees.BirthDate, '1998-12-30') BETWEEN 46 AND 55 THEN 'Senior Level'
        WHEN DATEDIFF(YEAR, Employees.BirthDate, '1998-12-30') > 55 THEN 'Pre-Retirement'
        ELSE 'not productive'
    END AS 'age category'
FROM Employees;



------ employees' total transaction amounts for the year 1997
SELECT
    Employees.EmployeeID,
    CONCAT(Employees.FirstName, ' ', Employees.LastName) AS 'Employee Name',
    Employees.Title,
    SUM(CONVERT(money, (OrderDetails.Quantity * OrderDetails.UnitPrice) -
        ((OrderDetails.Quantity * OrderDetails.UnitPrice) * OrderDetails.Discount))) AS total_transaction
FROM 
    Orders
INNER JOIN 
    Employees ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN 
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
WHERE 
    (Orders.OrderDate IS NOT NULL) AND (YEAR(Orders.OrderDate) = 1997)
GROUP BY 
    Employees.EmployeeID,
    CONCAT(Employees.FirstName, ' ', Employees.LastName),
    Employees.Title,
    YEAR(Orders.OrderDate)
ORDER BY 
    total_transaction DESC;


-------- calculates the average revenue for each employee in the year 1997 and categorizes them into 'High', 'Medium', or 'Low' revenue categories based on predefined thresholds
SELECT
    Employees.EmployeeID,
    CONCAT(Employees.FirstName, ' ', Employees.LastName) AS [Employee Name],
    AVG(CONVERT(money, (OrderDetails.Quantity * OrderDetails.UnitPrice) -
        ((OrderDetails.Quantity * OrderDetails.UnitPrice) * OrderDetails.Discount))) AS [Average Revenue],
    CASE
        WHEN AVG(CONVERT(money, (OrderDetails.Quantity * OrderDetails.UnitPrice) -
            ((OrderDetails.Quantity * OrderDetails.UnitPrice) * OrderDetails.Discount))) >= 600 THEN 'High'
        WHEN AVG(CONVERT(money, (OrderDetails.Quantity * OrderDetails.UnitPrice) -
            ((OrderDetails.Quantity * OrderDetails.UnitPrice) * OrderDetails.Discount))) >= 350 THEN 'Medium'
        ELSE 'Low'
    END AS [Revenue Category]
FROM 
    Orders
INNER JOIN 
    Employees ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN 
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
WHERE 
    YEAR(Orders.OrderDate) = 1997
GROUP BY 
    Employees.EmployeeID,
    CONCAT(Employees.FirstName, ' ', Employees.LastName);
--------------------------



--------  calculates the average revenue for each employee in the year 1997 --------------
SELECT
    Employees.EmployeeID,
    CONCAT(Employees.FirstName, ' ', Employees.LastName) AS [Employee Name],
    AVG(CONVERT(money, (OrderDetails.Quantity * OrderDetails.UnitPrice) -
        ((OrderDetails.Quantity * OrderDetails.UnitPrice) * OrderDetails.Discount))) AS [Average Revenue]
FROM 
    Orders
INNER JOIN 
    Employees ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN 
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
WHERE 
    YEAR(Orders.OrderDate) = 1997
GROUP BY 
    Employees.EmployeeID,
    CONCAT(Employees.FirstName, ' ', Employees.LastName);
----------------------------------


-------- EMployees total number of orders, average revenue, and total revenue for each month of 1997
SELECT
    CONCAT(Employees.FirstName, ' ', Employees.LastName) AS [Employee Name],
    YEAR(Orders.OrderDate) AS [Transaction Year],
    DATENAME(MONTH,Orders.OrderDate) AS [Transaction Month],
	COUNT(Orders.OrderID) as [Total Orders],
	AVG(CONVERT(money, (OrderDetails.Quantity * OrderDetails.UnitPrice) -
        ((OrderDetails.Quantity * OrderDetails.UnitPrice) * OrderDetails.Discount))) AS [Average Revenue],
    SUM(CONVERT(money, (OrderDetails.Quantity * OrderDetails.UnitPrice) -
        ((OrderDetails.Quantity * OrderDetails.UnitPrice) * OrderDetails.Discount))) AS [Sum  OF Revenue]
FROM 
    Orders
INNER JOIN 
    Employees ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN 
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
WHERE 
    YEAR(Orders.OrderDate) = 1997
GROUP BY 
    Employees.EmployeeID,
    CONCAT(Employees.FirstName, ' ', Employees.LastName),
    YEAR(Orders.OrderDate),
    DATENAME(MONTH,Orders.OrderDate);
-------------------------------------



-------- EMployees total number of orders, average revenue, and total revenue for each month of 1997
SELECT
    CONCAT(Employees.FirstName, ' ', Employees.LastName) AS [Employee Name],
    YEAR(Orders.OrderDate) AS [Transaction Year],
    DATENAME(MONTH,Orders.OrderDate) AS [Transaction Month],
	COUNT(Orders.OrderID) as [Total Orders],
	AVG(CONVERT(money, (OrderDetails.Quantity * OrderDetails.UnitPrice) -
        ((OrderDetails.Quantity * OrderDetails.UnitPrice) * OrderDetails.Discount))) AS [Average Revenue],
    SUM(CONVERT(money, (OrderDetails.Quantity * OrderDetails.UnitPrice) -
        ((OrderDetails.Quantity * OrderDetails.UnitPrice) * OrderDetails.Discount))) AS [Sum  OF Revenue]
FROM 
    Orders
INNER JOIN 
    Employees ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN 
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
WHERE 
    YEAR(Orders.OrderDate) = 1997
GROUP BY 
    Employees.EmployeeID,
    CONCAT(Employees.FirstName, ' ', Employees.LastName),
    YEAR(Orders.OrderDate),
    DATENAME(MONTH,Orders.OrderDate);
-------------------------------------

