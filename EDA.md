### Question 1: Find the total number of products in each product category

````sql
SELECT
	PC.ProductCategoryKey,
	COUNT(*) AS TotalProducts
FROM DimProduct P
	JOIN DimProductSubcategory PS
		ON P.ProductSubcategoryKey= PS.ProductSubcategoryKey
	JOIN DimProductCategory PC
		ON PC.ProductCategoryKey =PS. ProductCategoryKey
GROUP BY PC.ProductCategoryKey;
````
![image](https://github.com/user-attachments/assets/e57d66d0-76a0-404f-bbac-402d0ee66c79)


### Question 2: Find the top 10 customers with the highest total purchase amount

````sql
SELECT TOP 10 
  CONCAT(C.FirstName, ' ', C.LastName) FullName,
  SUM(S.SalesAmount) AS TotalPurchase
FROM FactInternetSales S
	JOIN DimCustomer C
		ON S.CustomerKey = C.CustomerKey
GROUP BY
    CONCAT(C.FirstName, ' ', C.LastName) 
ORDER BY TotalPurchase DESC;
````
![image](https://github.com/user-attachments/assets/bd281a59-fdaa-4969-a9fe-df1320ad355c)


### Question 3: Find the average purchase for each customer

````sql
SELECT 
  CONCAT(C.FirstName, ' ', C.LastName) FullName,
  AVG(S.SalesAmount) AS AVGPurchase
FROM FactInternetSales S
	JOIN DimCustomer C
		ON S.CustomerKey = C.CustomerKey
GROUP BY CONCAT(C.FirstName, ' ', C.LastName);
````
![image](https://github.com/user-attachments/assets/dd8af53c-6d34-4d24-841b-f6244ee577b6)


### Question 4: Find the total quantity sold for each product

````sql
SELECT
	DP.ProductKey,
	SUM(FS.OrderQuantity) TotalQuantity
FROM FactInternetSales FS 
	JOIN DimProduct DP
		ON DP.ProductKey = FS.ProductKey
GROUP BY DP.ProductKey;
````

![image](https://github.com/user-attachments/assets/b370e404-492b-40da-8693-000927722c7b)


### Question 5: Find the total sales amount for each territory

````sql

SELECT
	SalesTerritoryKey,
	SUM(SalesAmount) AS Totalsales
FROM [dbo].[FactInternetSales]
GROUP BY SalesTerritoryKey;
````

![image](https://github.com/user-attachments/assets/10191c9b-8c2e-468c-8ab1-98778be397bf)


### Question 6: Find the total number of orders placed in each year

````sql

SELECT
	YEAR(OrderDate) AS OrderYear,
	COUNT(*) AS TotalOrders
FROM FactInternetSales 
GROUP BY YEAR(OrderDate)
````

![image](https://github.com/user-attachments/assets/41595912-6bcc-47ba-906a-ccee443c881b)


### Question 7: Find the average sales amount for each year.

````sql

SELECT
	YEAR(OrderDate) AS OrderYear,
	AVG(SalesAmount) AS AverageSalesAmount
FROM [dbo].[FactInternetSales]
GROUP BY YEAR(OrderDate);
````

![image](https://github.com/user-attachments/assets/f5cd8aae-0068-4faf-88cc-c728cd60cc40)


### Question 8: Find the top 5 products with the highest total sales amount

````sql

SELECT TOP 5
	DP.EnglishProductName,
	SUM(SF.SalesAmount) AS TotalSalesAmount
FROM  FactInternetSales SF
	JOIN DimProduct DP 
		ON DP.ProductKey = SF.ProductKey
GROUP BY DP.EnglishProductName
ORDER BY TotalSalesAmount DESC;
````

![image](https://github.com/user-attachments/assets/734be042-eadf-4d54-8a45-34c39bf5808c)



### Question 9: Find the total number of employees in each job title

````sql

SELECT
	Title,
	COUNT(*) AS TotalEmployees
FROM [dbo].[DimEmployee]
GROUP BY Title;
````

![image](https://github.com/user-attachments/assets/c58a4be0-7729-4fff-a589-c8f174580084)


### Question 10: Find the total number of products in each colour.

````sql


SELECT
	Color,
	COUNT(*) AS Totalnumber
FROM [dbo].[DimProduct]
GROUP BY Color;
````

![image](https://github.com/user-attachments/assets/03ce332b-f5a3-4abe-98e1-5bab7a77d5a1)


### Question 11: Find the top 10 Customers with the highest number of orders

````sql


SELECT TOP 10
	CONCAT(C.FirstName, ' ', C.LastName) FullName,
	COUNT(*) AS TotalOrders
FROM FactInternetSales SF
	JOIN DimCustomer C
		ON C.CustomerKey = SF.CustomerKey
GROUP BY CONCAT(C.FirstName, ' ', C.LastName)
ORDER BY TotalOrders DESC;
````

![image](https://github.com/user-attachments/assets/e55e237a-41d4-4840-b5e6-665df18be208)



### Question 12: Find the total number of products in each subcategory

````sql

SELECT
	P.ProductSubcategoryKey,
	COUNT(P.ProductKey) AS ProductCount
FROM DimProduct P
	JOIN DimProductSubcategory SB
		ON SB.ProductSubcategoryKey = P.ProductSubcategoryKey
GROUP BY P. ProductSubcategoryKey
ORDER BY 2 DESC;
````

![image](https://github.com/user-attachments/assets/ee2a675f-f14b-4016-8aeb-564014c08c8c)


### Question 13: Find the top 5 products with the highest profit margin

````sql


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

````

![image](https://github.com/user-attachments/assets/637d12d8-1b46-456f-ab68-f45a0800adcf)
