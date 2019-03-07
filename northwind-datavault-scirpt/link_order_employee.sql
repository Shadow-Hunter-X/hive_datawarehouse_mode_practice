IF OBJECT_ID('link_order_employee', 'U') IS NOT NULL 
  DROP TABLE link_employee_territory; 

IF OBJECT_ID('link_order_employee', 'U') IS NULL
CREATE TABLE [link_order_employee](
	[link_order_employee_key] varchar(36) NOT NULL , 
	[hub_order_key] varchar(36) NOT NULL , 
	[orderid] [int] NOT NULL ,
	[hub_employee_key] varchar(36) NOT NULL ,
	[EmployeeID] [int] NOT NULL,
	[last_name] [nvarchar](10) NOT NULL,
	[link_load_dts] [datetime] NOT NULL,
	[link_rec_src] varchar(30) NULL 
 CONSTRAINT [PK_employee_territory] PRIMARY KEY CLUSTERED 
(
	[link_order_employee_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] ;

GO

SELECT  
     
FROM 
Orders INNER JOIN employees 
ON Orders.EmployeeID = employees.EmployeeID
