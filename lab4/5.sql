CREATE ASSEMBLY ValidationTriggers from 'C:\Users\Artur\Desktop\Databases-BMSTU-Course\lab4\5.dll';  
go  

/*
drop trigger trig_InsertValidator
drop assembly ValidationTriggers
*/

CREATE TRIGGER trig_InsertValidator  
ON employee
FOR INSERT  
AS EXTERNAL NAME ValidationTriggers.Triggers.trig_InsertValidator;  
go

