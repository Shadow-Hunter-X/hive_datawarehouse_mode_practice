IF OBJECT_ID('link_product_supplier', 'U') IS NOT NULL 
  DROP TABLE link_product_supplier; 

IF OBJECT_ID('link_product_supplier', 'U') IS NULL
CREATE TABLE [link_product_supplier](
	[link_product_supplier_key] varchar(36) NOT NULL , 
	[hub_supplier_key] varchar(36) NOT NULL , 
	[CompanyName] [nvarchar](40) NOT NULL,
	[hub_product_key] varchar(36) NOT NULL , 
	[ProductName] [nvarchar](40) NOT NULL,
	[link_load_dts] [datetime] NOT NULL,
	[link_rec_src] varchar(30) NULL 
 CONSTRAINT [PK_product_supplier] PRIMARY KEY CLUSTERED 
(
	[link_product_supplier_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] ;

GO