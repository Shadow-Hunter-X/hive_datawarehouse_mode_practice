IF OBJECT_ID('link_order_product', 'U') IS NOT NULL 
  DROP TABLE link_employee_territory; 

IF OBJECT_ID('link_order_product', 'U') IS NULL
CREATE TABLE [link_order_product](
	[link_order_product_key] varbinary(50) NOT NULL , 
	[hub_product_key] varbinary(50) NOT NULL , 
	[ProductName] [nvarchar](40) NOT NULL,
	[hub_order_key] varbinary(50) NOT NULL , 
	[orderid] [int] NOT NULL ,
	[ProductID] [int] NOT NULL , 
	[link_load_dts] [datetime] NOT NULL,
	[link_rec_src] varchar(30) NULL 
 CONSTRAINT [PK_order_product] PRIMARY KEY CLUSTERED 
(
	[link_order_product_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] ;

GO
