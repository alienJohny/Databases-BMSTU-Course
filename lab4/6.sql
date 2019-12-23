sp_configure 'clr enabled', 1  
Reconfigure
go

use data
go
  
CREATE ASSEMBLY Point  
FROM 'C:\Users\Artur\Desktop\Databases-BMSTU-Course\lab4\6.dll'   
WITH PERMISSION_SET = SAFE;

CREATE TYPE dbo.Point   
EXTERNAL NAME Point.[Point];