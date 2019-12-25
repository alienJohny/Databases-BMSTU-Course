use data

-- XML AUTO
/*
The AUTO mode generates nesting in the resulting XML by using heuristics based on the way the SELECT statement is specified.
*/
select * from
companies
for xml auto

-- XML RAW
/*
The RAW mode generates a single <row> element per row in the rowset that is returned by the SELECT statement.
*/
select * from
companies
for xml raw

-- XML EXPLICIT
/*
The EXPLICIT mode allows more control over the shape of the XML.
Пользволяет получить более гибкий контроль над структурой XML документа
*/
use task2

go

select 1 as Tag,
       NULL as Parent,
       staff.fio as 'staff!1!fio',
       staff_lack.date as 'staff!1!lack_date',
       lack_type.type as 'staff!1!lack'
    from staff_lack
    join staff on staff_lack.id_staff = staff.id
    join lack_type on staff_lack.type = lack_type.id
for xml explicit

-- FOR XML PATH
/*
    Cледующий результат представляет собой элементный XML,
    в котором значение каждого столбца в итоговом наборе строк образует элемент.
    Поскольку предложение SELECT не указывает псевдонимы для имен столбцов,
    формируются имена дочерних элементов, совпадающие с именами соответствующих столбцов в предложении SELECT.
    Для каждой строки в наборе строк добавляется тег <line>.
*/

use data

select * from
companies
for xml path('line')

-- === ЗАДАНИЕ 2 OPENXML ===

DECLARE @DocHandle int  
DECLARE @XmlDocument nvarchar(1000)  
SET @XmlDocument = N'<ROOT>  
<Customer CustomerID="VINET" ContactName="Paul Henriot">  
   <Order OrderID="10248" CustomerID="VINET" EmployeeID="5"   
          OrderDate="1996-07-04T00:00:00">  
      <OrderDetail ProductID="11" Quantity="12"/>  
      <OrderDetail ProductID="42" Quantity="10"/>  
   </Order>  
</Customer>  
<Customer CustomerID="LILAS" ContactName="Carlos Gonzlez">  
   <Order OrderID="10283" CustomerID="LILAS" EmployeeID="3"   
          OrderDate="1996-08-16T00:00:00">  
      <OrderDetail ProductID="72" Quantity="3"/>  
   </Order>  
</Customer>  
</ROOT>'  
-- Create an internal representation of the XML document.  
EXEC sp_xml_preparedocument @DocHandle OUTPUT, @XmlDocument  
-- Execute a SELECT statement using OPENXML rowset provider.  
SELECT *  
FROM OPENXML (@DocHandle, '/ROOT/Customer',1)  
      WITH (CustomerID  varchar(10),  
            ContactName varchar(20))  
EXEC sp_xml_removedocument @DocHandle

-- === ЗАДАНИЕ 2 OPENROWSET ===
EXEC sp_configure 'show advanced options', 1
RECONFIGURE

EXEC sp_configure 'Ad Hoc Distributed Queries',1  
reconfigure

SELECT * 
FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0',
                'DatabaseC:\Users\Artur\Desktop\Databases-BMSTU-Course\lab5\MOCK_DATA.xlsx', 
                'SELECT * FROM [Лист1$]');

