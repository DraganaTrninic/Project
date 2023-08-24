/*
The tables (and records) in a database named Pop Shop are shown below. 
Pop Shop is a company that sell CDs (compact discs).
*/

CREATE DATABASE Pop_Shop;


--Part A: I create the tables shown below with the specified relationships. I specify what I consider suitable data types for the fields in the tables.

--Customers:
--ID (PK) / First_Name / Last_Name / Address / Phone No
--1 / John / White / 12, The Moors Limerick / 0874565343
--2 / Gillian / Mangan / 36, The Crescent, Killarney / 0874587432 
--3 / Frank Murphy / 99, The Heights,Tralee / 0863456432

CREATE TABLE Customers ( 
  ID int PRIMARY KEY,
  First_Name varchar (50), 
  Last_Name varchar (50), 
  [Address] varchar (80),
  [Phone No] varchar (15)
  );


INSERT INTO Customers (ID, First_Name, Last_Name, [Address], [Phone No])
VALUES (1, 'John', 'White', '12, The Moors Limerick', '0874565343')

INSERT INTO Customers (ID, First_Name, Last_Name, [Address], [Phone No])
VALUES (2, 'Gillian', 'Mangan', '36, The Crescent, Killarney', '0874587432')

INSERT INTO Customers (ID, First_Name, Last_Name, [Address], [Phone No])
VALUES (3, 'Frank', 'Murphy', '99, The Heights, Tralee', '0863456432')


--Catalogue:
--ID (PK) Item Price
--1 Greatest Hits - Rick Astley 5
--2 Greatest Hits - Queen 10
--3 Greatest Hits - Billy Ocean 5
--4 Greatest Hits - U2 10
--5 Greatest Hits - Wham! 5

CREATE TABLE Catalogue (
  ID int PRIMARY KEY,
  Item varchar(80),
  Price money
  );


INSERT INTO Catalogue (ID, Item, Price)
VALUES (1, 'Greatest Hits - Rick Astley', 5)

INSERT INTO Catalogue (ID, Item, Price)
VALUES (2, 'Greatest Hits - Queen', 10)

INSERT INTO Catalogue (ID, Item, Price)
VALUES (3, 'Greatest Hits - Billy Ocean', 5)

INSERT INTO Catalogue (ID, Item, Price)
VALUES (4, 'Greatest Hits - U2', 10)

INSERT INTO Catalogue (ID, Item, Price)
VALUES (5, 'Greatest Hits - Wham!', 5)


--Orders:
--OrderID (PK) Order_Date CustomerID (FK)
--1 01/05/2021 1
--2 01/05/2021 2
--3 01/05/2021 3
--4 02/05/2021 2
--5 02/05/2021 3

CREATE TABLE Orders (
  ID int PRIMARY KEY,
  Order_Date date,
  CustomerID int,
  FOREIGN KEY (CustomerID) REFERENCES Customers(ID)
  );

INSERT INTO Orders (ID, Order_Date, CustomerID)
VALUES (1, '05/01/2021', 1)

INSERT INTO Orders (ID, Order_Date, CustomerID)
VALUES (2, '05/01/2021', 2)

INSERT INTO Orders (ID, Order_Date, CustomerID)
VALUES (3, '05/01/2021', 3)

INSERT INTO Orders (ID, Order_Date, CustomerID)
VALUES (4, '05/02/2021', 2)

INSERT INTO Orders (ID, Order_Date, CustomerID)
VALUES (5, '05/02/2021', 3)


--Order_Items:
--OrderID (PK) Order_Item_No (PK) CatalogueID (FK) Quantity
--1 1 1 1
--2 1 2 2
--3 1 3 1
--3 2 4 2
--4 1 5 1
--4 2 3 2
--5 1 3 3

CREATE TABLE Order_Items (
  OrderID int NOT NULL,
  Order_Item_No int NOT NULL,
  CatalogueID int,
  Quantity int,
  PRIMARY KEY (OrderID, Order_Item_No),
  FOREIGN KEY (CatalogueID) REFERENCES Catalogue(ID)
  );


INSERT INTO Order_Items (OrderID, Order_Item_No, CatalogueID, Quantity)
VALUES (1, 1, 1, 1)

INSERT INTO Order_Items (OrderID, Order_Item_No, CatalogueID, Quantity)
VALUES (2, 1, 2, 2)

INSERT INTO Order_Items (OrderID, Order_Item_No, CatalogueID, Quantity)
VALUES (3, 1, 3, 1)

INSERT INTO Order_Items (OrderID, Order_Item_No, CatalogueID, Quantity)
VALUES (3, 2, 4, 2)

INSERT INTO Order_Items (OrderID, Order_Item_No, CatalogueID, Quantity)
VALUES (4, 1, 5, 1)

INSERT INTO Order_Items (OrderID, Order_Item_No, CatalogueID, Quantity)
VALUES (4, 2, 3, 2)

INSERT INTO Order_Items (OrderID, Order_Item_No, CatalogueID, Quantity)
VALUES (5, 1, 3, 3)


--Part B: I write a T-SQL query that displays records in the Catalogue table where the quantity ordered for that item in the Order_Items table is greater than one. 
--I make use of a subquery as part of the solution.

SELECT *
FROM Catalogue

WHERE ID = ANY (SELECT CatalogueID
	         FROM Order_Items
                WHERE Quantity > 1)


--Part C: I write a T-SQL query that only displays records in the Catalogue table, if all the records in the Order_Items table have a quantity ordered of one. 
--I make use of a subquery as part of the solution.

SELECT *
FROM Catalogue

WHERE ID = ALL (SELECT CatalogueID
	         FROM Order_Items
                WHERE Quantity = 1);
