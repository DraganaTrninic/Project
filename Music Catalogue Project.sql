/*
I want to organise a music catalogue of music I have in CD and LP format and decide to create a new database called Music_Catalogue to store that information. 
Later, I create a wish list for music I would like to have, and check to see whether I already have it and if so, in which format. 
*/

CREATE DATABASE Music_Catalogue;


--I create two separate tables, LP_Catalogue and CD_Catalogue.

--Both tables have identical fields and data types.
-- - groupName varchar(50)
-- - albumName varchar(50)
-- - yearReleased date
-- - recordLabel varchar(50)
-- - myRating int
-- - genre varchar(50)

-- I make albumName the primary key of the table.

CREATE TABLE LP_Catalogue (
  GroupName varchar(50), 
  AlbumName varchar(50) PRIMARY KEY,
  YearReleased date,
  RecordLabel varchar(50),
  MyRating int,
  Genre varchar(50)
  );

CREATE TABLE CD_Catalogue (
  GroupName varchar(50), 
  AlbumName varchar(50) PRIMARY KEY,
  YearReleased date,
  RecordLabel varchar(50),
  MyRating int,
  Genre varchar(50)
  );
 
 
--I insert the following records: 

--LP_Catalogue Table
--Group Name / Album Name / Year Released / Record Label / My Rating / Genre

--Simple Minds / New World Music / 1982-06-01 / WEA Records / 8 / Pop
--U2 / Rattle and Hum / 1987-02-06 / Geffen Records / 7 / Pop
--Rick Astley / Rick Astley – Greatest Hits / 1992-08-01 / Warner Bros / 6 / Pop
--ACDC / Live In Rio / 1993-04-13 / Warner Bros / 7 / Rock

INSERT INTO LP_Catalogue (GroupName, AlbumName, YearReleased, RecordLabel, MyRating, Genre)
VALUES ('Simple Minds', 'New World Music', '1982-06-01', 'WEA Records', 8, 'Pop')

INSERT INTO LP_Catalogue (GroupName, AlbumName, YearReleased, RecordLabel, MyRating, Genre)
VALUES ('U2', 'Rattle and Hum', '1987-02-06', 'Geffen Records', 7, 'Pop')

INSERT INTO LP_Catalogue (GroupName, AlbumName, YearReleased, RecordLabel, MyRating, Genre)
VALUES ('Rick Astley', 'Rick Astley – Greatest Hits', '1992-08-01', 'Warner Bros', 6, 'Pop')

INSERT INTO LP_Catalogue (GroupName, AlbumName, YearReleased, RecordLabel, MyRating, Genre)
VALUES ('ACDC', 'Live In Rio', '1993-04-13', 'Warner Bros', 7, 'Rock')
 

--CD_Catalogue Table
--Group Name / Album Name / Year Released / Record Label / My Rating / Genre
--Meat Loaf / Bat out of Hell / 1979-11-12 / WEA Records / 5 / Rock
--U2 / Discotheque / 2003-03-09 / Warner Bros / 7 / Pop
--Oasis / Greatest Hits / 2012-03-24 / Blue Records / 7 / Pop
--ACDC / Greatest Hits – Vol 2 / 1999-09-09 / Warner Bros / 6 / Rock
--U2 / Rattle and Hum / 1987-02-06 / Geffen Records / 7 / Pop

INSERT INTO CD_Catalogue (GroupName, AlbumName, YearReleased, RecordLabel, MyRating, Genre)
VALUES ('Meat Loaf', 'Bat out of Hell', '1979-11-12', 'WEA Records', 5, 'Rock')

INSERT INTO CD_Catalogue (GroupName, AlbumName, YearReleased, RecordLabel, MyRating, Genre)
VALUES ('U2', 'Discotheque', '2003-03-09', 'Warner Bros', 7, 'Pop')

INSERT INTO CD_Catalogue (GroupName, AlbumName, YearReleased, RecordLabel, MyRating, Genre)
VALUES ('Oasis', 'Greatest Hits', '2012-03-24', 'Blue Records', 7, 'Pop')

INSERT INTO CD_Catalogue (GroupName, AlbumName, YearReleased, RecordLabel, MyRating, Genre)
VALUES ('ACDC', 'Greatest Hits – Vol 2', '1999-09-09', 'Warner Bros', 6, 'Rock')

INSERT INTO CD_Catalogue (GroupName, AlbumName, YearReleased, RecordLabel, MyRating, Genre)
VALUES ('U2', 'Rattle and Hum', '1987-02-06', 'Geffen Records', 7, 'Pop')
 

--Part A: Using the LP_Catalogue and CD_Catalogue tables, I show all the records from both tables, ordering the output by album name.

SELECT* FROM LP_Catalogue

UNION ALL

SELECT* FROM CD_Catalogue
ORDER BY AlbumName;


--Part B: I show all distinct (non-duplicate) records in both tables.

SELECT* FROM LP_Catalogue

UNION

SELECT* FROM CD_Catalogue
ORDER BY AlbumName;


--Part C: I want to see rows from both tables where my rating >=7, ordering the output by my rating.

SELECT* FROM LP_Catalogue
WHERE MyRating >=7

UNION ALL

SELECT* FROM CD_Catalogue
WHERE MyRating >=7

