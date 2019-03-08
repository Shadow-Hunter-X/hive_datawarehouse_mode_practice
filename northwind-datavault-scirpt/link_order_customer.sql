IF OBJECT_ID('link_order_customer', 'U') IS NOT NULL 
  DROP TABLE link_order_customer; 

IF OBJECT_ID('link_order_customer', 'U') IS NULL
CREATE TABLE [link_order_customer](
	[link_order_customer_key] varchar(36) NOT NULL , 
	[hub_customer_key] varchar(36) NOT NULL , 
	[CustomerID] [nchar](5) NOT NULL ,
	[hub_order_key] varchar(36) NOT NULL , 
	[orderid] [int] NOT NULL ,
	[ProductID] [int] NOT NULL , 
	[link_load_dts] [datetime] NOT NULL ,
	[link_rec_src] varchar(30) NULL
 CONSTRAINT [PK_order_customer] PRIMARY KEY CLUSTERED 
(
	[link_order_customer_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] ;

GO

