/*
drop assembly MyFirstUdp
drop function 
*/

CREATE ASSEMBLY MyFirstUdp FROM 'C:\Users\Artur\Desktop\Databases-BMSTU-Course\lab4\4.dll'
CREATE PROCEDURE HelloWorld
AS EXTERNAL NAME MyFirstUdp.StoredProcedures.HelloWorld

-- EXEC HelloWorld