create table TestTable (
	[ProductID] [int] IDENTITY(1, 1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ProductName] [varchar] (100) NOT NULL,
	[Price] [money] NULL
)

go

create table TestTable2 (
	[ProductID] [int] IDENTITY(1, 1) NOT NULL,
	[CategoryName] [varchar] (100) NOT NULL
)

go
