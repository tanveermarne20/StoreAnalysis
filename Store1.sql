----------------Exploratory Data Analysis-------------------------------------
--Generic Questions
SELECT *FROM STORE;
--1.Display distinct age_group.
SELECT DISTINCT (AGE_GROUP)
FROM STORE;

--2.Display distinct category 
SELECT DISTINCT (CATEGORY)
FROM STORE;


--3.Display customers who have purchased Kurta
SELECT CUST_ID,CATEGORY
FROM STORE
WHERE UPPER(CATEGORY)='KURTA';

--4.Display details of  Teenagers  from karnataka.
select * from store where lower(age_group)='teenager';

SELECT *
FROM STORE
WHERE UPPER(SHIP_STATE)='KARNATAKA'
AND LOWER(AGE_GROUP)='teenager';





--5.Find category that has been shiped to New Delhi
select category,ship_city
from store where lower(ship_city)='new delhi';


--6.Show total number of columns  in Store table
SELECT COUNT(*) AS total_columns
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME = 'STORE';


--7.How many orders have a status of 'Pending'?
SELECT COUNT(STATUS)
FROM STORE
WHERE UPPER(STATUS)='PENDING';

SELECT * FROM STORE;


--8.Which media type is the most common for orders?
SELECT MEDIA ,COUNT(ORDER_NUMBER) AS MOST_COMMON
FROM STORE
GROUP BY MEDIA
ORDER BY COUNT(ORDER_NUMBER) DESC;



--9.What category has the highest average order amount?
SELECT CATEGORY,ROUND(AVG(AMOUNT),3) AS AVERAGE_ORDER_AMOUNT
FROM STORE
GROUP BY CATEGORY
ORDER BY AVERAGE_ORDER_AMOUNT DESC;

--10.What is the total quantity of items ordered across all transactions?
SELECT SUM(QTY) AS TOTAL_QUANTITY
FROM STORE;





--11.Which currency is most commonly used in the dataset?
--ANS1
SELECT MAX(CURRENCY) AS MAX_CURRENCY
FROM STORE;
--ANS2
SELECT CURRENCY, COUNT(*) AS CURRENCY_COUNT
FROM STORE
GROUP BY CURRENCY
ORDER BY CURRENCY_COUNT DESC;


--12.How many orders have a ship country of 'United States'?
SELECT COUNT(SHIP_COUNTRY) AS COUNT_ORDERS  FROM STORE 
WHERE SHIP_COUNTRY  
NOT IN 'IN';

SELECT COUNT(SHIP_COUNTRY)AS COUNT_ORDERS FROM STORE 
WHERE SHIP_COUNTRY  
 IN 'US';

--13.What is the average age of customers for each category?
SELECT CATEGORY ,TRUNC(AVG(AGE)) AS CATEGORY_WISE_AGE FROM STORE
GROUP BY CATEGORY ;


--Descriptive Statistics:
--1.What is the average order amount in the dataset?
SELECT AVG(AMOUNT)AS AVARAGE_ORDER_AMOUNT FROM STORE;

--2.Can you provide a summary of the distribution of the 'AGE' variable?
SELECT MIN(AGE)AS MIN_AGE, TRUNC(AVG(AGE)) AS AVG,MAX(AGE) AS MAX_AGE ,MEDIAN(AGE)AS MEDIAN_AGE
FROM STORE;


--3.What is the most common 'STATUS' in the dataset?
SELECT STATUS ,COUNT(*) AS COMMON_STATUS
FROM STORE 
GROUP BY STATUS;



--Temporal Analysis:

--1.How does the number of orders vary across different months?
SELECT TO_CHAR(ORDER_DATE,'MM') AS MONTH,
COUNT(*) AS ORDER_COUNT
FROM STORE
GROUP BY  TO_CHAR(ORDER_DATE,'MM')
ORDER BY MONTH;




--2.Is there any noticeable trend or seasonality in the order dates?

SELECT TO_CHAR(ORDER_DATE,'MM')AS MONTH,TO_CHAR(ORDER_DATE,'YYYY')AS YEAR,COUNT(ORDER_DATE)AS COUNT_OF_DATES
FROM STORE
GROUP BY TO_CHAR(ORDER_DATE,'MM'),TO_CHAR(ORDER_DATE,'YYYY')
ORDER BY MONTH;


--3.What is the average order amount for each month?
SELECT TO_CHAR(ORDER_DATE,'MM') AS MONTH ,ROUND(AVG(AMOUNT),3) AS AVG_AMOUNT
FROM STORE 
GROUP BY TO_CHAR(ORDER_DATE,'MM')
ORDER BY MONTH;




--
--Categorical Analysis:
--1.What are the top 5 most frequently ordered 'CATEGORY' items?
SELECT CATEGORY, ORDER_COUNT
FROM (
SELECT
CATEGORY,COUNT(*) AS ORDER_COUNT,
DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS RNK
FROM STORE
GROUP BY CATEGORY) 
WHERE RNK <= 5;


--2.Is there a significant difference in the average order amount between different 'MEDIA' sources?
SELECT MEDIA,AVG(AMOUNT)
FROM STORE
GROUP BY MEDIA;


--3.Can you identify the most common 'SIZE_ORDERED'?
SELECT SIZE_ORDERED, COUNT(*) AS SIZE_COUNT
FROM STORE
GROUP BY SIZE_ORDERED
ORDER BY SIZE_ORDERED DESC;



