use data
go

sp_configure 'clr enabled', 1
go
reconfigure
go

CREATE ASSEMBLY FirstUdf FROM 'C:\Users\Artur\Desktop\Databases-BMSTU-Course\lab4\1.dll'
go

/*
drop function CountSalesOrderHeader
drop assembly CLRFunctions
*/
  
CREATE FUNCTION CountSalesOrderHeader() RETURNS INT   
AS EXTERNAL NAME FirstUdf.T.ReturnOrderCount;   
GO  
  
-- SELECT dbo.CountSalesOrderHeader();  