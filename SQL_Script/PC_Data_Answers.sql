SELECT TOP (1000) [Continent]
      ,[Country_or_State]
      ,[Province_or_City]
      ,[Shop_Name]
      ,[Shop_Age]
      ,[PC_Make]
      ,[PC_Model]
      ,[Storage_Type]
      ,[Customer_Name]
      ,[Customer_Surname]
      ,[Customer_Contact_Number]
      ,[Customer_Email_Address]
      ,[Sales_Person_Name]
      ,[Sales_Person_Department]
      ,[Cost_Price]
      ,[Sale_Price]
      ,[Payment_Method]
      ,[Discount_Amount]
      ,[Purchase_Date]
      ,[Ship_Date]
      ,[Finance_Amount]
      ,[RAM]
      ,[Credit_Score]
      ,[Channel]
      ,[Priority]
      ,[Cost_of_Repairs]
      ,[Total_Sales_per_Employee]
      ,[PC_Market_Price]
      ,[Storage_Capacity]
  FROM [PC_Sales_DB].[dbo].[PC_Data]

SELECT * FROM [PC_Sales_DB].[dbo].[PC_Data];


-- BASIC QUESTIONS

-- 1. Count the total number of sales records.

SELECT COUNT(*) AS total_number_of_sales_records
FROM [PC_Sales_DB].[dbo].[PC_Data];


-- 2. Count the number of sales per Continent.

SELECT [Continent],
COUNT(*) AS number_of_sales_per_Continent
FROM [PC_Sales_DB].[dbo].[PC_Data]
GROUP BY [Continent]; 

-- 3. Count the number of sales per Country or State.

SELECT [Country_or_State],
COUNT(*) AS number_of_sales_per_Country_or_State
FROM [PC_Sales_DB].[dbo].[PC_Data]
GROUP BY [Country_or_State];

-- 4. List all distinct Shop Name values.

SELECT DISTINCT [Shop_Name] FROM [PC_Sales_DB].[dbo].[PC_Data];

-- 5. Find the average Sale Price.

SELECT AVG(Sale_Price) AS average_Sale_Price
FROM [PC_Sales_DB].[dbo].[PC_Data];

-- Corrections

SELECT AVG(CONVERT(MONEY, [Sale_Price])) AS average_Sale_Price
FROM [PC_Sales_DB].[dbo].[PC_Data];

-- 6. Find the highest and lowest Sale Price.

SELECT MAX(Sale_Price) AS Highest_Sale_Price
FROM [PC_Sales_DB].[dbo].[PC_Data];

SELECT MIN(Sale_Price) AS lowest_Sale_Price
FROM [PC_Sales_DB].[dbo].[PC_Data];

---Corrections

SELECT MAX(CONVERT(MONEY,[Sale_Price])) AS Highest_Sale_Price,
       MIN(CONVERT(MONEY,[Sale_Price])) AS lowest_Sale_Price
       FROM [PC_Sales_DB].[dbo].[PC_Data];

-- 7. Count the number of sales by Payment Method.

SELECT [Payment_Method],
COUNT(*) AS number_of_sales_by_Payment_Method
FROM [PC_Sales_DB].[dbo].[PC_Data]
GROUP BY [Payment_Method];

-- 8. Count the number of sales by Channel (Online vs Offline).

SELECT [Channel],
COUNT(*) AS number_of_sales_by_Channel_Offline
FROM [PC_Sales_DB].[dbo].[PC_Data]
WHERE [Channel] = 'Offline'
GROUP BY [Channel];

SELECT [Channel],
COUNT(*) AS number_of_sales_by_Channel_Online 
FROM [PC_Sales_DB].[dbo].[PC_Data]
WHERE [Channel] = 'Online'
GROUP BY [Channel];

---Corrections

SELECT [Channel],
COUNT(*) AS number_of_sales_by_Channel_Online 
FROM [PC_Sales_DB].[dbo].[PC_Data]
GROUP BY [Channel];

-- 9. Count the number of sales by Priority level.

SELECT [Priority],
COUNT(*) AS number_of_sales_by_Priority_level 
FROM [PC_Sales_DB].[dbo].[PC_Data]
GROUP BY [Priority];

-- 10. Count the number of distinct PC Make values.

SELECT COUNT(DISTINCT PC_Make) AS number_of_distinct_PC_Make
FROM [PC_Sales_DB].[dbo].[PC_Data];

-- INTERMEDIATE QUESTIONS

-- 11. Calculate total revenue (SUM of Sale Price).
 
SELECT SUM(CONVERT(MONEY,[Sale_Price])) AS total_revenue
FROM [PC_Sales_DB].[dbo].[PC_Data];

-- 12. Calculate total profit (SUM of Sale Price - Cost Price).

SELECT SUM(CONVERT(MONEY,[Sale_Price])) AS total_profit
FROM [PC_Sales_DB].[dbo].[PC_Data];

-- 13. Find the average Discount Amount.

