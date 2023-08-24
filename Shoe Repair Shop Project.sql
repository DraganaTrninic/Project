--I create a database for a small shoe repair shop. The manager is interested to see data about how the business is doing.

--Part A: I create a database named City_Shoe_Repairs

CREATE DATABASE City_Shoe_Repairs;
 

--Part B: I create a table named Shoe_Repairs, choosing appropriate data types for the fields.

--Shoe_Repairs
--ID (PK), Item, Price, Repair Date, Staff Member First Name, Staff Member Last Name

CREATE TABLE Shoe_Repairs (
  ID int PRIMARY KEY,
  Item varchar (50),
  Price money, 
  [Repair Date] date, 
  [Staff Member First Name] varchar (50),
  [Staff Member Last Name] varchar (50)
  );
 

--I insert the following records into the table
--Shoe_Repairs
--ID (PK), Item, Price, Repair Date, Staff Member First Name, Staff Member Last Name
--1 Dress Shoe 80 01/01/2022 Jenny Wilson
--2 Athletic Shoe 25 01/01/2022 Adam Smith
--3 Dress Shoe 80 10/01/2022 Frank Murphy
--4 Sandals 35 12/02/2022 Jenny Wilson
--5 Casual Shoe 50 14/02/2022 Franklin Davis
--6 Dress Shoe 80 16/02/2022 Frank Murphy
--7 Casual Shoe 50 16/02/2022 Adam Smith
--8 Casual Shoe 50 16/02/2022 Jenny Wilson
--9 Sandals 35 18/02/2022 Jenny Wilson
--10 Casual Shoe 50 22/02/2022 Frank Murphy

INSERT INTO Shoe_Repairs (ID, Item, Price, [Repair Date], [Staff Member First Name], [Staff Member Last Name])
VALUES (1, 'Dress Shoe', 80, '01/01/2022', 'Jenny', 'Wilson')

INSERT INTO Shoe_Repairs (ID, Item, Price, [Repair Date], [Staff Member First Name], [Staff Member Last Name])
VALUES (2, 'Athletic Shoe', 25, '01/01/2022', 'Adam', 'Smith')

INSERT INTO Shoe_Repairs (ID, Item, Price, [Repair Date], [Staff Member First Name], [Staff Member Last Name])
VALUES (3, 'Dress Shoe', 80, '01/10/2022', 'Frank', 'Murphy')

INSERT INTO Shoe_Repairs (ID, Item, Price, [Repair Date], [Staff Member First Name], [Staff Member Last Name])
VALUES (4, 'Sandals', 35, '02/12/2022', 'Jenny', 'Wilson')

INSERT INTO Shoe_Repairs (ID, Item, Price, [Repair Date], [Staff Member First Name], [Staff Member Last Name])
VALUES (5, 'Casual Shoe', 50, '02/14/2022', 'Franklin', 'Davis')

INSERT INTO Shoe_Repairs (ID, Item, Price, [Repair Date], [Staff Member First Name], [Staff Member Last Name])
VALUES (6, 'Dress Shoe', 80, '02/16/2022', 'Frank', 'Murphy')

INSERT INTO Shoe_Repairs (ID, Item, Price, [Repair Date], [Staff Member First Name], [Staff Member Last Name])
VALUES (7, 'Casual Shoe', 50, '02/16/2022', 'Adam', 'Smith')

INSERT INTO Shoe_Repairs (ID, Item, Price, [Repair Date], [Staff Member First Name], [Staff Member Last Name])
VALUES (8, 'Casual Shoe', 50, '02/16/2022', 'Jenny', 'Wilson')

INSERT INTO Shoe_Repairs (ID, Item, Price, [Repair Date], [Staff Member First Name], [Staff Member Last Name])
VALUES (9, 'Sandals', 35, '02/18/2022', 'Jenny', 'Wilson')

INSERT INTO Shoe_Repairs (ID, Item, Price, [Repair Date], [Staff Member First Name], [Staff Member Last Name])
VALUES (10, 'Casual Shoe', 50, '02/22/2022', 'Frank', 'Murphy')

 
--Part C: I write a T-SQL statement that displays all records in the Shoe_Repairs table, sorted first by the Repair Date field and then by the Staff Member last name field.

SELECT* 
FROM Shoe_Repairs
ORDER BY [Repair Date], [Staff Member Last Name];


--Part D: The manager wants to see all information on staff with the first name Jenny. I write a T-SQL statement that displays records in the Shoe_Repairs table, 
--where the value for Staff Member first name is ‘Jenny’ (four records are displayed).

SELECT*
FROM Shoe_Repairs
WHERE [Staff Member First Name] = 'Jenny';
 

--Part E: The manager wants to see all information on staff with the first name starting with 'Frank'. 
--I write a T-SQL statement that displays records in the Shoe_Repairs table, where the value for Staff Member first name starts with Frank (four records are displayed).

SELECT*
FROM Shoe_Repairs
WHERE [Staff Member First Name] LIKE 'Frank%';
 
 
--Part F: The manager wants to know all information available about sales made between and including 1 January 2022 and 16 February 2022. 
--I write a T-SQL statement that displays records in the Shoe_Repairs table, where the Repair Date is between 01/01/2022 and 16/02/2022 (inclusive) (eight records are displayed).

