sp_configure 'clr enabled', 1
go
reconfigure


CREATE ASSEMBLY CLRFunctions FROM 'C:\Users\Artur\Desktop\Databases-BMSTU-Course\lab4\3\scalar.dll'
go


select * from employee