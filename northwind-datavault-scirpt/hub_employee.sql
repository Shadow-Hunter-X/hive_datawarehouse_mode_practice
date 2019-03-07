
IF OBJECT_ID('sat_employee', 'U') IS NOT NULL 
  DROP TABLE sat_employee; 

IF OBJECT_ID('sat_employee', 'U') IS NULL
CREATE TABLE [sat_employee](
	[hub_employee_key] varchar(36) NOT NULL ,
	[EmployeeID] [int] NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[FirstName] [nvarchar](10) NOT NULL,
	[Title] [nvarchar](30) NULL,
	[TitleOfCourtesy] [nvarchar](25) NULL,
	[BirthDate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[HomePhone] [nvarchar](24) NULL,
	[Extension] [nvarchar](4) NULL,
	[Photo] [image] NULL,
	[Notes] [ntext] NULL,
	[ReportsTo] [int] NULL,
	[PhotoPath] [nvarchar](255) NULL,
	[hash_diff] varchar(36) NOT NULL ,
	[sat_load_dts] [datetime] NOT NULL ,
	[sat_rec_src] varchar(30) NULL 
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[hub_employee_key] , [sat_load_dts]  ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

-----------
IF OBJECT_ID('hub_employee', 'U') IS NOT NULL 
  DROP TABLE hub_employee; 

IF OBJECT_ID('hub_employee', 'U') IS NULL
CREATE TABLE [hub_employee](
	[hub_employee_key] varchar(36) NOT NULL ,
	[EmployeeID] [int] NOT NULL,
	[last_name] [nvarchar](10) NOT NULL,
	[hub_load_dts] [datetime] NOT NULL ,
	[hub_rec_src] varchar(30) NOT NULL 
 CONSTRAINT [PK_Hub_Employees] PRIMARY KEY CLUSTERED 
(
	[hub_employee_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 

GO




