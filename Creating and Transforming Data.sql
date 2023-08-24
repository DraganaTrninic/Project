--Concatenation (with NULL). Here I want to create a column called "Full Name" which includes the full name and title for employees in a company rather than having the name and title split up into multiple columns e.g. [FirstName], [MiddleName], etc. Because the [Title], [MiddleName], and [Suffix] fields can be NULL I have to account for that, which I do using the ISNULL function.

SELECT 
  [Full Name] = ISNULL([title] + ' ', '') + [FirstName] + ' ' + ISNULL([MiddleName] + ' ', '') + [LastName] + ' ' + ISNULL([Suffix], '')

FROM [AdventureWorks2019].[Person].[Person]


--Derived Columns with mathematical calculations. Here I create four derived columns to calculate the following for Sales People in the fictional Adventure Works company: the comission year to date, the income year to date, the difference in sales from this year and last, and bonus fairnes as a percent of bonus compared to sales year to date.

--One particularly interesting finding is the large discrepencies we can see in the derived Bonus Fairness column (see ReadMe).

SELECT 
  [Commission Year to Date] = [SalesYTD] [CommissionPct] 
  ,[Income Year to Date] = ([SalesYTD] [CommissionPct]) + [Bonus] ,[SalesQuota] 
  ,[Bonus] ,[CommissionPct] ,[SalesYTD] ,[Bonus Fairness] = ([Bonus] / [SalesYTD]) * 100 
  ,[SalesLastYear] ,[Difference] = [SalesYTD] - [SalesLastYear] 
  ,[rowguid] 
  ,[ModifiedDate] 

  FROM [AdventureWorks2019].[Sales].[SalesPerson]


