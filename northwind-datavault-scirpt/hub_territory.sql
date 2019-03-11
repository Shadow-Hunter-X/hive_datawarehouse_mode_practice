IF OBJECT_ID('sat_territory', 'U') IS NOT NULL 
  DROP TABLE sat_territory; 

IF OBJECT_ID('sat_territory', 'U') IS NULL
CREATE TABLE [sat_territory](
	[hub_territory_key] varbinary(50) NOT NULL , 
	[TerritoryID] [nvarchar](20) NOT NULL,
	[TerritoryDescription] [nchar](50) NOT NULL,
	[RegionID] [int] NOT NULL ,
	[hash_diff] varbinary(50) NOT NULL ,
	[sat_load_dts] [datetime] NOT NULL ,
	[sat_rec_src] varchar(30) NULL 
 CONSTRAINT [PK_Territories] PRIMARY KEY NONCLUSTERED 
(
	[hub_territory_key],[sat_load_dts] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] ; 

------------

IF OBJECT_ID('hub_territory', 'U') IS NOT NULL 
  DROP TABLE hub_territory; 

IF OBJECT_ID('hub_territory', 'U') IS NULL
CREATE TABLE [hub_territory](
	[hub_territory_key] varbinary(50) NOT NULL , 
	[TerritoryID] [nvarchar](20) NOT NULL,
	[hub_load_dts] [datetime] NOT NULL ,
	[hub_rec_src] varchar(30) NOT NULL 
 CONSTRAINT [PK_Hub_Territories] PRIMARY KEY NONCLUSTERED 
(
	[hub_territory_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] ; 

