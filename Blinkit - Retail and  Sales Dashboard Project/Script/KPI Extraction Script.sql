DROP DATABASE IF EXISTS blinkit_analysis;
CREATE DATABASE blinkit_analysis;
USE blinkit_analysis;

DROP TABLE IF EXISTS blinkit_sales;

CREATE TABLE blinkit_sales (

    Item_Identifier VARCHAR(20),
    Item_Weight FLOAT,
    Item_Fat_Content VARCHAR(50),
    Item_Visibility FLOAT,
    Item_Type VARCHAR(100),
    Item_MRP FLOAT,
    Outlet_Identifier VARCHAR(20),
    Outlet_Establishment_Year INT,
    Outlet_Size VARCHAR(20),
    Outlet_Location_Type VARCHAR(20),
    Outlet_Type VARCHAR(50),
    Item_Outlet_Sales FLOAT,

    Outlet_Age INT,
    Sales_Category VARCHAR(20),
    Visible_Category VARCHAR(30),
    Estimated_Profit FLOAT

);

DESCRIBE blinkit_sales;
ALTER TABLE blinkit_sales
MODIFY Estimated_Profit INT;

SET GLOBAL local_infile = 1;
LOAD DATA LOCAL INFILE 
'C:/Users/HP/Downloads/Data Analytics Projects/Csv/new.csv'

INTO TABLE blinkit_sales

FIELDS TERMINATED BY ','
ENCLOSED BY '"'

LINES TERMINATED BY '\n'

IGNORE 1 ROWS;
SELECT *
FROM blinkit_sales
LIMIT 10;

-- Revenue Analysis 
SELECT 
   ROUND(SUM(Item_Outlet_Sales),2) AS Total_Revenue
FROM blinkit_Sales;

-- Profit Margin 
SELECT 
   ROUND(SUM(Estimated_Profit),2) AS Total_Profit
FROM blinkit_Sales;

-- Monthly / Trend Analysis 
SELECT 
   Outlet_Establishment_Year,
   ROUND(SUM(Item_Outlet_Sales),2) AS Total_Sales 
FROM blinkit_Sales
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_year;

-- Product Performance 
SELECT 
   Item_Type, 
   ROUND(SUM(Item_Outlet_Sales),2) AS Product_Sales
FROM blinkit_Sales
GROUP BY Item_Type
ORDER BY Product_Sales DESC;

-- Regional sales analysis 

SELECT 
   Outlet_Location_Type,
   ROUND(SUM(Item_Outlet_Sales),2) AS Regional_Sales
FROM blinkit_Sales
GROUP BY Outlet_Location_Type
ORDER BY Regional_Sales DESC;



