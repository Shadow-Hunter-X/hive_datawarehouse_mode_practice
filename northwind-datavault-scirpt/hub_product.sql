IF OBJECT_ID('sat_product', 'U') IS NOT NULL 
  DROP TABLE sat_product; 

IF OBJECT_ID('sat_product', 'U') IS NULL
CREATE TABLE [sat_product](
	[hub_product_key] varbinary(50) NOT NULL , 
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[QuantityPerUnit] [nvarchar](20) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[UnitsOnOrder] [smallint] NULL,
	[ReorderLevel] [smallint] NULL,
	[Discontinued] [bit] NOT NULL,
	[hash_diff] varbinary(50) NOT NULL ,
	[sat_load_dts] [datetime] NOT NULL ,
	[sat_rec_src] varchar(30)  NULL 
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[hub_product_key],[sat_load_dts] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] ;

-------- hub_product

IF OBJECT_ID('hub_product', 'U') IS NOT NULL 
  DROP TABLE hub_product; 

IF OBJECT_ID('hub_product', 'U') IS NULL
CREATE TABLE [hub_product](
    [hub_product_key] varbinary(50) NOT NULL , 
	[ProductName] [nvarchar](40) NOT NULL,
	[hub_load_dts] [datetime] NOT NULL ,
	[hub_rec_src] varchar(30) NOT NULL 
 CONSTRAINT [PK_Hub_Products] PRIMARY KEY CLUSTERED 
(
	[hub_product_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] ;