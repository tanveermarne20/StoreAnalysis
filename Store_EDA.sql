--WRITE A QUERY TO TAKE BACKUP 
CREATE TABLE STORE_BKP
AS
SELECT *FROM STORE;

--WRITE A QUERRY TO COP THE STRUCTURE OF ONE TABLE TO ANOTHER TABLE
CREATE TABLE STORE_DDL_COPY
AS 
SELECT *FROM STORE
WHERE 1=2;

--WRITE A QUERRY TO FIND DUPLICATE RECORDS
SELECT CUST_ID,COUNT(*) AS CNT
FROM STORE
GROUP BY CUST_ID
ORDER BY CNT DESC;