SELECT AVG(CONVERT(MONEY,Discount_Amount) AS average_Discount_Amount
FROM [PC_Sales_DB].[dbo].[PC_Data];

-- 14. Calculate total Finance Amount issued.

SELECT SUM(CONVERT(MONEY,[Finance_Amount])) AS total_Finance_Amount
FROM [PC_Sales_DB].[dbo].[PC_Data];

-- 15. Find total revenue per PC Make.

SELECT [PC_Make],
SUM(CONVERT(MONEY,[Sale_Price])) AS total_revenue_per_PC_Make
FROM [PC_Sales_DB].[dbo].[PC_Data]
GROUP BY [PC_Make]
ORDER BY total_revenue_per_PC_Make DESC;

-- 16. Find average Sale Price per Storage Type.

SELECT [Storage_Type],
AVG(CONVERT(MONEY,[Sale_Price])) AS average_Sale_Price_per_Storage_Type
FROM [PC_Sales_DB].[dbo].[PC_Data]
GROUP BY [Storage_Type]
ORDER BY average_Sale_Price_per_Storage_Type;


-- 17. Calculate total revenue per Shop Name.

SELECT [Shop_Name],
SUM(CONVERT(MONEY,[Sale_Price])) AS total_revenue_per_Shop_Name
FROM [PC_Sales_DB].[dbo].[PC_Data]
GROUP BY [Shop_Name]
ORDER BY total_revenue_per_Shop_Name DESC;

-- 18. Calculate total revenue per Sales Person Name.

SELECT [Sales_Person_Name],
SUM(CONVERT(MONEY,[Sale_Price])) AS total_revenue_per_Sales_Person_Name
FROM [PC_Sales_DB].[dbo].[PC_Data]
GROUP BY [Sales_Person_Name]
ORDER BY total_revenue_per_Sales_Person_Name DESC;

-- 19. Find average Credit Score per Payment Method.

SELECT [Payment_Method],
AVG(CONVERT(MONEY,[Credit_Score])) AS average_Credit_Score_per_Payment_Method
FROM [PC_Sales_DB].[dbo].[PC_Data]
GROUP BY [Payment_Method];

-- 20. Calculate total Cost of Repairs per Sales Person Department.

SELECT [Sales_Person_Department],
SUM(CONVERT(MONEY,[Cost_of_Repairs])) AS total_Cost_of_Repairs_per_Sales_Person_Dep
FROM [PC_Sales_DB].[dbo].[PC_Data]
GROUP BY [Sales_Person_Department]
ORDER BY total_Cost_of_Repairs_per_Sales_Person_Dep DESC ;


-- ADVANCED QUESTIONS

-- 21. Calculate profit per Shop Name.

SELECT [Shop_Name],
SUM(CONVERT(MONEY,[Sale_Price]) - [Cost_Price]) AS total_profit_per_Shop_Name
FROM [PC_Sales_DB].[dbo].[PC_Data]
GROUP BY [Shop_Name]
ORDER BY total_profit_per_Shop_Name DESC;

-- 22. Calculate profit margin per sale ((Sale Price - Cost Price) / Sale Price).

SELECT SUM(CONVERT(MONEY,(Sale_Price - Cost_Price)/Sale_Price)) *100 AS total_profit_margin_per_sale
FROM [PC_Sales_DB].[dbo].[PC_Data];

-- 23. Determine which Continent has the highest total revenue.

SELECT TOP 1[Continent],
SUM(CONVERT(MONEY,[Sale_Price])) AS highest_total_revenue
FROM [PC_Sales_DB].[dbo].[PC_Data]
GROUP BY [Continent]
ORDER BY highest_total_revenue DESC;

-- 24. Calculate average Sale Price per RAM size.

SELECT [RAM],
AVG(CONVERT(MONEY,[Sale_Price])) AS average_total_revenue
FROM [PC_Sales_DB].[dbo].[PC_Data]
GROUP BY [RAM];

-- 25. Find the PC Model with the highest Sale Price.

SELECT TOP 1 [PC_Model],
SUM(CONVERT(MONEY,[Sale_Price])) AS PC_Model_with_the_highest_total_revenue
FROM [PC_Sales_DB].[dbo].[PC_Data]
GROUP BY [PC_Model]
ORDER BY PC_Model_with_the_highest_total_revenue DESC;

-- 26. Calculate the average number of days between Purchase Date and Ship Date.



-- 27. Determine which Sales Person Department generates the highest revenue.



-- 28. Calculate total revenue per Storage Capacity.

SELECT [Storage_Capacity],
SUM(CONVERT(MONEY,[Sale_Price])) AS total_revenue_per_Storage_Capacity
FROM [PC_Sales_DB].[dbo].[PC_Data]
GROUP BY [Storage_Capacity];


-- 29. Identify sales where Sale Price is lower than PC Market Price.



-- 30. Rank Sales Person Name by Total Sales per Employee using a window function.

  
