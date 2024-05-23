----- Measuring the Number of Monthly Shipments

SELECT 
	DATENAME(month,Orders.ShippedDate) AS [Month],
	COUNT(Orders.OrderID) AS [delivery amount]
FROM
	Orders
WHERE 
	(dbo.Orders.ShippedDate IS NOT NULL) AND Orders.ShippedDate BETWEEN '1997-01-01' AND '1997-12-31'
GROUP BY 
	DATENAME(month,Orders.ShippedDate)
ORDER BY 
	[delivery amount] asc
----------------------


--- average delivery time
SELECT 
    Customers.Country,
    AVG(DATEDIFF(day, Orders.OrderDate, Orders.ShippedDate)) AS AverageShippingTime
FROM 
    Orders
INNER JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID
WHERE 
    Orders.ShippedDate IS NOT NULL
GROUP BY 
	Customers.Country;
----------


---- categorize each order based on delivery times below or above the average delivery time for 1997 
---  with the Common Table Expression (CTE)
WITH ShippingData AS (
    SELECT 
        Orders.OrderID,
        Customers.Country,
        Orders.OrderDate,
        Orders.ShippedDate,
        DATEDIFF(day, Orders.OrderDate, Orders.ShippedDate) AS ShippingTime,
        AVG(DATEDIFF(day, Orders.OrderDate, Orders.ShippedDate)) OVER () AS AvgShippingTime
    FROM 
        Orders
    INNER JOIN 
        Customers ON Orders.CustomerID = Customers.CustomerID
    WHERE
        Orders.ShippedDate IS NOT NULL 
        AND Orders.ShippedDate BETWEEN '1997-01-01' AND '1997-12-31'
)
SELECT 
    OrderID,
    Country,
    OrderDate,
    ShippedDate,
    ShippingTime,
    CASE 
        WHEN ShippingTime < AvgShippingTime THEN 'Below Average'
        ELSE 'Above Average'
    END AS ShippingCategory
FROM 
    ShippingData;
