-----------------------------BASICS-------------------------------

 -- Retrieve the total number of orders placed.  
SELECT  
COUNT(order_id) AS Total_orders  
FROM  orders;

-- Calculate the total revenue generated from pizza sales.  
SELECT  
ROUND(SUM(o.quantity * p.price), 2) AS Total_Revenue  
FROM  
order_details AS o  
JOIN  
pizzas AS p ON p.pizza_id = o.pizza_id;

-- Identify the highest-priced pizza.  
SELECT  
pt.name, p.price  
FROM  
pizza_types AS pt  
JOIN  
pizzas AS p ON pt.pizza_type_id = p.pizza_type_id  
ORDER BY p.price DESC  
LIMIT 1;  

-- IdentIfy the most comon pizza stze ordered.  
SELECT  
    p.size, count(o.order_detail_id) AS order_count  
FROM  
    pizzas AS p  
        JOIN  
    order_details AS o ON p.pizza_id = o.pizza_id  
GROUP BY p.size  
ORDER BY order_count DESC  
LIMIT 1;  

-- List the top 5 nost ordered gizas types along with their quantitiet.  
SELECT  
pt.name, SUM(o.quantity) AS quantity  
FROM  
pizza_types AS pt  
JOIN  
pizzas AS p ON p.pizza_type_id = pt.pizza_type_id  
JOIN  
order_details AS o ON p.pizza_id = o.pizza_id   
GROUP BY pt.name  
ORDER BY quantity DESC  
LIMIT 5;

-------------------------------INTERMEDIATE----------------------------------------

-- Join the necessary tables to find the total quantity of each pizza category ordered.  
SELECT  
pt.category, SUM(o.quantity) As Quantity  
FROM
pizza_types pt  
JOIN
pizzas AS p ON p.pizza_type_id = pt.pizza_type_id  
JOIN  
order_details AS o ON o.pizza_id = p.pizza_id  
GROUP BY pt.category  
ORDER BY quantity DESC; 

-- Determine the distribution of onders by hour of the day.  
SELECT  
HOUR(order_time) AS HourOfDay, COUNT(order_id) AS OrderCount  
FROM  orders  
GROUP BY HOUR(order_time)  
ORDER BY HourOfDay;  

-- Join relevant tables to find the category-wise distribution of pizzas  
SELECT  
Category, COUNT(name) AS pizza_count  
FROM pizza_types  
GROUP BY category;

-- Group the orders by date and calculate the average number of plzzas ordered per day.  
SELECT  
ROUND(AVG(total_count_pizza), 6) AS Average_no_of_pizza  
FROM 
(SELECT  
o.order_date AS Date, SUM(od.quantity) AS total_count_pizza  
FROM  
orders AS o  
JOIN order_details AS od ON o.order_Id = od.order_id  
GROUP BY Date) AS Total_order; 

-- Determine the top 3 most ordered pizza types based on revenue.  
SELECT  
    pt.name, ROUND(SUM(o.quantity * p.price), 8) AS Revenue  
FROM  
    pizza_types AS pt  
JOIN 
pizzas as p ON p.pizza_type_id = pt.pizza_type_id
JOIN
order_details AS o ON o.pizza_id = p.pizza_id  
GROUP BY pt.name  
ORDER BY Revenue DESC  
LIMIT 3;  

-------------------------------------ADVANCE--------------------------------------------

-- Calculate the percentage contribution of each pizza type to total revenue.  
SELECT pt.category,  
ROUND(SUM(o.quantity*p.price) / (SELECT  
    ROUND(SUM(o.quantity * p.price), 2) AS total_sales  
FROM 
order_details as o
        JOIN  
    pizzas AS p ON p.pizza_id = o.pizza_id)*100,2) as revenue  
FROM pizza_types pt 
JOIN pizzas AS p
ON pt.pizza_type_id = p.pizza_type_id  
JOIN order_details o
ON o.pizza_id = p.pizza_id  
GROUP BY pt.category ORDER BY  revenue DESC
LIMIT 1000;  

-- Analyze the cumulative revenue generated over time.  
SELECT order_date , SUM(revenue)
OVER (ORDER BY order_date) AS cumm_revenue  
FROM  
(SELECT o.order_date, SUM(od.quantity * p.price) AS revenue FROM order_details AS od JOIN pizzas AS p  
ON od.pizza_id = p.pizza_id  
JOIN orders as o
ON o.order_id = od.order_id  
GROUP BY o.order_date) AS order_sales;  

-- Determine the top 3 most ordered pizze types bused on revenue for each pizza category.  
SELECT name, revenue 
FROM
(SELECT category, name, revenue,  
RANK() OVER(PARTITION BY category ORDER BY revenue DESC) AS Ranks  
FROM  
(SELECT pt.category, pt.name,SUM(od.quantity * p.price) AS revenue FROM pizza_types AS pt JOIN pizzas AS p 
ON pt.pizza_type_id = p.pizza_type_id  
JOIN order_details AS od  
ON od.pizza_id = p.pizza_id  
GROUP BY pt.category, pt.name)AS pizza)as b  
where Ranks <=3;
