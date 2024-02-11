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






--3.HOW MUCH ORDERS HAS GENERATED FROM ADULT,TEENAGER,SENIOR WOMEN AND MEN
SELECT GENDER,AGE_GROUP,COUNT(*) AS TOTAL_COUNT
FROM STORE
WHERE UPPER(GENDER)='WOMEN'
AND AGE_GROUP IN ('Adult', 'Teenager', 'Senior')
GROUP BY GENDER,AGE_GROUP
ORDER BY TOTAL_COUNT DESC;


SELECT GENDER,AGE_GROUP,COUNT(*) AS TOTAL_COUNT
FROM STORE
WHERE UPPER(GENDER)='MEN'
AND AGE_GROUP IN ('Adult', 'Teenager', 'Senior')
GROUP BY GENDER,AGE_GROUP
ORDER BY TOTAL_COUNT DESC;

--SEE THERE ARE TWO QUERRIES WRITTEN ABOVE RIGHT,
--COMBINE THESE TWO QUERRIES TO MAKE IT ON SINGLE QUERRY
--=================================================================================























--FROM THE ABOVE Querry its INDICATING THAT MOST OF THE BUYERS 
--ARE FROM AGE_GROUP ADULT WOMEN




--SOMETHIN ERROR
--4.HOW MUCH Profit HAS GENERATED FROM ADULT,TEENAGER,SENIOR WOMEN?
SELECT GENDER,AGE_GROUP,SUM(AMOUNT) AS REVENUE
FROM STORE
WHERE GENDER='Women'
GROUP BY GENDER,AGE_GROUP
ORDER BY REVENUE DESC;

SELECT AGE_GROUP,
       SUM(AMOUNT) AS REVENUE
FROM STORE
WHERE GENDER = 'Women'
  AND AGE_GROUP IN ('Adult', 'Teenager', 'Senior')
GROUP BY AGE_GROUP
ORDER BY REVENUE DESC;
