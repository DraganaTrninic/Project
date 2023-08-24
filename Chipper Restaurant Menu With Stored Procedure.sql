/*
Here I create a database and table with fields that may resemble a small selection of meals at a resaturant. 
I then create stored procedures to show details of records stored in the tables. 
*/

--Part A: I create a database named Chipper.

CREATE DATABASE Chipper;


--Part B: I create a table named Meals with the following fields:

--Field Data Type
--id int
--name varchar(50)
--price money
--size varchar(50)

CREATE TABLE Meals (
ID int PRIMARY KEY,
[Name] varchar(50),
Price money,
Size varchar(50)
);


--Part C: I insert the following three records into the table.
--ID Name Price Size
--1 Garlic Bread 2.50 Large
--2 Cheese Burger 1.80 Large
--3 Small Fries 1.30 Small

INSERT INTO Meals (ID, [Name], Price, Size)
VALUES (1, 'Garlic Bread', 2.50, 'Large');

INSERT INTO Meals (ID, [Name], Price, Size)
VALUES (2, 'Cheese Burger', 1.80, 'Large');

INSERT INTO Meals (ID, [Name], Price, Size)
VALUES (3, 'Small Fries', 1.30, 'Small');

--Part D: I write a SQL statement, which creates a stored procedure that shows details of records stored in the Meals table and execute the stored procedure.

CREATE PROCEDURE Meals_Details
AS
SELECT * 
FROM Meals;

EXEC Meals_Details;


--Part E: I create another stored procedure that only displays details of meals of a certain size.
--The size of the meal is passed into the stored procedure.

CREATE PROCEDURE Meals_of_Certain_Sizes
@Size varchar(50)

AS

SELECT ID, [Name], Price, Size
FROM Meals
WHERE Size = @Size
RETURN;
 
--If the value ‘Large’ is passed to the stored procedure, only details of large-sized meals will be displayed.
--If however the value ‘Small’ is passed to the stored procedure, then only details of small-sized meals will be displayed.
