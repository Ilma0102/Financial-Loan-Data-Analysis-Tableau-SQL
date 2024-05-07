Create database pizza;
use  pizza;

Select * from pizza_sales;

# Total pizzas sold
Select sum(quantity) as total_pizzas_sold from pizza_sales;

# Total Revenue
Select round(sum(total_price)) as total_revenue from pizza_sales;

# Average Order Value
Select round(sum(total_price)/count(distinct order_id)) as avg_order_value from pizza_sales;

# Total orders made
Select count(distinct order_id) as total_orders from pizza_sales;

# Average Pizzas per order
Select round(sum(quantity)/count(distinct order_id),1) as Average_pizzas_per_order from pizza_sales;

# Hourly trend of Pizza sales
Select hour(order_time) as order_hours, sum(quantity) as total_pizza_sales from pizza_sales
group by hour(order_time) order by hour(order_time);

SELECT WEEK(order_id, 0) AS order_week,
       COUNT(DISTINCT order_date) AS Total_Orders
FROM pizza_sales
GROUP BY WEEK(order_id, 0);

/*
# Weekly trend of Pizza sales

SELECT 
	WEEKOFYEAR(order_date) AS Order_week,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY WEEKOFYEAR(order_date);

SELECT DATE_FORMAT(STR_TO_DATE(order_date,'%d.%m.%Y'), '%Y-%m-%d') as Date FROM pizza_sales;

Select week(order_date) as order_week, year(order_date) as order_year, 
count(distinct order_id) as total_pizza_sales from pizza_sales
group by week(order_date),year(order_date) 
order by week(order_date),year(order_date);

*/

#Total Pizzas sold by Pizza category
Select pizza_category, sum(quantity) as pizzas_sold, round(sum(total_price),2) as total_sales,
round((sum(total_price)*100/(Select sum(total_price) from pizza_sales)),2) as percentage_sales 
from pizza_sales group by pizza_category
order by percentage_sales; 

#Total Pizzas sold by Pizza size
Select pizza_size, sum(quantity) as pizzas_sold, round(sum(total_price),2) as total_sales,
round((sum(total_price)*100/(Select sum(total_price) from pizza_sales)),2) as percentage_sales 
from pizza_sales group by pizza_size
order by percentage_sales;

# Best 5 selling pizzas
Select pizza_name, sum(quantity) as total_pizzas_sold from pizza_sales group by pizza_name
order by total_pizzas_sold desc limit 5;

# Bottom 5 performing pizzas
Select pizza_name, sum(quantity) as total_pizzas_sold from pizza_sales group by pizza_name
order by total_pizzas_sold limit 5;  

# Top 5 pizzas by revenue generation
Select pizza_name, sum(total_price) as total_pizza_revenue from pizza_sales group by pizza_name
order by total_pizza_revenue desc limit 5; 

# Bottom 5 pizzas by revenue generation
Select pizza_name, round(sum(total_price),2) as total_pizza_revenue from pizza_sales group by pizza_name
order by total_pizza_revenue limit 5; 

# Top 5 pizzas by number of orders
Select pizza_name, count(distinct order_id) as total_orders from pizza_sales group by pizza_name
order by total_orders desc limit 5; 

# Bottom 5 pizzas by number of orders
Select pizza_name, count(distinct order_id) as total_orders from pizza_sales group by pizza_name
order by total_orders limit 5;


