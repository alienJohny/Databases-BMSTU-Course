sp_configure 'clr enabled', 1
go
reconfigure
go

CREATE ASSEMBLY CLRFunctions FROM 'C:\Users\Artur\Desktop\Databases-BMSTU-Course\lab4\3.dll'
go

/*
drop function SplitStringCLR
drop assembly CLRFunctions
*/

CREATE FUNCTION [dbo].SplitStringCLR(@text [nvarchar](max), @delimiter [nchar](1))
RETURNS TABLE (
part nvarchar(max),
ID_ODER int
) WITH EXECUTE AS CALLER
AS
EXTERNAL NAME CLRFunctions.UserDefinedFunctions.SplitString

