/*
Here I create a database for a travel agency that sells sunshine holidays / package holidays. The
management of the company ‘Sunshine Holidays’ are interested in reviewing the sales
performance of their sales team. To keep this database simple, I created one table called
Sales with records shown below. I specify appropriate data types for the fields in the table.
*/

CREATE DATABASE Sunshine_Holidays;


CREATE TABLE Sales(
  ID int PRIMARY KEY,
  Destination varchar(50), 
  Price money,
  Date_of_Sale date, 
  Sales_Agent_FN varchar(50), 
  Sales_Agent_LN varchar(50)
  );


--Sales
--ID (PK) Destination Price Date of Sale Sales Agent FN Sales Agent LN
--1 Majorca 550 01/01/2022 Brendan Walsh
--2 Corfu 650 01/01/2022 Sally Field
--3 Nice 500 05/01/2022 Frank Walters
--4 Ibiza 700 07/01/2022 Sally Field
--5 Torremolinos 650 10/01/2022 Frank Walters
--6 Corfu 650 12/01/2022 Frank Walters
--7 Lanzarote 600 14/01/2022 Ryan Smith
--8 Corfu 500 15/01/2022 Sally Field
--9 Palermo 600 16/01/2022 Frank Walters
--10 Majorca 550 17/01/2022 Ryan Smith
--11 Corfu 650 17/01/2022 Frank Walters
--12 Corfu 650 17/02/2022 Frank Walters

INSERT INTO Sales (ID, Destination, Price, Date_of_Sale, Sales_Agent_FN, Sales_Agent_LN)
VALUES (1, 'Majorca', 550, '01/01/2022', 'Brendan', 'Walsh')

INSERT INTO Sales (ID, Destination, Price, Date_of_Sale, Sales_Agent_FN, Sales_Agent_LN)
VALUES (2, 'Corfu', 650, '01/01/2022', 'Sally', 'Field')

INSERT INTO Sales (ID, Destination, Price, Date_of_Sale, Sales_Agent_FN, Sales_Agent_LN)
VALUES (3, 'Nice', 500, '01/05/2022', 'Frank', 'Walters')

INSERT INTO Sales (ID, Destination, Price, Date_of_Sale, Sales_Agent_FN, Sales_Agent_LN)
VALUES (4, 'Ibiza', 700, '01/07/2022', 'Sally', 'Field')

INSERT INTO Sales (ID, Destination, Price, Date_of_Sale, Sales_Agent_FN, Sales_Agent_LN)
VALUES (5, 'Torremolinos', 650, '01/10/2022', 'Frank', 'Walters')

INSERT INTO Sales (ID, Destination, Price, Date_of_Sale, Sales_Agent_FN, Sales_Agent_LN)
VALUES (6, 'Corfu', 650, '01/12/2022', 'Frank', 'Walters')

INSERT INTO Sales (ID, Destination, Price, Date_of_Sale, Sales_Agent_FN, Sales_Agent_LN)
VALUES (7, 'Lanzarote', 600, '01/14/2022', 'Ryan', 'Smith')

INSERT INTO Sales (ID, Destination, Price, Date_of_Sale, Sales_Agent_FN, Sales_Agent_LN)
VALUES (8, 'Corfu', 500, '01/15/2022', 'Sally', 'Field')

INSERT INTO Sales (ID, Destination, Price, Date_of_Sale, Sales_Agent_FN, Sales_Agent_LN)
VALUES (9, 'Palermo', 600, '01/16/2022', 'Frank', 'Walters')

INSERT INTO Sales (ID, Destination, Price, Date_of_Sale, Sales_Agent_FN, Sales_Agent_LN)
VALUES (10, 'Majorca', 550, '01/17/2022', 'Ryan', 'Smith')

INSERT INTO Sales (ID, Destination, Price, Date_of_Sale, Sales_Agent_FN, Sales_Agent_LN)
VALUES (11, 'Corfu', 650, '01/17/2022', 'Frank', 'Walters')

INSERT INTO Sales (ID, Destination, Price, Date_of_Sale, Sales_Agent_FN, Sales_Agent_LN)
VALUES (12, 'Corfu', 650, '02/17/2022', 'Frank', 'Walters')


--Part A: Management wants to know the total of all sales made by each member of the sales team. 
  --I write a T-SQL statement that displays the aggregate sales made by each member of the sales team.

SELECT
  Sales_Agent_FN,
  Sales_Agent_LN,
  SUM(Price) AS 'Aggregate Sales'

FROM Sales
GROUP BY Sales_Agent_FN, Sales_Agent_LN;


--Part B: Management wants to know the average of all sales made by each member of the sales team. 
--I write a T-SQL statement that displays the average sales figure for each member of the sales team. I make it into a string so that it makes sense as a monetary value. 

SELECT
  Sales_Agent_FN,
  Sales_Agent_LN,
  STR(AVG(Price),8,2) AS 'Average Sales'

FROM Sales
GROUP BY Sales_Agent_FN, Sales_Agent_LN;


