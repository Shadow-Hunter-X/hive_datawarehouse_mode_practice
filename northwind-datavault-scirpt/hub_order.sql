-- sat_order 要关联到order_detail
IF OBJECT_ID('sat_order', 'U') IS NOT NULL 
  DROP TABLE hub_order; 

IF OBJECT_ID('sat_order', 'U') IS NULL
CREATE TABLE [sat_order](
    [hub_order_key] varchar(36) , 
	[OrderID] [int] NOT NULL ,
    [ProductID] [int] NOT NULL , 
	[UnitPrice] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[Discount] [real] NOT NULL,
	[CustomerID] [nchar](5) NULL,
	[EmployeeID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[ShipVia] [int] NULL,
	[Freight] [money] NULL,
	[ShipName] [nvarchar](40) NULL,
	[ShipAddress] [nvarchar](60) NULL,
	[ShipCity] [nvarchar](15) NULL,
	[ShipRegion] [nvarchar](15) NULL,
	[ShipPostalCode] [nvarchar](10) NULL,
	[ShipCountry] [nvarchar](15) NULL,
	[hash_diff] varchar(36) NOT NULL ,
	[sat_load_dts] [datetime] NOT NULL ,
	[sat_rec_src] varchar(30)  NULL 
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[hub_order_key],[sat_load_dts] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] ;

-------------------------------------------------------------------------

-- hub_order 
IF OBJECT_ID('hub_order', 'U') IS NOT NULL 
  DROP TABLE hub_order; 

IF OBJECT_ID('hub_order', 'U') IS NULL
CREATE TABLE [hub_order](
    [hub_order_key] varchar(36) NOT NULL , 
	[orderid] [int] NOT NULL ,
	[ProductID] [int] NOT NULL , 
	[hub_load_dts] [datetime] NOT NULL ,
	[hub_rec_src] varchar(30) NOT NULL 
 CONSTRAINT [PK_hub_Orders] PRIMARY KEY CLUSTERED 
(
	[hub_order_key] , [ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] ; 