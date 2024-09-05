
--Group Assignment
--Question 1: Find the total number of products in each product category

SELECT
	PC.ProductCategoryKey,
	COUNT(*) AS TotalProducts
FROM DimProduct P
	JOIN DimProductSubcategory PS
		ON P.ProductSubcategoryKey= PS.ProductSubcategoryKey
	JOIN DimProductCategory PC
		ON PC.ProductCategoryKey =PS. ProductCategoryKey
GROUP BY PC.ProductCategoryKey;


 --Question 2: Find the top 10 customers with the highest total purchase amount

SELECT TOP 10 
  CONCAT(C.FirstName, ' ', C.LastName) FullName,
  SUM(S.SalesAmount) AS TotalPurchase
FROM FactInternetSales S
	JOIN DimCustomer C
		ON S.CustomerKey = C.CustomerKey
GROUP BY
    CONCAT(C.FirstName, ' ', C.LastName) 
ORDER BY TotalPurchase DESC;

--Question 3: Find the average purchase for each customer

SELECT 
  CONCAT(C.FirstName, ' ', C.LastName) FullName,
  AVG(S.SalesAmount) AS AVGPurchase
FROM FactInternetSales S
	JOIN DimCustomer C
		ON S.CustomerKey = C.CustomerKey
GROUP BY CONCAT(C.FirstName, ' ', C.LastName);

--Question 4: Find the total quantity sold for each product

SELECT
	DP.ProductKey,
	SUM(FS.OrderQuantity) TotalQuantity
FROM FactInternetSales FS 
	JOIN DimProduct DP
		ON DP.ProductKey = FS.ProductKey
GROUP BY DP.ProductKey;

--Question 5: Find the total sales amount for each territory

SELECT
	SalesTerritoryKey,
	SUM(SalesAmount) AS Totalsales
FROM [dbo].[FactInternetSales]
GROUP BY SalesTerritoryKey;

 
--Question 6: Find the total number of orders placed in each year

SELECT
	YEAR(OrderDate) AS OrderYear,
	COUNT(*) AS TotalOrders
FROM FactInternetSales 
GROUP BY YEAR(OrderDate)

--Question 7: Find the average sales amount for each year.

SELECT
	YEAR(OrderDate) AS OrderYear,
	AVG(SalesAmount) AS AverageSalesAmount
FROM [dbo].[FactInternetSales]
GROUP BY YEAR(OrderDate);


--Question 8: Find the top 5 products with the highest total sales amount

SELECT TOP 5
	DP.EnglishProductName,
	SUM(SF.SalesAmount) AS TotalSalesAmount
FROM  FactInternetSales SF
	JOIN DimProduct DP 
		ON DP.ProductKey = SF.ProductKey
GROUP BY DP.EnglishProductName
ORDER BY TotalSalesAmount DESC;


--Question 9: Find the total number of employees in each job title

SELECT
	Title,
	COUNT(*) AS TotalEmployees
FROM [dbo].[DimEmployee]
GROUP BY Title;

--Question 10: Find the total number of products in each colour.

SELECT
	Color,
	COUNT(*) AS Totalnumber
FROM [dbo].[DimProduct]
GROUP BY Color;


--Question 11: Find the top 10 Customers with the highest number of orders

SELECT TOP 10
	CONCAT(C.FirstName, ' ', C.LastName) FullName,
	COUNT(*) AS TotalOrders
FROM FactInternetSales SF
	JOIN DimCustomer C
		ON C.CustomerKey = SF.CustomerKey
GROUP BY CONCAT(C.FirstName, ' ', C.LastName)
ORDER BY TotalOrders DESC;



--Question 12: Find the total number of products in each subcategory

SELECT
	P.ProductSubcategoryKey,
	COUNT(P.ProductKey) AS ProductCount
FROM DimProduct P
	JOIN DimProductSubcategory SB
		ON SB.ProductSubcategoryKey = P.ProductSubcategoryKey
GROUP BY P. ProductSubcategoryKey
ORDER BY 2 DESC;


--Question 13: Find the top 5 products with the highest profit margin

SELECT DISTINCT TOP 5
	P.EnglishProductName,
	SalesAmount,
	TotalProductCost,
	SalesAmount - TotalProductCost AS Profit,
	(SalesAmount - TotalProductCost)/ TotalProductCost * 100 AS ProfitMargin
FROM FactInternetSales SF
	JOIN DimProduct P
		ON SF.ProductKey=P.ProductKey
ORDER BY ProfitMargin DESC;




  
