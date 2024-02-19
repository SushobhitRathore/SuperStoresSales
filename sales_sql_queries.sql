#LOADING THE DATA

SELECT * FROM project1.superstore ;

#1. What are total sales and total profits of each year?

select year(Order_Date) as year,
round(sum(Sales),3) as total_sales,
round(sum(Profit),3) as total_profit
FROM project1.superstore
group by 1
order by 1;

#2. What are the total profits and total sales per quarter?

SELECT 
  extract(year from Order_Date) AS year, 
  CASE 
    WHEN extract(month from Order_Date) IN (1,2,3) THEN 'Q1'
    WHEN extract(month from Order_Date) IN (4,5,6) THEN 'Q2'
    WHEN extract(month from Order_Date) IN (7,8,9) THEN 'Q3'
    ELSE 'Q4'
  END AS quarter,
  round(SUM(Sales),2) AS total_sales,
  round(SUM(Profit),2) AS total_profit
FROM project1.superstore
GROUP BY year, quarter
ORDER BY year, quarter;

#3. What region generates the highest sales and profits ?

SELECT Region, 
round(SUM(Sales),2) AS total_sales, 
round(SUM(Profit),2) AS total_profits
FROM project1.superstore
GROUP BY Region
ORDER BY total_profits DESC;

#Profit margin for each region

SELECT Region,
ROUND((SUM(Profit)/SUM(Sales))*100,2) as profit_margin
FROM project1.superstore
GROUP BY Region
ORDER BY profit_margin DESC;

#4. What state and city brings in the highest sales and profits ?

#States:
#Top 10 states

SELECT State,
round(SUM(Sales),2) as Total_Sales, 
round(SUM(Profit),2) as Total_Profits, 
ROUND((SUM(Profit)/SUM(Sales))*100, 2) as profit_margin
FROM project1.superstore
GROUP BY State
ORDER BY Total_Profits DESC
LIMIT 10;

#Bottom 10 states

SELECT State,
round(SUM(Sales),2) as Total_Sales, 
round(SUM(Profit),2) as Total_Profits, 
ROUND((SUM(Profit)/SUM(Sales))*100, 2) as profit_margin
FROM project1.superstore
GROUP BY State
ORDER BY Total_Profits ASC
LIMIT 10;

#Cities
#Top 10 cities

SELECT State,
round(SUM(Sales),2) as Total_Sales, 
round(SUM(Profit),2) as Total_Profits, 
ROUND((SUM(Profit)/SUM(Sales))*100, 2) as profit_margin
FROM project1.superstore
GROUP BY State
ORDER BY Total_Profits DESC
LIMIT 10;

#Bottom 10 cities

SELECT State,
round(SUM(Sales),2) as Total_Sales, 
round(SUM(Profit),2) as Total_Profits, 
ROUND((SUM(Profit)/SUM(Sales))*100, 2) as profit_margin
FROM project1.superstore
GROUP BY State
ORDER BY Total_Profits ASC
LIMIT 10;

#5. The relationship between discount and sales and the total discount per category.

SELECT Discount, 
AVG(Sales) AS Avg_Sales
FROM project1.superstore
GROUP BY Discount
ORDER BY Discount;

#The total discount per product category:

SELECT Category, 
round(SUM(Discount),2) AS total_discount
FROM project1.superstore
GROUP BY Category
ORDER BY total_discount DESC;

#Type of products with the high discount

SELECT Category,Sub_Category,
round(SUM(Discount),2) AS total_discount
FROM project1.superstore
GROUP BY 1,2
ORDER BY total_discount DESC;

#6. What category generates the highest sales and profits in each region and state ?

#The total sales and total profits of each category with their profit margins:

SELECT Category, 
round(SUM(Sales),2) AS total_sales, 
round(SUM(Profit),2) AS total_profit, 
ROUND(SUM(Profit)/SUM(Sales)*100,2) AS profit_margin
FROM project1.superstore
GROUP BY Category
ORDER BY total_profit DESC;

#The highest total sales and total profits per Category in each region:

SELECT Region,Category, 
round(SUM(Sales),2) AS total_sales, 
round(SUM(Profit),2) AS total_profit 
FROM project1.superstore
GROUP BY Region,Category
ORDER BY total_profit DESC;

#The highest total sales and total profits per Category in each state:

SELECT State,Category, 
round(SUM(Sales),2) AS total_sales, 
round(SUM(Profit),2) AS total_profit 
FROM project1.superstore
GROUP BY State,Category
ORDER BY total_profit DESC;

#The least profitable states:

SELECT State,Category, 
round(SUM(Sales),2) AS total_sales, 
round(SUM(Profit),2) AS total_profit 
FROM project1.superstore
GROUP BY State,Category
ORDER BY total_profit ASC;

#7. What subcategory generates the highest sales and profits in each region and state?

SELECT Sub_Category, 
round(SUM(Sales),2) AS total_sales, 
round(SUM(Profit),2) AS total_profit, 
ROUND(SUM(Profit)/SUM(Sales)*100,2) AS profit_margin
FROM project1.superstore
GROUP BY Sub_Category
ORDER BY total_profit DESC;

#The highest total sales and total profits per subcategory in each region:

SELECT Region,Sub_Category, 
round(SUM(Sales),2) AS total_sales, 
round(SUM(Profit),2) AS total_profit
FROM project1.superstore
GROUP BY Region,Sub_Category
ORDER BY total_profit DESC;

#The least profitable regions:

SELECT Region,Sub_Category, 
round(SUM(Sales),2) AS total_sales, 
round(SUM(Profit),2) AS total_profit
FROM project1.superstore
GROUP BY Region,Sub_Category
ORDER BY total_profit ASC;

#The highest total sales and total profits per subcategory in each state:

SELECT State,Sub_Category, 
round(SUM(Sales),2) AS total_sales, 
round(SUM(Profit),2) AS total_profit
FROM project1.superstore
GROUP BY State,Sub_Category
ORDER BY total_profit DESC;

#The least profitable states:

SELECT State,Sub_Category, 
round(SUM(Sales),2) AS total_sales, 
round(SUM(Profit),2) AS total_profit
FROM project1.superstore
GROUP BY State,Sub_Category
ORDER BY total_profit ASC;

#9. What segment makes the most of our profits and sales?

SELECT Segment,
round(SUM(Sales),2) AS total_sales, 
round(SUM(Profit),2) AS total_profit
FROM project1.superstore
GROUP BY Segment
ORDER BY total_profit DESC;

#10. How many customers do we have (unique customer IDs) in total and how much per region and state?

SELECT COUNT(DISTINCT Customer_Id) AS total_customers
FROM project1.superstore;

#Total customers per region

SELECT Region, COUNT(DISTINCT Customer_ID) AS total_customers
FROM project1.superstore
GROUP BY Region
ORDER BY total_customers DESC;

#Total customers per state

SELECT State, COUNT(DISTINCT Customer_ID) AS total_customers
FROM project1.superstore
GROUP BY State
ORDER BY total_customers DESC;

#States with less customers

SELECT State, COUNT(DISTINCT Customer_ID) AS total_customers
FROM project1.superstore
GROUP BY State
ORDER BY total_customers ASC;

#11. Average shipping time per class and in total

SELECT round(avg(datediff(Ship_Date,Order_Date)),1) AS avg_shipping_time
FROM project1.superstore;

#The shipping time in each shipping mode is:

SELECT Ship_Mode,
round(avg(datediff(Ship_Date,Order_Date)),1) AS avg_shipping_time
FROM project1.superstore
group by Ship_Mode
order by avg_shipping_time;




