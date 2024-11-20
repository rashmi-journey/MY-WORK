use sql_retail_project;

-- create tables 
-- drop table if exists retail_sales ;
create table retail_sales(
transactions_id  int primary key,	
sale_date  date,
sale_time  time,
customer_id	 int,
gender varchar(15),
age int ,	
category varchar(15),
quantiy int ,
price_per_unit float,
cogs float ,
total_sale float
);

select *
from retail_sales


select  top 10 *
from retail_sales

select count(*)
from retail_sales


-- cleaning the data 

delete  
from retail_sales
where transactions_id is null
       or 
	   sale_date is null
	   or 
	   sale_time is null 
	   or
	   customer_id is null
	   or
	   gender is null 
	   or 
	   age is null 
	   or 
	   category is null 
	   or 
	   quantiy is null 
	   or 
	   price_per_unit is null 
	   or 
	   cogs is null 
	   or 
	   total_sale is null 

-- data Exploration (Data Investigation ) 

-- What is our sales volume?
select  
count(*) as total_sales 
from retail_sales

-- How many customers do we have?

select  
count(customer_id) as total_customer 
from retail_sales

-- How many unique_customers do we have?

select  
count(distinct customer_id) as unique_customer 
from retail_sales

select 
distinct category 
from retail_sales


-- data analysis and business analysis key problems and answers-- 



-- 1- write a sql query to retrieve all columns for sale made on '2022-11-05'

select *
from  retail_sales
where sale_date = '2022-11-05'

--2- write a SQL  query to retrieve all transactions where the category is 
--'Clothing ' and the quantity sold is more than 10 in the month of Nov-2022

SELECT *
FROM retail_sales
WHERE category = 'Clothing'
AND FORMAT(sale_date, 'yyyy-MM') = '2022-11'
AND quantiy >= 4;

-- 3- write a SQL query to calculate the total sales (total sale) for 
-- each category

  SELECT 
    category,
    SUM(total_sale) AS total_sales,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;

-- 4 - write a SQL query to find the average age of customers who purchase the
-- items from the 'beauty'category

select 
avg(age) as avg_age 
from retail_sales
where category ='beauty'

--5-Create a SQL query to identify any transaction in
-- which the total sale exceeds 1000.

select * from retail_sales
where  total_sale> 1000

--6 write a SQL query to find the total number of transactions (transaction_id)
-- made by each gender in each category.

 select category,
 gender,
 count(*) AS 'total_trans'
 from retail_sales
 group by category, gender
 order by category
 
 -- 7- write a SQL query to calculate the average sale for each month.Find 
 -- out best selling month in each year

 
WITH aggregated_sales AS (
    SELECT 
        YEAR(sale_date) AS year,
        MONTH(sale_date) AS month,
        AVG(total_sale) AS avg_sale
    FROM 
        retail_sales
    GROUP BY 
        YEAR(sale_date), MONTH(sale_date)
)
SELECT 
    year,
    month,
    avg_sale,
    RANK() OVER (PARTITION BY year ORDER BY avg_sale DESC) AS rank
FROM 
    aggregated_sales
	
  -- ORDER BY 
   -- year, avg_sale DESC;

-- 8- write a SQL query to find the top  5 customers  based  on the 
-- highest  total sales .

select  top 5
customer_id,
sum(total_sale) as total_sales 
from  retail_sales
group by customer_id
order by total_sales desc

-- 9 - write a SQL  query to find the number of unique customers who purchased 
-- items from each category .

select 
category,
count(distinct customer_id) as 'unique customer '
from retail_sales
group by category

-- 10- write a SQL query to create each shift and number of orders 
-- (Example Morning  <=12,Afternoon Between 12 & 17,Evening >17)

;WITH hourly_sale AS (
    SELECT *,
           CASE
               WHEN DATEPART(HOUR, sale_time) < 12 THEN 'MORNING'
               WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'AFTERNOON'
               ELSE 'EVENING'
           END AS shift
    FROM retail_sales
)
SELECT shift,
       COUNT(*) AS total_orders
FROM hourly_sale
GROUP BY shift;

-----END-----	   