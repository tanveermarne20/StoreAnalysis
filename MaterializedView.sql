SELECT *
FROM STORE;

--01.CREATE A MATERIALIZED VIEW AND DISPLAY WHICH STATE HAS MAXIMUM PUSRCHASE POWER
CREATE  MATERIALIZED VIEW MV1_STORE
AS
SELECT 
SHIP_STATE,MAX(AMOUNT) AS MAXIMUM_AMOUNT
FROM STORE
GROUP BY SHIP_STATE
ORDER BY MAX(AMOUNT)DESC ;

SELECT *
FROM MV1_STORE;
GRANT SELECT ON mv1_store TO STORE_CLIENT;

--HOW TO REFRESH THE MATERIALIZED VIEW ,IF ANY CHANGES MADE IN QUERRY OR NEW DATA ADDED.
EXEC DBMS_MVIEW.REFRESH('MV1_STORE', 'C');

--TO CHECK THE MATERAILIZED VIEW STATUS REFRESH OR NOT
SELECT MVIEW_NAME, STALENESS
FROM USER_MVIEWS
WHERE MVIEW_NAME = 'MV1_STORE';




--============================================================================
--02.CREATE MATERIALIZED VIEW TO GET DETAILS 
--WHICH STATE  HAS GENERATED LOWEST PROFIT 
SELECT *
FROM STORE;

SELECT SHIP_STATE, SUM(AMOUNT) AS TOTAL_PROFIT
FROM STORE
GROUP BY SHIP_STATE
ORDER BY TOTAL_PROFIT ASC;



--============================================================================
--3.WHICH ITEMS IN MAHARASHTRA ARE TOP SELLING

CREATE MATERIALIZED VIEW MAHA_PRO_TOP_SELL
AS
SELECT SHIP_STATE,CATEGORY,COUNT(*) AS TOTAL_COUNT,SUM(AMOUNT) AS TOTAL_SUM
FROM STORE
WHERE UPPER(SHIP_STATE)='MAHARASHTRA'
GROUP BY CATEGORY,SHIP_STATE
ORDER BY TOTAL_COUNT DESC;

GRANT SELECT ON MAHA_PRO_TOP_SELL TO STORE_CLIENT;


--HOW TO REFRESH THE MATERIALIZED VIEW ,IF ANY CHANGES MADE IN QUERRY OR NEW DATA ADDED.
EXEC DBMS_MVIEW.REFRESH('MAHA_PRO_TOP_SELL', 'C');

--TO CHECK THE MATERAILIZED VIEW STATUS REFRESH OR NOT
SELECT MVIEW_NAME, STALENESS
FROM USER_MVIEWS
WHERE MVIEW_NAME = 'MAHA_PRO_TOP_SELL';


--HOW TO UPDATED MATERIALIZED VIEW


--4.CREATE A MATERIALIZED VIEW -How many items send in pune AND PROFIT GENERATED
CREATE MATERIALIZED VIEW PUNE_PROFIT
AS
SELECT CATEGORY,
 COUNT(*) AS TOTAL_CNT,
 SUM(QTY*AMOUNT) AS TOTAL_PROFIT
FROM STORE
WHERE SHIP_CITY='Pune'
GROUP BY CATEGORY
ORDER BY TOTAL_CNT DESC;
GRANT SELECT ON PUNE_PROFIT TO STORE_CLIENT;

--05.CREATE A MATERIALIZED VIEW TO IDENTIFY MUMBAI CITY IS GENERATING 
--HOW MUCH AMOUNT OF PROFIT FROM SET where status IS DELIVERED
SELECT
CATEGORY,STATUS,SHIP_CITY,
COUNT(*) AS CNT,
SUM(QTY*AMOUNT) AS TOTAL_MUM_PROFIT
FROM STORE
WHERE UPPER(CATEGORY)='SET' AND SHIP_CITY='Mumbai' AND STATUS='Delivered'
GROUP BY CATEGORY,STATUS,SHIP_CITY;



