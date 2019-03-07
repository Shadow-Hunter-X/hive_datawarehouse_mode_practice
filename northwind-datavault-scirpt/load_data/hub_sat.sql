------- 
-- hub_customer
SELECT HashBytes('MD5',customerid) hub_customer_key , 
       customerid , 
	   CURRENT_TIMESTAMP hub_load_dts ,
	   'northwind;customers' hub_rec_src 	   
FROM [dbo].[Customers]
-- sat_customer
SELECT HashBytes('MD5',customerid) hub_customer_key , 
	[CustomerID] ,
	[CompanyName] ,
	[ContactName] ,
	[ContactTitle] ,
	[Address] ,
	[City] ,
	[Region] ,
	[PostalCode] ,
	[Country] ,
	[Phone] ,
	[Fax] ,
	HASHBYTES('MD5',[CompanyName]+ISNULL([ContactName],'')+ISNULL([ContactTitle],'')+ISNULL([Address],'')+
	         ISNULL([City],'')+ISNULL([Region],'')+ISNULL([PostalCode],'')+[Country]+ISNULL([Phone],'')+ISNULL([Fax],'')) hash_diff , 
	CURRENT_TIMESTAMP sat_load_dts ,
	'northwind;customers' sat_rec_src 	   
FROM [dbo].[Customers] 

-- hub_employee
SELECT HashBytes('MD5',[EmployeeID]+[LastName]) hub_employee_key
      ,[EmployeeID]
      ,[LastName]
	  ,CURRENT_TIMESTAMP hub_load_dts 
	  ,'northwind;Employees' hub_rec_src 	
FROM [dbo].[Employees]
-- sat_employee 
SELECT HashBytes('MD5',CONVERT(nvarchar,[EmployeeID]) + [LastName] ) hub_employee_key 
      ,[EmployeeID]
      ,[LastName]
      ,[FirstName]
      ,[Title]
      ,[TitleOfCourtesy]
      ,[BirthDate]
      ,[HireDate]
      ,[Address]
      ,[City]
      ,[Region]
      ,[PostalCode]
      ,[Country]
      ,[HomePhone]
      ,[Extension]
      ,[Photo]
      ,[Notes]
      ,[ReportsTo]
      ,[PhotoPath]
	  , HASHBYTES('MD5',[FirstName]+[Title]+[TitleOfCourtesy]+CONVERT(nvarchar,[BirthDate])+CONVERT(nvarchar,[HireDate]) 
	                  + ISNULL([Address],'') + ISNULL([City],'')  + ISNULL([Region],'') + ISNULL([PostalCode],'') 
					  + ISNULL([Country],'') + ISNULL([HomePhone],'') +  ISNULL([Extension],'') 
					  + ISNULL(CONVERT(nvarchar,[ReportsTo]),'') + ISNULL([PhotoPath],'') ) hash_diff
	  , CURRENT_TIMESTAMP sat_load_dts 
	  , 'northwind;Employees' sat_rec_src 	
  FROM [dbo].[Employees]

-- hub_order
SELECT HashBytes('MD5',[OrderID]) hub_order_key
      ,[OrderID]
      ,CURRENT_TIMESTAMP hub_load_dts 
	  ,'northwind;Orders' hub_rec_src 	
  FROM [dbo].[Orders]


-- sat_order
SELECT HashBytes('MD5',CONVERT(nvarchar,[OrderID]) ) hub_order_key
      ,[OrderID]
      ,[CustomerID]
      ,[EmployeeID]
      ,[OrderDate]
      ,[RequiredDate]
      ,[ShippedDate]
      ,[ShipVia]
      ,[Freight]
      ,[ShipName]
      ,[ShipAddress]
      ,[ShipCity]
      ,[ShipRegion]
      ,[ShipPostalCode]
      ,[ShipCountry]
	  , HASHBYTES('MD5',[CustomerID]+CONVERT(nvarchar,[EmployeeID])+CONVERT(nvarchar,[OrderDate])+CONVERT(nvarchar,[RequiredDate]) + CONVERT(nvarchar,[ShippedDate]) 
	                  + CONVERT(nvarchar,[ShipVia]) + CONVERT(nvarchar,[Freight])  + ISNULL([ShipName],'') + ISNULL([ShipAddress],'') 
					  + ISNULL([ShipCity],'') + ISNULL([ShipRegion],'') +  ISNULL([ShipPostalCode],'') + ISNULL([ShipCountry],'')  ) hash_diff
	  , CURRENT_TIMESTAMP sat_load_dts 
	  , 'northwind;Orders' sat_rec_src 	
  FROM [dbo].[Orders]


-- hub_product
SELECT HashBytes('MD5',CONVERT(nvarchar,[ProductName]) ) hub_product_key
      ,[ProductName]
      ,CURRENT_TIMESTAMP hub_load_dts 
	  ,'northwind;Products' hub_rec_src 	
  FROM [dbo].[Products]

-- sat_product
SELECT HashBytes('MD5',CONVERT(nvarchar,[ProductName]) ) hub_product_key
      ,[ProductID]
      ,[ProductName]
      ,[SupplierID]
      ,[CategoryID]
      ,[QuantityPerUnit]
      ,[UnitPrice]
      ,[UnitsInStock]
      ,[UnitsOnOrder]
      ,[ReorderLevel]
      ,[Discontinued]
	  , HASHBYTES('MD5',CONVERT(nvarchar,[ProductID])+CONVERT(nvarchar,[SupplierID])+CONVERT(nvarchar,[CategoryID]) + CONVERT(nvarchar,[UnitPrice]) 
	                  + CONVERT(nvarchar,[UnitsOnOrder]) + CONVERT(nvarchar,[ReorderLevel])  
					  + ISNULL([QuantityPerUnit],'') + CONVERT(nvarchar,[Discontinued]) ) hash_diff
	  , CURRENT_TIMESTAMP sat_load_dts 
	  , 'northwind;Products' sat_rec_src 	
  FROM [dbo].[Products]

  -- hub_region
  SELECT HashBytes('MD5',CONVERT(nvarchar,[RegionID])+ [RegionDescription]) hub_region_key
      , [RegionID]
      , [RegionDescription]
	  , CURRENT_TIMESTAMP hub_load_dts 
	  ,'northwind;Region' hub_rec_src 	
  FROM [dbo].[Region]

  -- sat_region
  SELECT HashBytes('MD5',CONVERT(nvarchar,[RegionID])+ [RegionDescription]) hub_region_key
      ,[RegionID]
      ,[RegionDescription]
	  , HASHBYTES('MD5',CONVERT(nvarchar,[RegionID]) + ISNULL([RegionDescription],'') ) hash_diff
	  , CURRENT_TIMESTAMP sat_load_dts 
	  , 'northwind;Region' sat_rec_src 	
  FROM [dbo].[Region]

 -- hub_supplier
 SELECT HashBytes('MD5',[CompanyName]) hub_shipper_key 
      ,[CompanyName]
      ,[Phone]
	  , CURRENT_TIMESTAMP hub_load_dts 
	  ,'northwind;Shippers' hub_rec_src 	
  FROM [dbo].[Shippers]

-- sat_supplier
SELECT HashBytes('MD5',[CompanyName]) hub_shipper_key 
      ,[ShipperID]
      ,[CompanyName]
      ,[Phone]
	  , HASHBYTES('MD5',CONVERT(nvarchar,[ShipperID]) + ISNULL([Phone],'') ) hash_diff
	  , CURRENT_TIMESTAMP sat_load_dts 
	  , 'northwind;Shippers' sat_rec_src 	
  FROM [dbo].[Shippers]

-- hub_territory
SELECT HashBytes('MD5',[TerritoryID]) hub_territory_key 
      ,[TerritoryID]
	  , CURRENT_TIMESTAMP hub_load_dts 
	  ,'northwind;Territories' hub_rec_src 	
  FROM [dbo].[Territories]

-- sat_territory
SELECT HashBytes( 'MD5',CONVERT(nvarchar,[TerritoryID]) ) hub_territory_key 
      ,[TerritoryID]
      ,[TerritoryDescription]
      ,[RegionID]
	  , HASHBYTES('MD5',CONVERT(nvarchar,[RegionID]) + ISNULL([TerritoryDescription],'')  ) hash_diff
	  , CURRENT_TIMESTAMP sat_load_dts 
	  , 'northwind;Shippers' sat_rec_src 	
  FROM [dbo].[Territories]

