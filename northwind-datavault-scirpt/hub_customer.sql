IF OBJECT_ID('sat_customer', 'U') IS NOT NULL 
  DROP TABLE sat_customer; 

GO

IF OBJECT_ID('sat_customer', 'U') IS NULL
CREATE TABLE [sat_customer](
	[hub_customer_key] varbinary(50) NOT NULL , 
	[CustomerID] [nchar](5) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](30) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[Phone] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL,
	[hash_diff] varbinary(50) NOT NULL ,
	[sat_load_dts] [datetime] NOT NULL ,
	[sat_rec_src] varchar(30)  NULL 
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[hub_customer_key] ,[sat_load_dts] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--------------------------------

IF OBJECT_ID('hub_customer', 'U') IS NOT NULL 
  DROP TABLE hub_customer; 

IF OBJECT_ID('hub_customer', 'U') IS NULL
CREATE TABLE [hub_customer](
    [hub_customer_key] varbinary(50) NOT NULL , 
	[CustomerID] [nchar](5) NOT NULL ,
	[hub_load_dts] [datetime] NOT NULL ,
	[hub_rec_src] varchar(30) NOT NULL 
 CONSTRAINT [PK_Hub_Customers] PRIMARY KEY CLUSTERED 
(
	[hub_customer_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


