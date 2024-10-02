
use anand
select * from sys.tables
select * from stocks
Q1. Total Revenue

SELECT CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Revenue
FROM Pizza.dbo.pizza_sales;

-- Q2. Average Order Value
SELECT CAST((SUM(total_price) / COUNT(DISTINCT order_id)) AS DECIMAL(10,2)) AS Avg_Order_Value
FROM Pizza.dbo.pizza_sales;

-- Q3. Total Pizza Sold
SELECT SUM(quantity) AS Total_Pizza_Sold
FROM Pizza.dbo.pizza_sales;

-- Q4. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM Pizza.dbo.pizza_sales;

-- Q5. Avg Pizza Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) 
AS Avg_Pizzas_per_order
FROM Pizza.dbo.pizza_sales;

-- Q6. Daily Trend for Total Orders
SELECT DATENAME(DW, order_date) AS Order_Day, COUNT(DISTINCT order_id) AS Total_Orders
FROM Pizza.dbo.pizza_sales
GROUP BY DATENAME(DW, order_date)
ORDER BY Total_Orders;

-- Q7. Monthly Trend for Orders
SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_Orders
FROM Pizza.dbo.pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_Orders;

Q8. % of Sales by Pizza Category

SQL
SELECT pizza_category, 
       CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Revenue,
       CAST(SUM(total_price) * 100 / (SELECT SUM(total_price)   
 FROM Pizza.dbo.pizza_sales) AS DECIMAL(18,2))   
 AS PCT
FROM Pizza.dbo.pizza_sales
GROUP BY pizza_category;
Use code with caution.

Q9. % of Sales by Pizza Size

SQL
SELECT pizza_size, 
       CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Revenue,
       CAST(SUM(total_price) * 100 / (SELECT SUM(total_price)   
 FROM Pizza.dbo.pizza_sales) AS DECIMAL(18,2))   
 AS PCT
FROM Pizza.dbo.pizza_sales
GROUP BY pizza_size;
Use code with caution.

Q10. Total Pizzas Sold by Pizza Category

SQL
SELECT pizza_category, SUM(quantity) AS Total_Quantity_Sold
FROM Pizza.dbo.pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;
Use code with caution.

Q11. Top 5 Pizzas by Revenue

SQL
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM Pizza.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC;
Use code with caution.

Q12. Bottom 5 Pizzas by Revenue

SQL
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM Pizza.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue;
Use code with caution.

Q13. Top 5 Pizzas by Total Orders

SQL
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM Pizza.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC;
Use code with caution.

Q14. Bottom 5 Pizzas by Total Orders

SQL
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM Pizza.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders;
Use code with caution.

Q15. Top 5 Pizzas by Quantity

SQL
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM Pizza.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC;
Use code with caution.

Q16. Bottom 5 Pizzas by Quantity

SQL
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM Pizza.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold;