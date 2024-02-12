--1.IN THE GIVEN DATASET,WHO HAVE ORDERED THE PRODUCTS THE MOST
--MALE/FEMALE?
SELECT GENDER,COUNT(*) TOTAL_ORDERS
FROM STORE
GROUP BY GENDER;
--FROM THE ABOVE QUERRY WE CAN SEE THAT MOST OF THE BUYERS ARE FEMALE  


--2.WHO HAS THE MOST  PURCHASING POWER OF FEMALE OR MALE.
SELECT GENDER,SUM(AMOUNT) AS TOTAL_SUM
FROM STORE
GROUP BY GENDER;






--3.HOW MUCH ORDERS HAS GENERATED FROM ADULT,TEENAGER,SENIOR WOMEN 
SELECT GENDER,AGE_GROUP,COUNT(*) AS TOTAL_COUNT
FROM STORE
WHERE UPPER(GENDER)='WOMEN'
AND AGE_GROUP IN ('Adult', 'Teenager', 'Senior')
GROUP BY GENDER,AGE_GROUP
ORDER BY TOTAL_COUNT DESC;

--4.HOW MUCH ORDERS HAS GENERATED FROM ADULT,TEENAGER,SENIOR MEN
SELECT GENDER,AGE_GROUP,COUNT(*) AS TOTAL_COUNT
FROM STORE
WHERE UPPER(GENDER)='MEN'
AND AGE_GROUP IN ('Adult', 'Teenager', 'Senior')
GROUP BY GENDER,AGE_GROUP
ORDER BY TOTAL_COUNT DESC;

--COMBINING THESE TWO QUERRIES TO MAKE IT ON SINGLE QUERRY
--=================================================================================
--**************ans1
SELECT GENDER, AGE_GROUP, COUNT(*) AS TOTAL_COUNT
FROM STORE
WHERE UPPER(GENDER)='WOMEN'
AND AGE_GROUP IN ('Adult', 'Teenager', 'Senior')
GROUP BY GENDER, AGE_GROUP
UNION ALL
SELECT GENDER, AGE_GROUP, COUNT(*) AS TOTAL_COUNT
FROM STORE
WHERE UPPER(GENDER)='MEN'
AND AGE_GROUP IN ('Adult', 'Teenager', 'Senior')
GROUP BY GENDER, AGE_GROUP
ORDER BY  TOTAL_COUNT DESC;
--FROM THE ABOVE Querry its INDICATING THAT MOST OF THE BUYERS are Adult women



--SOMETHING ERROR
--4.HOW MUCH Profit HAS GENERATED FROM ADULT,TEENAGER,SENIOR WOMEN?
SELECT GENDER,AGE_GROUP, SUM(AMOUNT) AS TOTAL_SUM
FROM STORE
WHERE UPPER(GENDER)='WOMEN'
AND AGE_GROUP IN ('Adult', 'Teenager', 'Senior')
GROUP BY GENDER,AGE_GROUP
ORDER BY TOTAL_SUM DESC;


SELECT GENDER, AGE_GROUP, SUM(AMOUNT) AS TOTAL_COUNT
FROM STORE
WHERE UPPER(GENDER)='WOMEN'
AND AGE_GROUP IN ('Adult', 'Teenager', 'Senior')
GROUP BY GENDER, AGE_GROUP
UNION ALL
SELECT GENDER, AGE_GROUP, SUM(AMOUNT) AS TOTAL_COUNT
FROM STORE
WHERE UPPER(GENDER)='MEN'
AND AGE_GROUP IN ('Adult', 'Teenager', 'Senior')
GROUP BY GENDER, AGE_GROUP
ORDER BY  TOTAL_COUNT DESC;

SELECT GENDER,SUM(AMOUNT) AS TOTAL_REVENUE_GENERATED
FROM STORE
WHERE GENDER='Women'
GROUP BY GENDER
UNION ALL
SELECT GENDER,SUM(AMOUNT) AS TOTAL_REVENUE_GENERATED
FROM STORE
WHERE GENDER='Men'
GROUP BY GENDER;

--WHICH STATE HAS GENERATED HIGHEST AMOUNT OF PROFIT WHERE STATUS IS DELIVERED
--FIND TOP 4
SELECT *FROM (
SELECT SHIP_STATE ,Status,SUM(AMOUNT) AS STATE_PROFIT
FROM STORE
WHERE STATUS  IN ('Delivered')
GROUP BY SHIP_STATE,Status
ORDER BY STATE_PROFIT DESC
)WHERE ROWNUM<5;

SELECT *
FROM STORE;


--05.WHICH IS THE TOP SELLING PRODUCT
SELECT CATEGORY,SUM(AMOUNT) AS TO_SELLING
FROM STORE
GROUP BY CATEGORY
ORDER BY TO_SELLING DESC;

--WHICH MEDIA IS GENERATING MOST PROFIT TO THE COMPANY WHERE STATUS IS DELIVERED
SELECT MEDIA,SUM(AMOUNT) AS TOTAL_DELIVERED_PROFIT
FROM STORE
WHERE STATUS='Delivered'
GROUP BY MEDIA
ORDER BY TOTAL_DELIVERED_PROFIT DESC;

--WHICH PRODCT IS HIGHLY PURCHASED BY TEENAGERS BY AMAZON
SELECT MEDIA,AGE_GROUP,CATEGORY,COUNT(*) AS CNT
FROM STORE
WHERE AGE_GROUP ='Teenager' AND MEDIA='Amazon'
GROUP BY MEDIA,AGE_GROUP,CATEGORY
ORDER BY CNT DESC;