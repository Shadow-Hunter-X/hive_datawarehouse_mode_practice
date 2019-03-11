IF OBJECT_ID('link_territory_region', 'U') IS NOT NULL 
  DROP TABLE link_territory_region; 

IF OBJECT_ID('link_territory_region', 'U') IS NULL
CREATE TABLE [link_territory_region](
	[link_territory_region_key] varbinary(50) NOT NULL , 
	[hub_territory_key] varbinary(50) NOT NULL , 
	[TerritoryID] [nvarchar](20) NOT NULL ,
	[hub_region_key] varbinary(50) NOT NULL ,
	[RegionID] [int] NOT NULL ,
	[RegionDescription] [nchar](50) NOT NULL ,
	[link_load_dts] [datetime] NOT NULL ,
	[link_rec_src] varchar(30) NULL 
 CONSTRAINT [PK_territory_region] PRIMARY KEY CLUSTERED 
(
	[link_territory_region_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] ;

GO