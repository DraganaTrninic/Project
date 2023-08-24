--I create a database and table for a football stickers collection. I update and delete records, and I copy records into new tables.

/*Part A:
• First, I write a T-SQL statement that creates a database called Football_Stickers_Collection.*/

CREATE DATABASE Football_Stickers_Collection;

/*Part B:
• I then write a T-SQL statement that creates a table called Football_Stickers, and specify 
appropriate data types for  the columns in the table and a primary key:*/

CREATE TABLE Football_Stickers (
  ID int PRIMARY KEY,
  FirstName varchar(30),
  LastName varchar(30),
  Country varchar(80),
  [No. of Caps won] int
  );

INSERT INTO Football_Stickers (ID, FirstName, LastName, Country, [No. of Caps won])
  VALUES
        (1, 'Michel', 'Platini', 'France', 86),
        (2, 'Diego', 'Maradona', 'Argentina', 76),
        (3, 'Jordi', 'Cruyff', 'Netherlands', 12),
        (4, 'Ossie', 'Ardiles', 'Argentina', 48),
        (5, 'Paul', 'McGrath', 'Republic of Ireland', 76),
        (6, 'John', 'Giles', 'Republic of Ireland', 60),
        (7, 'Pele', NULL, 'Brazil', 89),
        (8, 'Zinedine', 'Zidane', 'France', 76),
        (9, 'Liam', 'Brady', 'Republic of Ireland', 88),
        (10, 'Leo', 'Messi', 'Argentina', 95),
        (11, 'Craig', 'Bellamy', 'Wales', 10),
        (12, 'George', 'Best', 'Northern Ireland', 56),
        (13, 'Norman', 'Whiteside', 'Northern Ireland', 30)
         

/*Part C:
• I write a T-SQL statement that updates the record with an ID value of 3, so that the first name field has the value, Johan.*/

UPDATE Football_Stickers
SET FirstName = 'Johan'
WHERE ID = 3
  
 
/*Part D:
• I write a T-SQL statement that deletes the record from the table, which has a value for ID of 11.*/

DELETE FROM Football_Stickers
WHERE ID = 11
 

/*Part E:
• I write a T-SQL statement that deletes records from the table where the value for the Country field is Northern Ireland.*/

DELETE FROM Football_Stickers
WHERE Country = 'Northern Ireland'
 

/*Part F:
• I write a T-SQL statement that inserts the following records into the table:
ID FirstName LastName Country No. of Caps won
11 Emilio Butragueno Spain 67
12 Hugo Sanchez Mexico 78*/

INSERT INTO Football_Stickers
  (ID, FirstName, LastName, Country, [No. of Caps won])
VALUES
  (11, 'Emilio', 'Butragueno', 'Spain', 67),
  (12, 'Hugo', 'Sanchez', 'Mexico', 78)
 

/*Part G:
• I write a T-SQL statement that copies all records from the Football_Stickers table and inserts them into another table called Football_Stickers_Reserves. 
I assume that the table Football_Stickers_Reserves does not exist, making sure to create the table in advance of copying the records over.*/

CREATE TABLE Football_Stickers_Reserves (
  ID int PRIMARY KEY,
  FirstName varchar(30),
  LastName varchar(30),
  Country varchar(80),
  [No. of Caps won] int
  );
 
INSERT INTO Football_Stickers_Reserves
SELECT * FROM Football_Stickers;


/*Part H:
• Finally, I write a T-SQL statement that copies records from the Football_Stickers table, where the value for the Country field is Republic of Ireland, 
into another table called Irish_Football_Legends. I assume that the table, Irish_Football_Legends does not exist. I do not create the Irish_Football_Legends 
table first, and write a T-SQL statement in which the table will be automatically created as part of the process of copying the records over.*/

SELECT * INTO Irish_Football_Legends 
FROM Football_Stickers 
WHERE Country = 'Republic of Ireland';
