IF OBJECT_ID('link_employee_territory', 'U') IS NOT NULL 
  DROP TABLE link_employee_territory; 

IF OBJECT_ID('link_employee_territory', 'U') IS NULL
CREATE TABLE [link_employee_territory](
	[link_employee_territory_key] varchar(36) NOT NULL , 
	[hub_territory_key] varchar(36) NOT NULL , 
	[hub_employee_key] varchar(36) NOT NULL ,
	[TerritoryID] [nvarchar](20) NOT NULL,
	[EmployeeID] [int] NOT NULL ,
	[last_name] [nvarchar](10) NOT NULL,
	[link_load_dts] [datetime] NOT NULL,
	[link_rec_src] varchar(30) NULL 
 CONSTRAINT [PK_link_Customers] PRIMARY KEY CLUSTERED 
(
	[link_employee_territory_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] ;

GO

