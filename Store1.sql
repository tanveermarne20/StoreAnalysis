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


SELECT *
FROM STORE;



---HIIII, I AM KIRAN HERE