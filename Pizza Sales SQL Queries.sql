--SELECT * FROM pizza_sales

--A.API’s
--Total Revenue
SELECT ROUND(SUM(total_price),2) AS Total_Revenue
FROM pizza_sales

--Average Order Value
SELECT SUM(total_price)/COUNT(DISTINCT(order_id)) AS Average_Order_Value
FROM pizza_sales

--Total Pizzas Sold 
SELECT SUM(quantity) AS Total_Pizzas_Sold 
FROM pizza_sales

--Total Orders 
SELECT COUNT(DISTINCT(order_id)) AS Total_Orders
FROM pizza_sales

--Average Pizzas Per Order
SELECT CAST(SUM(quantity) AS decimal(10,2)) /
CAST(COUNT(DISTINCT(order_id)) AS decimal(10,2)) AS Average_Order_Value
FROM pizza_sales


--B. Daily Trend for Total Orders 
SELECT DATENAME(DW,order_date) AS Order_Day, COUNT(DISTINCT(order_id)) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(DW,order_date)


--C. Monthly Trend for Orders
SELECT DATENAME(MONTH,order_date) AS Order_Day, COUNT(DISTINCT(order_id)) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(MONTH,order_date)
ORDER BY 2 DESC


--D. % of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category


--E. % of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY 1



--F. Total Pizzas Sold by Pizza Category
SELECT SUM(quantity) AS Total_Pizzas_Sold ,pizza_category
FROM pizza_sales
GROUP BY pizza_category 
ORDER BY 1 DESC


--G. Top 5 Pizzas by Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name 
ORDER BY 2 DESC


--H. Bottom 5 Pizzas by Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name 
ORDER BY 2 

--I. Top 5 Pizzas by Quantity
SELECT pizza_name, SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name 
ORDER BY 2 DESC

--J. Bottom 5 Pizzas by Quantity
SELECT pizza_name, SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name 
ORDER BY 2


--K. Top 5 Pizzas by Total Orders
SELECT pizza_name, COUNT(DISTINCT(order_id)) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name 
ORDER BY 2 DESC


--L. Bottom 5 Pizzas by Total Orders
SELECT pizza_name, COUNT(DISTINCT(order_id)) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name 
ORDER BY 2