SELECT*
FROM Shoe_Repairs
WHERE [Repair Date] BETWEEN '01/01/2022' AND '02/16/2022';


--Part G: The manager wants all available information about sales made by staff with the first name Franklin and staff with the first name Adam. 
--I write a T-SQL statement that displays records in the Shoe_Repairs table, where the value for Staff Member first name is ‘Franklin’ or ‘Adam’ (three records are displayed).

SELECT*
FROM Shoe_Repairs
WHERE [Staff Member First Name] = 'Franklin' OR [Staff Member First Name] = 'Adam';
 

--Part H: The manager wants to know instances in which Jenny has sold a dress shoe. 
--I write a T-SQL statement that displays records in the Shoe_Repairs table, where the value for Item is ‘Dress Shoe’ and the value for Staff Member first name is ‘Jenny’ (one record is returned).

SELECT*
FROM Shoe_Repairs
WHERE Item = 'Dress Shoe' AND [Staff Member First Name] = 'Jenny';


--Part I: The manager wants to see all information for all items except sandals. 
--I write a T-SQL statement that displays records in the Shoe_Repairs table, except where the value for Item is ‘Sandals’(eight records are displayed).

SELECT*
FROM Shoe_Repairs
WHERE NOT Item = 'Sandals';
 

--Part J: The manager wants to see all information for the first five items in the table. I write a T-SQL statement that displays ‘the top 5 records’ from the Shoe_Repairs table.

SELECT TOP 5
  [ID],
  [Item],
  [Price],
  [Repair Date],
  [Staff Member First Name],
  [Staff Member Last Name]

FROM Shoe_Repairs;


--Part K: The manager wants to look at the records for Franklin and Adam. 
--I write a T-SQL statement that displays records in the Shoe_Repairs table where the Staff Member first name is either Franklin or Adam (three records are returned)

SELECT*
FROM Shoe_Repairs
WHERE [Staff Member First Name] IN ('Franklin', 'Adam');


--Part L: The manager wants information for items priced from and including 35.00 up to but not including 50.00. 
--I write a T-SQL statement that displays records in the Shoe_Repairs table where the Price field has a value of between 35 (inclusive) and 50 (exclusive) (two records are returned).

SELECT*
FROM Shoe_Repairs
WHERE Price >= 35 AND Price < 50;
 

--Part M: The manager wants to know the total of all sales by Jenny. I write a T-SQL statement, which displays the sum of Jenny’s shoe repairs sales. The result is Jenny 200.

SELECT 
  [Staff Member First Name],
  SUM(Price) AS 'Sum of Sales'

FROM Shoe_Repairs
  WHERE [Staff Member First Name] = 'Jenny'
  GROUP BY [Staff Member First Name];
   

--Part N: The manager wants to know which staff members (first names only) have made sales greater than 80.00. 
--I write a T-SQL statement, which displays the first names of Staff Members who have aggregate shoe repair sales greater than 80. Two records are returned (Frank (210) and Jenny (200)).

SELECT 
  [Staff Member First Name],
  SUM(Price) AS 'Sum of Sales'

FROM Shoe_Repairs
 
GROUP BY [Staff Member First Name]
HAVING SUM(Price) > 80;


--Part O: The manager wants to know the individual top sale made by each staff member (first name only). 
--I write a T-SQL statement to display the maximum sale made by each member of the sales team.

SELECT 
  [Staff Member First Name],
  MAX (Price) AS 'Maximum Sale Made'

FROM Shoe_Repairs
 
GROUP BY [Staff Member First Name];


--Part P: The manager wants to know how many sales were made by each member of his sales team (first name only). 
--I write a T-SQL statement, which displays the number of sales transactions made by each member of the sales team. 
--Displaying the first name of the sales team member and the number of transactions that they have had.

SELECT 
  [Staff Member First Name],
  COUNT(ID) AS 'Number of Transactions'

FROM Shoe_Repairs
 
GROUP BY [Staff Member First Name];
 

--Part Q: The manager wants to know the price of the average sale for each staff member (first and last name) in February. 
--I write a T-SQL statement, which displays the average (aggregate) amount of shoe repair sales for each Staff Member in the month of February. 
--Displaying the first and last names of the staff members along with the result.

SELECT 
  [Staff Member First Name],
  [Staff Member Last Name],
  AVG (Price) AS 'Average Amount of Shoe Repair Sales'

FROM Shoe_Repairs
  WHERE [Repair Date] BETWEEN '02/01/2022' AND '02/28/2022'
  GROUP BY [Staff Member First Name], [Staff Member Last Name];
 

--Part R: The manager wants to know which staff members (first and last name) sold more than 80.00 worth of items in the month of February. 
--I write a T-SQL statement, which displays the sum of shoe repair sales made by Staff Members in February. I only display results where the aggregate values are greater than 80 (two records are returned).

SELECT 
  [Staff Member First Name],
  [Staff Member Last Name],
  SUM (Price) AS 'Sum of Shoe Repair Sales in February'

FROM Shoe_Repairs
  WHERE [Repair Date] BETWEEN '02/01/2022' AND '02/28/2022'
  GROUP BY [Staff Member First Name], [Staff Member Last Name]
  HAVING SUM (Price) > 80;
