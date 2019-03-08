
-- link_order_customer
SELECT HashBytes('MD5',Customers.CustomerID+ CONVERT(varchar,Orders.orderid)) link_order_customer_key ,
       HashBytes('MD5',Customers.CustomerID) hub_customer_key ,
       Customers.CustomerID , 
       HashBytes('MD5',CONVERT(varchar,Orders.orderid)) hub_order_key ,
	   Orders.orderid , 
	   CURRENT_TIMESTAMP link_load_dts ,
	   'northwind;customers;Orders' link_rec_src
FROM Orders INNER JOIN Customers 
ON Orders.CustomerID = Customers.CustomerID ;


-- link_order_employee
SELECT HashBytes('MD5',CONVERT(varchar,employees.EmployeeID) + employees.LastName + CONVERT(varchar,Orders.orderid)) link_order_customer_key ,
       HashBytes('MD5',CONVERT(varchar,Orders.orderid)) hub_order_key ,
	   Orders.OrderID , 
	   HashBytes('MD5',CONVERT(varchar,employees.EmployeeID) + employees.LastName) hub_customer_key ,
	   Employees.EmployeeID , Employees.LastName ,
	   CURRENT_TIMESTAMP link_load_dts ,
	   'northwind;employees;Orders' link_rec_src
FROM Orders INNER JOIN employees 
ON Orders.EmployeeID = employees.EmployeeID

-- link_order_shipper
SELECT HashBytes('MD5',CONVERT(varchar,Shippers.CompanyName) + CONVERT(varchar,Orders.orderid)) link_order_shipper_key ,
	   HashBytes('MD5',CONVERT(varchar,Orders.orderid)) hub_shipper_key ,
	   Shippers.CompanyName ,
       HashBytes('MD5',CONVERT(varchar,Orders.orderid)) hub_order_key ,
	   Orders.OrderID ,
	   CURRENT_TIMESTAMP link_load_dts ,
	   'northwind;Shippers;Orders' link_rec_src
FROM
Orders LEFT JOIN Shippers
ON Orders.ShipVia = Shippers.ShipperID

-- link_employee_territory_key

SELECT HashBytes('MD5', CONVERT(varchar,EmployeeTerritories.TerritoryID) + Employees.LastName
                       +CONVERT(varchar,EmployeeTerritories.EmployeeID)) link_employee_territory_key ,
       HashBytes('MD5',CONVERT(varchar,EmployeeTerritories.TerritoryID)) hub_territory_key ,
	   HashBytes('MD5',CONVERT(varchar,EmployeeTerritories.EmployeeID) + Employees.LastName) hub_employee_key ,
	   EmployeeTerritories.TerritoryID , 
	   Employees.EmployeeID ,
	   Employees.LastName , 
	   CURRENT_TIMESTAMP link_load_dts ,
	   'northwind;Territories;Employees' link_rec_src
FROM 
EmployeeTerritories LEFT JOIN Employees 
ON EmployeeTerritories.EmployeeID = Employees.EmployeeID ;


-- 