--Part C: Management wants to know how many holidays each member of the sales staff sold. 
--I write a T-SQL statement that displays the number of holidays sold by each member of the sales team.

SELECT
  Sales_Agent_FN,
  Sales_Agent_LN,
  COUNT(ID) AS 'Number of Holidays Sold'

FROM Sales
GROUP BY Sales_Agent_FN, Sales_Agent_LN;
 

--Part D: Management wants to know the most expensive holiday sold by each member of the sales team. 
--I write a T-SQL statement that displays the most expensive holiday sold by each member of the sales team.

SELECT
  Sales_Agent_FN,
  Sales_Agent_LN,
  MAX(Price) AS 'Most Expensive Holiday Sold'

FROM Sales
GROUP BY Sales_Agent_FN, Sales_Agent_LN;


--Part E: Management wants to know the cheapest holiday sold by each member of the sales team. 
--I write a T-SQL statement that displays the cheapest holiday sold by each member of the sales team.

SELECT
  Sales_Agent_FN,
  Sales_Agent_LN,
  MIN(Price) AS 'Cheapest Holiday Sold'

FROM Sales
GROUP BY Sales_Agent_FN, Sales_Agent_LN;


--Part F: Management wants to know the sales total for sales agents who sold at lesat 1000 worth of holidays in total. 
--I write a T-SQL statement that displays sales totals for sales agents – but only for those with sales totals greater than or equal to 1000.

SELECT
  Sales_Agent_FN,
  Sales_Agent_LN,
  SUM(Price) AS 'Sales Totals'

FROM Sales
  GROUP BY Sales_Agent_FN, Sales_Agent_LN
  HAVING SUM(Price) >= 1000;
 

--Part G: Management wants to know the sales totals of sales agents Sally, Frank and Ryan. 
--I write a T-SQL statement that displays sales totals for these sales agents.

SELECT
  Sales_Agent_FN,
  Sales_Agent_LN,
  SUM(Price) AS 'Sales Totals'

FROM Sales
  WHERE Sales_Agent_FN IN ('Sally', 'Frank', 'Ryan')
  GROUP BY Sales_Agent_FN, Sales_Agent_LN;


--Part H: Management wants to know who on the sales team has an average sales amount greater than or equal to 600. 
--I write a T-SQL statement that lists members of the sales team that meet this criteria. I turn the price into a string so that it makes sense as a monetary value.

SELECT
  Sales_Agent_FN,
  Sales_Agent_LN,
  STR(AVG(Price),8,2) AS 'Average Sales'

FROM Sales
  GROUP BY Sales_Agent_FN, Sales_Agent_LN
  HAVING STR(AVG(Price),8,2) >= 600.00
 

--Part I: Management wants to know which members of the sales team have had at least three sales transactions. 
--I write a T-SQL statement that lists members of the sales team who have had three or more sales transactions.

SELECT
  Sales_Agent_FN,
  Sales_Agent_LN,
  COUNT(ID) AS 'Sales Transactions'

FROM Sales
  GROUP BY Sales_Agent_FN, Sales_Agent_LN
  HAVING COUNT(ID) >= 3;


--Part J: Management wants to know which sales team members have sold at least two holidays in Corfu. 
--I write a T-SQL statement that lists members of the sales team who have sold two or more holidays in Corfu.

SELECT
  Sales_Agent_FN,
  Sales_Agent_LN,
  COUNT(ID) AS 'Holidays Sold - Corfu'

FROM Sales
  WHERE Destination = 'Corfu'
  GROUP BY Sales_Agent_FN, Sales_Agent_LN
  HAVING COUNT(ID) >= 2;


--Part K: Management wants to know the sum of sales totals for each sales agent from and including the 7th until the 15th of January 2022. 
--I write a T-SQL statement that shows the aggregate sales totals for each sales agent, from 07/01/2022 (inclusive) to 15/01/2022 (inclusive).

SELECT
  Sales_Agent_FN,
  Sales_Agent_LN,
  SUM(Price) AS 'Aggregate Sales Totals'

FROM Sales
  WHERE Date_of_Sale BETWEEN '01/07/2022' AND '01/15/2022'
  GROUP BY Sales_Agent_FN, Sales_Agent_LN;


--Part L: Management wants to know the aggregate sales totals for Salley Field from and including the 7th until the 15th of January 2022. 
--I write a T-SQL statement that shows the aggregate sales totals for the sales agent, Sally Field from 07/01/2022 (inclusive) to 15/01/2022 (inclusive).

SELECT
  Sales_Agent_FN,
  Sales_Agent_LN,
  SUM(Price) AS 'Aggregate Sales Totals'

FROM Sales
WHERE Date_of_Sale BETWEEN '01/07/2022' AND '01/15/2022' AND
	  Sales_Agent_FN = 'Sally' AND
	  Sales_Agent_LN = 'Field'
GROUP BY Sales_Agent_FN, Sales_Agent_LN;
