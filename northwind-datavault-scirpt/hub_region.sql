IF OBJECT_ID('sat_region', 'U') IS NOT NULL 
  DROP TABLE sat_region; 

IF OBJECT_ID('sat_region', 'U') IS NULL
CREATE TABLE [sat_region](
	[hub_region_key] varchar(36) NOT NULL ,
	[RegionID] [int] NOT NULL,
	[RegionDescription] [nchar](50) NOT NULL,
	[hash_diff] varchar(36) NOT NULL ,
	[sat_load_dts] [datetime] NOT NULL ,
	[sat_rec_src] varchar(30)  NULL 
 CONSTRAINT [PK_Region] PRIMARY KEY NONCLUSTERED 
(
	[hub_region_key] ,[sat_load_dts]  ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

------------------------------------------------------------
IF OBJECT_ID('hub_region', 'U') IS NOT NULL 
  DROP TABLE hub_region; 

IF OBJECT_ID('hub_region', 'U') IS NULL
CREATE TABLE [hub_region](
    [hub_region_key] varchar(36) NOT NULL ,
	[RegionID] [int] NOT NULL ,
	[RegionDescription] [nchar](50) NOT NULL ,
	[hub_load_dts] [datetime] NOT NULL ,
	[hub_rec_src] varchar(30) NOT NULL 
 CONSTRAINT [PK_Hub_Region] PRIMARY KEY NONCLUSTERED 
(
	[hub_region_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO