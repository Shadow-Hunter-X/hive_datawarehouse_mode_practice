
-- 1 link_order_customer
SELECT HashBytes('MD5',Customers.CustomerID+ CONVERT(varchar,Orders.orderid)
               + CONVERT(nvarchar,detail.ProductID)) link_order_customer_key ,
       HashBytes('MD5',Customers.CustomerID) hub_customer_key ,
       Customers.CustomerID , 
       HashBytes('MD5',CONVERT(varchar,Orders.orderid)+CONVERT(nvarchar,detail.ProductID)) hub_order_key ,
	   detail.orderid , detail.ProductID ,
	   CURRENT_TIMESTAMP link_load_dts ,
	   'northwind;customers;Orders' link_rec_src
FROM [Order Details] detail 
LEFT JOIN [Orders] orders ON detail.OrderID=orders.OrderID
INNER JOIN Customers 
ON Orders.CustomerID = Customers.CustomerID ;

-- 2 link_order_employee
SELECT HashBytes('MD5',CONVERT(varchar,employees.EmployeeID) + employees.LastName 
       + CONVERT(varchar,detail.orderid) + CONVERT(nvarchar,detail.ProductID)) link_order_employee_key ,
       HashBytes('MD5',CONVERT(varchar,Orders.orderid)+CONVERT(nvarchar,detail.ProductID)) hub_order_key ,
	   detail.OrderID , detail.ProductID ,
	   HashBytes('MD5',CONVERT(varchar,employees.EmployeeID) + employees.LastName) hub_employee_key ,
	   Employees.EmployeeID , Employees.LastName ,
	   CURRENT_TIMESTAMP link_load_dts ,
	   'northwind;employees;Orders' link_rec_src
FROM [Order Details] detail
LEFT JOIN [Orders] orders ON detail.OrderID=orders.OrderID
INNER JOIN employees ON Orders.EmployeeID = employees.EmployeeID

-- 3 link_order_shipper
SELECT HashBytes('MD5',CONVERT(varchar,Shippers.CompanyName) + CONVERT(varchar,detail.orderid)
                + CONVERT(nvarchar,detail.ProductID) ) link_order_shipper_key ,
	   HashBytes('MD5',CONVERT(varchar,Orders.orderid)) hub_shipper_key ,
	   Shippers.CompanyName ,
       HashBytes('MD5',CONVERT(varchar,Orders.orderid)+CONVERT(nvarchar,detail.ProductID)) hub_order_key ,
	   detail.OrderID , detail.ProductID , 
	   CURRENT_TIMESTAMP link_load_dts ,
	   'northwind;Shippers;Orders' link_rec_src
FROM [Order Details] detail 
LEFT JOIN [Orders] orders ON detail.OrderID=orders.OrderID
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID

-- 4 link_order_product
SELECT HashBytes('MD5',CONVERT(varchar,Products.ProductName) + CONVERT(varchar,detail.orderid)
                + CONVERT(nvarchar,detail.ProductID) ) link_order_product_key ,
	   HashBytes('MD5',CONVERT(varchar,Orders.orderid)+CONVERT(nvarchar,detail.ProductID)) hub_product_key ,
	   Products.ProductName ,
       HashBytes('MD5',CONVERT(varchar,Orders.orderid)+CONVERT(nvarchar,detail.ProductID)) hub_order_key ,
	   detail.OrderID , detail.ProductID , 
	   CURRENT_TIMESTAMP link_load_dts ,
	   'northwind;Shippers;Orders' link_rec_src
FROM [Order Details] detail 
LEFT JOIN [Orders] orders ON detail.OrderID=orders.OrderID
INNER JOIN Products ON detail.ProductID = products.ProductID

-- 5 link_employee_territory

SELECT HashBytes('MD5', CONVERT(varchar,EmployeeTerritories.TerritoryID) + Employees.LastName
                       +CONVERT(varchar,Employees.EmployeeID)) link_employee_territory_key ,
       HashBytes('MD5',CONVERT(varchar,EmployeeTerritories.TerritoryID)) hub_territory_key ,
	   HashBytes('MD5',CONVERT(varchar,Employees.EmployeeID) + Employees.LastName) hub_employee_key ,
	   EmployeeTerritories.TerritoryID , 
	   Employees.EmployeeID ,
	   Employees.LastName , 
	   CURRENT_TIMESTAMP link_load_dts ,
	   'northwind;Territories;Employees' link_rec_src
FROM 
EmployeeTerritories INNER JOIN Employees 
ON EmployeeTerritories.EmployeeID = Employees.EmployeeID ;

-- 6 link_product_supplier
SELECT HashBytes('MD5',Products.ProductName + Suppliers.CompanyName ) link_product_supplier_key
	   , HashBytes('MD5',Suppliers.CompanyName ) hub_supplier_key
       , Suppliers.CompanyName 
	   , HashBytes('MD5',Products.ProductName ) hub_product_key
	   , Products.ProductName
	   , CURRENT_TIMESTAMP link_load_dts 
	   , 'northwind;Products;Suppliers' link_rec_src
FROM Products INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID

-- 7 link_territory_region
SELECT HashBytes('MD5',Territories.TerritoryID + CONVERT(varchar,Region.RegionID)
                 + Region.RegionDescription ) link_territory_region_key
	   ,HashBytes('MD5',Territories.TerritoryID) hub_territory_key
	   ,Territories.TerritoryID
	   ,HashBytes('MD5',CONVERT(varchar,Region.RegionID) + Region.RegionDescription ) hub_region_key
	   ,Region.RegionID
	   ,Region.RegionDescription
	   , CURRENT_TIMESTAMP link_load_dts 
	   , 'northwind;Region;Territories' link_rec_src
FROM Territories INNER JOIN Region ON Territories.RegionID = Region.RegionID