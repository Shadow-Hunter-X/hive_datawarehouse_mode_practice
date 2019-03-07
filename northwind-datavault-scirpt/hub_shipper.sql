IF OBJECT_ID('sat_shipper', 'U') IS NOT NULL 
  DROP TABLE sat_shipper; 

IF OBJECT_ID('sat_shipper', 'U') IS NULL
CREATE TABLE [sat_shipper](
	[hub_shipper_key] varchar(36) NOT NULL , 
	[ShipperID] [int]  NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[Phone] [nvarchar](24) NULL ,
	[hash_diff] varchar(36) NOT NULL ,
	[sat_load_dts] [datetime] NOT NULL ,
	[sat_rec_src] varchar(30)  NULL 
 CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED 
(
	[hub_shipper_key] ,[sat_load_dts] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

------------

IF OBJECT_ID('hub_shipper', 'U') IS NOT NULL 
  DROP TABLE hub_shipper; 

IF OBJECT_ID('hub_shipper', 'U') IS NULL
CREATE TABLE [hub_shipper](
	[hub_shipper_key] varchar(36) NOT NULL , 
	[CompanyName] [nvarchar](40) NOT NULL,
	[hub_load_dts] [datetime] NOT NULL ,
	[hub_rec_src] varchar(30) NOT NULL 
 CONSTRAINT [PK_Hub_Shippers] PRIMARY KEY CLUSTERED 
(
	[hub_shipper_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

