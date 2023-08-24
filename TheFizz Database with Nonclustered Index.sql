/*
I create a database for an imaginary company called theFizz in Microsoft SQL Server. 
Inside this database, I create a table called Employees and make changes to the table before inserting records. 
Finally, I write a SQL statement that displays all the records in the table.
*/

--Part A: I create a database called theFizz.

CREATE DATABASE theFizz;
 
--Part B: I create a table called Employees for the database with the following fields:
--Field Data Type
--ID (PK) int
--firstName varchar(70)
--lastName varchar(70)
--department varchar(30)
--hireDate date
--telephone varchar(15)
--email varchar(100)

CREATE TABLE Employees (
ID int PRIMARY KEY,
FirstName varchar(70),
LastName varchar(70),
Department varchar(30),
HireDate date,
Telephone varchar(15),
Email varchar(100)
);


--Part C: I make the following changes to the table.
--1) I include a field to store a PPS Number (PPS_No - varchar(10))

ALTER TABLE Employees
ADD PPS_No varchar(10);
 

--2) I ensure that the PPS_No field does have the not null constraint set. 

ALTER TABLE Employees
ALTER COLUMN PPS_No varchar(10) NOT NULL;
 

--3) I set a nonclustered index on the LastName field to speed up queries made on the table. 

CREATE NONCLUSTERED INDEX ndx_LastName 
ON Employees (LastName);
 

--Part D: I insert the following records into the table.
--1 Kevin Philips IT ‘2022/01/05’ 013456456 kphillips@thefizz.com 5345615S
--2 Jane Wilson HR ‘2022/01/02’ 013456632 jwilson@thefizz.com 9237119S

INSERT INTO Employees (ID, FirstName, LastName, Department, HireDate, Telephone, Email, PPS_No)
VALUES (1, 'Kevin', 'Philips', 'IT', '2022/01/05', '013456456', 'kphillips@thefizz.com', '5345615S');

INSERT INTO Employees (ID, FirstName, LastName, Department, HireDate, Telephone, Email, PPS_No)
VALUES (2, 'Jane', 'Wilson', 'HR', '2022/01/02', '013456632', 'jwilson@thefizz.com', '9237119S');
 

--Part E: I write a SQL statement that displays all records in the table.
SELECT* FROM Employees;
