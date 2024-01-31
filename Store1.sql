----------------Exploratory Data Analysis-------------------------------------
--Generic Questions

--1.Display distinct age_group.
select distinct(age_group)
from store;

--2.Display distinct category 
select distinct(category) from store;


--3.Display customers who have purchased Kurta
select cust_id,category from store
where upper(category)='KURTA';


--4.Display details of  Teenagers  from karnataka.
select * from store where lower(age_group)='teenager';





--5.Find category that has been shiped to New Delhi
select category,ship_city
from store where lower(ship_city)='new delhi';


--6.Show total number of columns  in Store table
SELECT COUNT(*) AS total_columns
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME = 'STORE';


--7.How many orders have a status of 'Pending'?



--8.Which media type is the most common for orders?



--9.What category has the highest average order amount?



--10.What is the total quantity of items ordered across all transactions?



--11.Which currency is most commonly used in the dataset?



--12.How many orders have a ship country of 'United States'?



--13.What is the average age of customers for each category?



--Descriptive Statistics:
--1.What is the average order amount in the dataset?


--2.Can you provide a summary of the distribution of the 'AGE' variable?



--3.What is the most common 'STATUS' in the dataset?



--
--Temporal Analysis:

--1.How does the number of orders vary across different months?



--2.Is there any noticeable trend or seasonality in the order dates?



--3.What is the average order amount for each month?





--
--Categorical Analysis:
--1.What are the top 5 most frequently ordered 'CATEGORY' items?


--2.Is there a significant difference in the average order amount between different 'MEDIA' sources?



--3.Can you identify the most common 'SIZE_ORDERED'?