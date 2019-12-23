-- drop assembly MyAgg

CREATE ASSEMBLY MyAgg FROM 'C:\Users\Artur\Desktop\Databases-BMSTU-Course\lab4\2.dll';  
GO  

CREATE AGGREGATE MyAgg (@input nvarchar(200)) RETURNS nvarchar(max)  
EXTERNAL NAME MyAgg.Concatenate;

