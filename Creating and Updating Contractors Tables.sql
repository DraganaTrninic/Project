/*
Here I create a database named Quality_Software in Microsoft SQL Server. 
Inside this database, I create a table for Customers and a table for Contractors, 
insert records into the the two tables, and update and delete specific records.
*/

--Part A: Creating a database named Quality_Software
CREATE DATABASE Quality_Software; 


--Part B: Creating a Customers table and a Conractors table.

CREATE TABLE Customers (
	CustomerId int NOT NULL PRIMARY KEY,
	CompanyName varchar(50) NOT NULL,
	Address1 varchar(50) NOT NULL,
	Address2 varchar(50) NOT NULL,
	City varchar(50) NOT NULL,
	Country varchar(50) NOT NULL,
	ContactName varchar(50) NOT NULL,
	ContactEmail varchar(50) NOT NULL
);


CREATE TABLE Contractors (
	ContractorId int NOT NULL PRIMARY KEY,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	Address1 varchar(50) NOT NULL,
	Address2 varchar(50) NOT NULL,
	City varchar(50) NOT NULL,
	Country varchar(50) NOT NULL,
	ContactPhone varchar(50) NOT NULL,
	ContactEmail varchar(50) NOT NULL
);
 

--Part C: Inserting records into the two tables.

INSERT INTO Customers (CustomerId, CompanyName, Address1, Address2, City, Country, ContactName, ContactEmail)
VALUES (2, 'Das Auto', '100 Munchen Business Park', 'Munchen 2323', 'Munich',
'Deutscheland', '4987545332', 'Philip Kroos@dasauto.com');

INSERT INTO Customers (CustomerId, CompanyName, Address1, Address2, City, Country, ContactName, ContactEmail)
VALUES (3, 'Danone','15 Parkway House', 'Leicester Road', 'Leicester', 'England',
'055455434', 'jamietaylor@danone.com');

INSERT INTO Customers (CustomerId, CompanyName, Address1, Address2, City, Country, ContactName, ContactEmail)
VALUES (4, 'Nestle','13 Rue de Paris', 'Paris', 'Paris 201212', 'France',
'49875545454', 'michelegaulle@nestle.com');

INSERT INTO Contractors (ContractorId, FirstName, LastName, Address1, Address2, City, Country, ContactPhone, ContactEmail)
VALUES (1, 'Hans', 'Christian','12 Strabe Munchen', 'Munchen Klien', 'Munich',
'Deutscheland', '4987565656', 'hanschristian@hotmail.com');

INSERT INTO Contractors (ContractorId, FirstName, LastName, Address1, Address2, City, Country, ContactPhone, ContactEmail)
VALUES (2, 'Karl Heinz', 'Vakkel','10 New Forrest Strabe', 'Munchen Grob', 'Munich',
'Deutscheland', '4987549543', 'karlheinz@hotmail.com');

INSERT INTO Contractors (ContractorId, FirstName, LastName, Address1, Address2, City, Country, ContactPhone, ContactEmail)
VALUES (3, 'Anne', 'Leicester','54 Emmerdale Road', 'Emmerdale Farm', 'Emmerdale',
'England', '055454545', 'anneleicester@hotmail.com');

INSERT INTO Contractors (ContractorId, FirstName, LastName, Address1, Address2, City, Country, ContactPhone, ContactEmail)
VALUES (4, 'Peter', 'Rummeniege','13 Hamburg Way', 'Hamburg', 'Hamburg', 'Germany',
'4987545454', 'peterrummeniege@hotmail.com');


--Part D: Updating records within the two tables:

--Contractors
--For the contractor with the contractorId value of 2, I change the email address to read: karlheinz@gmail.com

UPDATE Contractors
SET ContactEmail = 'karlheinz@gmail.com'
WHERE ContractorID = 2;


--Customers
--For the customer with the customerId value of 3, I change the company name to Group Danone.

UPDATE Customers
SET CompanyName = 'Group Danone'
WHERE CustomerID = 3;

 
--Part E: In the Contractors table, I delete the record where the field contractorId has a value of 3.

DELETE FROM Contractors WHERE ContractorID = 3;
