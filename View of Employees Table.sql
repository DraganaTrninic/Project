--I create a View object in code using T-SQL of an Employee table I create.

--Part A: I create a database named Employees.

CREATE DATABASE Employees;


--Part B: I create a table named Employee with the following fields.
--Field Data Type
--empID [PRIMARY KEY] smallint
--fName varchar(50)
--lName varchar(50)
--age smallint
--empAddress varchar(50)
--empEmail varchar(50)
--empPhoneNo varchar(50)
--salary money

CREATE TABLE Employee (
EmpID smallint PRIMARY KEY,
FName varchar(50),
LName varchar(50),
Age smallint,
EmpAddress varchar(50),
EmpEmail varchar(50),
EmpPhoneNo varchar(50),
Salary money
);


--Part C: I insert the following records into the table.

--Record 1

--Field Value
--empID [PRIMARY KEY] 1
--fName Fred
--lName Smith
--age 23
--empAddress 12 High Street, Cork.
--empEmail fsmith@dbconsultants.com
--empPhoneNo 0874527232
--salary 34000

--Record 2
--Field Value
--empID [PRIMARY KEY] 2
--fName Jane
--lName Taylor
--age 29
--empAddress 10 Low Street, Cork.
--empEmail jtaylor@dbconsultants.com
--empPhoneNo 0876471233
--salary 38000

INSERT INTO Employee (EmpID, FName, LName, Age, EmpAddress, EmpEmail, EmpPhoneNo, Salary)
VALUES (1, 'Fred', 'Smith', 23, '12 High Street, Cork', 'fsmith@dbconsultants.com', '0874527232', 34000);

INSERT INTO Employee (EmpID, FName, LName, Age, EmpAddress, EmpEmail, EmpPhoneNo, Salary)
VALUES (2, 'Jane', 'Taylor', 29, '10 Low Street, Cork', 'jtaylor@dbconsultants.com', '0876471233', 38000);
 

--Part D: I create a View named EMPLOYEES_VIEW, which selects all records from the Employee table.

CREATE VIEW EMPLOYEES_VIEW AS 

SELECT 
  EmpID,
  FName,
  LName,
  Age,
  EmpAddress,
  EmpEmail,
  EmpPhoneNo,
  Salary

FROM Employees.dbo.Employee;


--Part E: I query the view.
SELECT* FROM EMPLOYEES_VIEW;
