
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



-- 