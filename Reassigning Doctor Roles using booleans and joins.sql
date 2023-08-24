/*
Here I create a database for a fictional hospital and tables filled with records for doctors (patient-facing and research-facing) and their patients. 
I use Boolean values to differentiate between the patient-facing and research-facing doctors. I then reassign the roles of two doctors and create a query 
with inner joins to check whether any research-facing doctors have patients so that those patients can be reassigned to patient-facing doctors.

If patient-facing then ‘onResearch’ = 0

If research-based then ‘onResearch’ = 1 
*/

--Part A: Creating a database named Doctors.

CREATE DATABASE Doctors;

--Part B: To identify doctors and store their information, I create a database table named Doctor_Details with the following fields:
--doctor_id (PK)| firstName | lastName | department | extensionNo | onResearch

CREATE TABLE Doctor_Details (
  Doctor_ID int PRIMARY KEY,
  FirstName varchar(70),
  LastName varchar(70),
  Department varchar(100),
  ExtensionNo varchar(20),
  OnResearch bit
  );


--Part C: I insert the following records:
--(1,'John', 'White', 'Eye, Ear and Throat','014569534',0)
--(2,'Claire', 'Brown', 'Eye, Ear and Throat','014569535',0)
--(3,'Gemma', 'Hayes', 'Eye, Ear and Throat','014569536',0)
--(4,'Cian', 'Minnehan', 'Eye, Ear and Throat','014569537',0)
--(5,'Declan', 'Moon', 'Eye, Ear and Throat','014569538',0)

INSERT INTO Doctor_Details (Doctor_ID, FirstName, LastName, Department, ExtensionNo, OnResearch)
VALUES (1,'John', 'White', 'Eye, Ear and Throat','014569534',0)

INSERT INTO Doctor_Details (Doctor_ID, FirstName, LastName, Department, ExtensionNo, OnResearch)
VALUES (2,'Claire', 'Brown', 'Eye, Ear and Throat','014569535',0)

INSERT INTO Doctor_Details (Doctor_ID, FirstName, LastName, Department, ExtensionNo, OnResearch)
VALUES(3,'Gemma', 'Hayes', 'Eye, Ear and Throat','014569536',0)

INSERT INTO Doctor_Details (Doctor_ID, FirstName, LastName, Department, ExtensionNo, OnResearch)
VALUES (4,'Cian', 'Minnehan', 'Eye, Ear and Throat','014569537',0)

INSERT INTO Doctor_Details (Doctor_ID, FirstName, LastName, Department, ExtensionNo, OnResearch)
VALUES (5,'Declan', 'Moon', 'Eye, Ear and Throat','014569538',0)


--Part D: To identify patients and store their details, I create a table named Patient_Details with the following fields:
--patient_id (PK) | doctor_id (FK) | firstName | lastName | phoneNo | eMailAddress

CREATE TABLE Patient_Details (
Patient_ID int PRIMARY KEY,
Doctor_ID int FOREIGN KEY REFERENCES Doctor_Details(Doctor_ID),
FirstName varchar(70),
LastName varchar(70),
PhoneNo varchar(20),
EMailAddress varchar (100)
);


--Part E: I insert the following records into the Patient_Details table:
--(1,3,'Billy', 'McCarthy','01584754','bmaccarthy@hotmail.com')
--(2,4,'Anne', 'Manning','01583853','amanning@hotmail.com')
--(3,2,'Gerry', 'Newman','021434343','gnewman@hotmail.com')
--(4,1,'Amy', 'Dineen','01303023','adineen@hotmail.com')
--(5,5,'Ger', 'Walsh','021323232','gerwalsh@hotmail.com')

INSERT INTO Patient_Details (Patient_ID, Doctor_ID, FirstName, LastName, PhoneNo, EMailAddress)
VALUES(1, 3, 'Billy', 'McCarthy','01584754','bmaccarthy@hotmail.com')

INSERT INTO Patient_Details (Patient_ID, Doctor_ID, FirstName, LastName, PhoneNo, EMailAddress)
VALUES(2,4,'Anne', 'Manning','01583853','amanning@hotmail.com')

INSERT INTO Patient_Details (Patient_ID, Doctor_ID, FirstName, LastName, PhoneNo, EMailAddress)
VALUES(3,2,'Gerry', 'Newman','021434343','gnewman@hotmail.com')

INSERT INTO Patient_Details (Patient_ID, Doctor_ID, FirstName, LastName, PhoneNo, EMailAddress)
VALUES(4,1,'Amy', 'Dineen','01303023','adineen@hotmail.com')

INSERT INTO Patient_Details (Patient_ID, Doctor_ID, FirstName, LastName, PhoneNo, EMailAddress)
VALUES(5,5,'Ger', 'Walsh','021323232','gerwalsh@hotmail.com')
 

--Part F: I write a query using an inner join that displays information about doctors who are patient-facing (i.e. doctors who have patients) displaying also, details of their patients.

SELECT
  D.[Doctor_ID],
  D.[FirstName],
  D.[LastName],
  P.[Patient_ID],
  P.[FirstName],
  P.[LastName]

FROM [dbo].[Doctor_Details] D INNER JOIN [dbo].[Patient_Details] P
  ON D.[Doctor_ID] = P.[Doctor_ID]

WHERE D.[OnResearch] = 0 
ORDER BY D.[Doctor_ID];


--Part G: Now imagining that some doctors have changed status (ie. Gemma Hayes & Declan Moon), I update the onResearch status of the following doctors to that of being research based (value of 1).

UPDATE Doctor_Details
SET OnResearch = 1
WHERE FirstName = 'Gemma' AND LastName = 'Hayes';

UPDATE Doctor_Details
SET OnResearch = 1
WHERE FirstName = 'Declan' AND LastName = 'Moon';


--Part H: I display details of patient-facing (non-research) doctors and their patients to show that the two doctors whose status we changed are no longer listed in patient-facing roles.

SELECT
  D.[Doctor_ID],
  D.[FirstName],
  D.[LastName],
  D.[OnResearch],
  P.[Patient_ID],
  P.[FirstName],
  P.[LastName]

FROM [dbo].[Doctor_Details] D INNER JOIN [dbo].[Patient_Details] P
  ON D.[Doctor_ID] = P.[Doctor_ID]

WHERE D.[OnResearch] = 0;


--Part I: At this point, I create a query to determine whether any of the research-based doctors have patients. The hospital can use this data to re-assign these patients to patient-facing doctors.

SELECT
  D.[Doctor_ID],
  D.[FirstName],
  D.[LastName],
  D.[OnResearch],
  P.[Patient_ID],
  P.[FirstName],
  P.[LastName]

FROM [dbo].[Doctor_Details] D INNER JOIN [dbo].[Patient_Details] P
ON D.[Doctor_ID] = P.[Doctor_ID]

WHERE D.[OnResearch] = 1;
