IF OBJECT_ID('link_order_employee', 'U') IS NOT NULL 
  DROP TABLE link_employee_territory; 

IF OBJECT_ID('link_order_employee', 'U') IS NULL
CREATE TABLE [link_order_employee](
	[link_order_employee_key] varbinary(50) NOT NULL , 
	[hub_order_key] varbinary(50) NOT NULL , 
	[orderid] [int] NOT NULL ,
	[ProductID] [int] NOT NULL , 
	[hub_employee_key] varbinary(50) NOT NULL ,
	[EmployeeID] [int] NOT NULL,
	[lastname] [nvarchar](10) NOT NULL,
	[link_load_dts] [datetime] NOT NULL,
	[link_rec_src] varchar(30) NULL 
 CONSTRAINT [PK_employee_territory] PRIMARY KEY CLUSTERED 
(
	[link_order_employee_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] ;

GO


