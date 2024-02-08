--Descriptive Statistics:
--1.What is the average order amount in the dataset?
SELECT AVG(AMOUNT) AS AVARAGE_ORDER_AMOUNT
FROM STORE;


--2.Can you provide a summary of the distribution of the 'AGE' variable?
SELECT MIN(AGE)AS MIN_AGE, 
TRUNC(AVG(AGE)) AS AVG,
MAX(AGE) AS MAX_AGE ,
MEDIAN(AGE)AS MEDIAN_AGE
FROM STORE;


--3.What is the most common 'STATUS' in the dataset?
SELECT *FROM(
SELECT STATUS,COUNT(*)AS CNT
FROM STORE
GROUP BY STATUS
ORDER BY CNT DESC
)WHERE ROWNUM<=1;

--4.How many unique customers are there in the dataset?
SELECT *
FROM STORE;
--5.What is the average age for each age group?
SELECT AGE_GROUP,TRUNC(AVG(AGE))
FROM STORE
GROUP BY AGE_GROUP;
--6.What is the distribution of order statuses for each category?



--7.Can you identify any patterns in the quantity ordered based on the month?



--8.What is the average order amount for each state in the dataset?



--9.How does the average order amount vary for different countries?



--10.Is there a correlation between the age of customers and the quantity ordered?