ORDER BY MyRating;

 
--Part D: I want to see all distinct (non-duplicate) rows from both tables where my rating >= 7, ordering the output by my rating.

SELECT* FROM LP_Catalogue
WHERE MyRating >=7

UNION

SELECT* FROM CD_Catalogue
WHERE MyRating >=7

ORDER BY MyRating;


--Part E: I create a query to show all distinct (non-duplicate) rows where the year released after 1983, this time ordering the output by year released.

SELECT* FROM LP_Catalogue
WHERE YearReleased > '1983-12-31'

UNION

SELECT* FROM CD_Catalogue
WHERE YearReleased > '1983-12-31'

ORDER BY YearReleased;


--Part F: I add a new table to the Music_Catalogue database, named Wish_List. The table will store the names of LP's and CD's that I would like to purchase in the future.

--Wish_List
-- - groupName varchar(50)
-- - albumName varchar(50)
-- - yearReleased date
-- - genre varchar(50)

--The primary key is set to albumName.

CREATE TABLE Wish_List (
GroupName varchar(50), 
AlbumName varchar(50) PRIMARY KEY,
YearReleased date,
Genre varchar(50)
);
 

--I insert the following information into the Wish_List table:

--Group Name, Album Name, Year Released, Genre
--Aztec Camera, Best of Aztec Camera, 1997-09-14, Pop
--REM, Automatic for the People, 1998-05-13, Pop
--U2, Rattle and Hum, 1987-02-06, Pop
--Simple Minds, New World Music, 1982-06-01, Pop

INSERT INTO Wish_List (GroupName, AlbumName, YearReleased, Genre)
VALUES ('Aztec Camera', 'Best of Aztec Camera', '1997-09-14', 'Pop')

INSERT INTO Wish_List (GroupName, AlbumName, YearReleased, Genre)
VALUES ('REM', 'Automatic for the People', '1998-05-13', 'Pop')

INSERT INTO Wish_List (GroupName, AlbumName, YearReleased, Genre)
VALUES ('U2', 'Rattle and Hum', '1987-02-06', 'Pop')

INSERT INTO Wish_List (GroupName, AlbumName, YearReleased, Genre)
VALUES ('Simple Minds', 'New World Music', '1982-06-01', 'Pop')
 

--Part G: I wish to display album names in my wish list that I do not already own in either CD or LP format, ordering the output by album name.

SELECT AlbumName

FROM Wish_List

WHERE AlbumName NOT IN (SELECT AlbumName FROM LP_Catalogue)
AND AlbumName NOT IN (SELECT AlbumName FROM CD_Catalogue)
						
ORDER BY AlbumName;


--OR Part G: I wish to display album names in my wish list that I do not already own in either CD or LP format, ordering the output by album name.

SELECT AlbumName
FROM Wish_List

EXCEPT 
  (SELECT AlbumName FROM LP_Catalogue 
  UNION
  SELECT AlbumName FROM CD_Catalogue)

ORDER BY AlbumName;
 

--Part H: I create a query to see the names of albums on my wish list that I already own on CD, ordering the output by album name.

SELECT W.AlbumName 
FROM Wish_List W JOIN CD_Catalogue CD ON W.AlbumName = CD.AlbumName

ORDER BY AlbumName;

--OR Part H: I create a quiery to see the names of albums on my wish list that I already own on CD, ordering the output by album name.

SELECT AlbumName 
FROM Wish_List

INTERSECT 

SELECT AlbumName
FROM CD_Catalogue

ORDER BY AlbumName;
 

--Part I: I want to see the names of any albums on my wish list that I already own on LP, ordering the output by album name.

SELECT W.AlbumName 
FROM Wish_List W JOIN LP_Catalogue LP ON W.AlbumName = LP.AlbumName

ORDER BY AlbumName;


--OR Part I: I want to see the names of any albums on my wish list that I already own on LP, ordering the output by album name.

SELECT AlbumName 
FROM Wish_List

INTERSECT 

SELECT AlbumName
FROM LP_Catalogue

ORDER BY AlbumName;
 

--Part J: I want to see if I own the same album title on both CD format and LP format, ordering the output by album name.

SELECT CD.AlbumName 
FROM CD_Catalogue CD JOIN LP_Catalogue LP ON CD.AlbumName = LP.AlbumName

ORDER BY AlbumName;

![image.png](attachment:613e5350-e7c1-4885-a1f6-b6fa6af6d541.png) 

--OR Part J:I want to see if I own the same album title on both CD format and LP format, ordering the output by album name.

SELECT AlbumName 
FROM CD_Catalogue

INTERSECT 

SELECT AlbumName
FROM LP_Catalogue

ORDER BY AlbumName;
 

--Part K: I want to see the names of any albums that I own on CD but not on LP format, ordering the output by album name.

SELECT AlbumName 
FROM CD_Catalogue 

WHERE AlbumName NOT IN (SELECT AlbumName FROM LP_Catalogue)

ORDER BY AlbumName;
 

--OR Part K: I want to see the names of any albums that I own on CD but not on LP format, ordering the output by album name.

SELECT AlbumName 
FROM CD_Catalogue

EXCEPT

SELECT AlbumName
FROM LP_Catalogue

ORDER BY AlbumName;
