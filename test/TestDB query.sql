CREATE TABLE TestTable3 (
	[ProductId] [INT] IDENTITY(1,1) NOT NULL,
	[ProductName] [VARCHAR](100) NOT NULL,
	[Weight] [DECIMAL](18, 2) NULL,
	[Price] [Money] NULL,
	[Summa] AS ([Weight] * [Price]) PERSISTED
)