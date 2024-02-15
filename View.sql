SELECT *
FROM STORE;

--01.CREATE A VIEW AND DISPLAY WHICH STATE HAS MAXIMUM PUSRCHASE POWER
CREATE OR REPLACE VIEW STORE_VIEW1
AS
SELECT SHIP_STATE,SHIP_CITY,MAX(AMOUNT) AS MAXIMUM_AMOUNT 
FROM STORE
GROUP BY SHIP_STATE,SHIP_CITY
ORDER BY MAXIMUM_AMOUNT DESC;

SELECT *
FROM STORE_VIEW1;

CREATE USER STORE_CLIENT IDENTIFIED BY root;
GRANT CREATE SESSION TO STORE_CLIENT;
GRANT SELECT ON STORE_VIEW1 TO STORE_CLIENT;

--2.CREATE A VIEW TO DISPLAY WHICH AGE_GROUP HAVE PURCHASED A LOT
CREATE OR REPLACE VIEW STORE_VIEW2
AS
SELECT AGE_GROUP,SUM(AMOUNT) AS PURCHASE_POWER
FROM STORE
GROUP BY AGE_GROUP
ORDER BY PURCHASE_POWER DESC;

SELECT *
FROM STORE_VIEW2;
GRANT SELECT ON STORE_VIEW2 TO STORE_CLIENT;

--03.CREATE VIEW ON FOLLOWING ,GRANT ACCESS TO STORE_CLIENT
--   Get the total number of orders and the sum of amounts for each status:
CREATE OR REPLACE VIEW CHECK_STATUS_AMOUNT_VIEW
AS
SELECT STATUS,COUNT(ORDER_ID)AS TOTAL_COUNT,SUM(AMOUNT) AS TOTAL_SUM
FROM STORE
GROUP BY STATUS
ORDER BY TOTAL_SUM DESC;
GRANT SELECT ON CHECK_STATUS_AMOUNT_VIEW TO STORE_CLIENT;

--04.CREATE A VIEW 
--Find the average age of customers by gender:GRANT ACCESS TO STORE_CLIENT
CREATE OR REPLACE VIEW AVG_AGE_VIEW
AS
SELECT GENDER, TRUNC(AVG(AGE)) AS AVEGARGE_AGE
FROM STORE
GROUP BY GENDER;
GRANT SELECT ON AVG_AGE_VIEW TO STORE_CLIENT; 

--05-CREATE A VIEW TO FIND
--Total Sales by Month and Status:
CREATE OR REPLACE VIEW TOTAL_SALE_BY_MONTH_VIEW
AS
SELECT MONTH, STATUS,SUM(AMOUNT) AS TOTAL_SALE
FROM STORE
GROUP BY MONTH,STATUS
ORDER BY MONTH;
GRANT SELECT ON TOTAL_SALE_BY_MONTH_VIEW TO STORE_CLIENT;

--06.CREATE A VIEW TO IDENTIFY TOP SELLING PRODUCT IN STORE
CREATE OR REPLACE VIEW TOP_SELLING_PRODCT_VIEW
AS
SELECT CATEGORY, SUM(AMOUNT) AS TOTAL_AMOUNT
FROM STORE
GROUP BY CATEGORY
ORDER BY TOTAL_AMOUNT DESC;
GRANT SELECT ON TOP_SELLING_PRODCT_VIEW TO STORE_CLIENT;

--07.TOP PROFIT GENERATED FROM WHICH CITY
CREATE OR REPLACE VIEW TOP_PROFITABLE_CITIES_VIEW
AS
SELECT SHIP_CITY,SUM(AMOUNT)AS TOTAL_AMOUNT
FROM STORE
GROUP BY SHIP_CITY
ORDER BY TOTAL_AMOUNT DESC;

GRANT SELECT ON TOP_PROFITABLE_CITIES_VIEW TO STORE_CLIENT;


--08.CREATE A VIEW -
---Marketing Channel Analysis:
--Evaluate the performance of different marketing Media.
SELECT MEDIA, SUM(AMOUNT) AS TOTAL_AMOUNT
FROM STORE
GROUP BY MEDIA
ORDER BY TOTAL_AMOUNT DESC;

--09.CREATE A VIEW
--TO ANALYZE WHICH MONTH GOT HIGHEST SALE/PROFIT
CREATE OR REPLACE VIEW HIGHEST_MONTH_SALE_VIEW
AS
SELECT MONTH,SUM(AMOUNT) AS TOTAL_AMOUNT
FROM STORE
GROUP BY MONTH
ORDER BY TOTAL_AMOUNT DESC;
GRANT SELECT ON HIGHEST_MONTH_SALE_VIEW TO STORE_CLIENT;


--10.CREATE A VIEW TO IDENTIFY WHICH SHIP_CITY IS LEADING IN KURTA
CREATE OR REPLACE VIEW TOPTHREE_KURTA_CITY
AS
SELECT *FROM(
SELECT CATEGORY,SHIP_CITY,COUNT(*) AS TOTAL_COUNT
FROM STORE
WHERE UPPER(CATEGORY)='KURTA'
GROUP BY CATEGORY,SHIP_CITY
ORDER BY TOTAL_COUNT DESC
)WHERE ROWNUM<4;

GRANT SELECT ON TOPTHREE_KURTA_CITY TO STORE_CLIENT;


--11.CREATE A VIEW TO IDENTIFY 
--WHAT ITEM DOES MEN HAVE PURCHASED THE MOST?
CREATE OR REPLACE VIEW MEN_PRODUCT
AS
SELECT *FROM (
SELECT GENDER,CATEGORY,COUNT(*)AS TOTAL_COUNT
FROM STORE
WHERE UPPER(GENDER)='MEN'
GROUP BY GENDER,CATEGORY
ORDER BY TOTAL_COUNT DESC
)WHERE ROWNUM<=1;

GRANT SELECT ON MEN_PRODUCT TO STORE_CLIENT;


--CREATE A VIEW FOR,
--12.HOW MANY WOMEN TEENAGER HAVE PURCHASED  KURTA AND TOTAL REVENURE GENERATED
--FROM THAT
CREATE OR REPLACE VIEW KURTA_COUNT_REVENUE_VIEW
AS
SELECT CATEGORY,GENDER,AGE_GROUP,COUNT(*) AS CNT,SUM(AMOUNT) AS TOTAL_REVENUE
FROM STORE
WHERE 
UPPER(GENDER)='WOMEN' AND UPPER(AGE_GROUP)='TEENAGER' AND
UPPER(CATEGORY)='KURTA'
GROUP BY GENDER,AGE_GROUP,CATEGORY;

GRANT SELECT ON KURTA_COUNT_REVENUE_VIEW TO STORE_CLIENT;



--13.CREATE A VIEW ,AND IDENTIFY HOW MUCH REVENUE GENERATED FROM SET
--BETWEEN JAN TO MARCH
SELECT  MONTH,CATEGORY,SUM(AMOUNT) AS TOTAL_SUM_OF_SET
FROM STORE
WHERE UPPER(CATEGORY)='SET' AND 
MONTH IN ('Jan','Mar')
GROUP BY MONTH,CATEGORY;


--14.CREATE A VIEW 
--HOW MUCH KURTAS HAS DELIVERED BY AMAZON IN THE MONTH ON MARCH IN MUMBAI 
CREATE OR REPLACE VIEW MAHA_KURTA_AMAZON_VIEW
AS
SELECT SHIP_CITY,CATEGORY,MEDIA,MONTH,COUNT(*) AS TOTAL_NUMBER
FROM STORE
WHERE 
UPPER(CATEGORY)='KURTA' AND
UPPER(MONTH)='APR'
AND
UPPER(SHIP_STATE)='MAHARASHTRA' AND UPPER(MEDIA)='AMAZON'
GROUP BY SHIP_CITY,CATEGORY,MEDIA,MONTH;
GRANT SELECT ON MAHA_KURTA_AMAZON_VIEW TO STORE_CLIENT;


--15.CREATE A VIEW TO IDENTIFY 
--WHICH PRODUCT IS TOP 2 SELLING IN HARYANA
CREATE OR REPLACE VIEW HARYANA_TOP2_VIEW
AS
SELECT *FROM (
SELECT SHIP_STATE,CATEGORY,COUNT(*) AS CNT
FROM STORE
WHERE UPPER(SHIP_STATE)='HARYANA'
GROUP BY CATEGORY,SHIP_STATE
ORDER BY CNT DESC
)WHERE ROWNUM<3;
GRANT SELECT ON HARYANA_TOP2_VIEW TO STORE_CLIENT;


--15.CREATE A VIEW TO IDENTIFY 
--how much revenue generated by state haryana in category of set
CREATE OR REPLACE VIEW HARYANA_REVENUE_VIEW
AS
SELECT CATEGORY, SHIP_STATE,SUM(AMOUNT) AS REVENUE
FROM STORE
WHERE UPPER(CATEGORY)='SET' and UPPER(SHIP_STATE)='HARYANA'
GROUP BY CATEGORY, SHIP_STATE;

GRANT SELECT ON HARYANA_REVENUE_VIEW to store_client;