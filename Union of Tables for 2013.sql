/*
Here, using the Adventure Works 2019 dataset, I imagine that our business customer wants to see a list of all customer orders from 2013 
and all orders our company has placed to vendors in 2013 combined in a single dataset. 
*/

SELECT [SalesOrderID]
	  ,[Order Type] = 'Customer Order'
      ,[OrderDate]
      
  FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]

  WHERE YEAR([OrderDate]) = 2013

  UNION

  SELECT [PurchaseOrderID]
        ,[Order Type] = 'Vendor Order'
        ,[OrderDate]
      
  FROM [AdventureWorks2019].[Purchasing].[PurchaseOrderHeader]

  WHERE YEAR([OrderDate]) = 2013;
