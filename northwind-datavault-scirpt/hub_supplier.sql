  IF OBJECT_ID('sat_supplier', 'U') IS NOT NULL 
  DROP TABLE sat_supplier; 

IF OBJECT_ID('sat_supplier', 'U') IS NULL
CREATE TABLE [sat_supplier](
	[hub_supplier_key] varbinary(50) NOT NULL , 
	[SupplierID] [int]  NOT NULL,
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
	[HomePage] [ntext] NULL,
	[hash_diff] varbinary(50) NOT NULL ,
	[sat_load_dts] [datetime] NOT NULL 
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[hub_supplier_key],[sat_load_dts] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

-------------- 

IF OBJECT_ID('hub_supplier', 'U') IS NOT NULL 
  DROP TABLE hub_supplier; 

IF OBJECT_ID('hub_supplier', 'U') IS NULL
CREATE TABLE [hub_supplier](
	[hub_supplier_key] varbinary(50) NOT NULL , 
	[CompanyName] [nvarchar](40) NOT NULL ,
	[hub_load_dts] [datetime] NOT NULL ,
	[hub_rec_src] varchar(30) NOT NULL 
 CONSTRAINT [PK_Hub_Supplier] PRIMARY KEY CLUSTERED 
(
	[hub_supplier_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] ;

GO
