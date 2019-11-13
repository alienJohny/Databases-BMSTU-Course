use data

go

/*
    A.4 Recursive CTE factorial function
*/
create function dbo.ret ()
returns varchar
as
begin
    declare @n varchar;

    with CTE (company)
    AS
    (
        SELECT company
        FROM employee 
        WHERE employee.gender = 'Male'

        UNION ALL

        SELECT C.company
        FROM companies C JOIN CTE ON C.company = CTE.company
        where C.sector = 'IT'
    )
    select @n = (select top 1 company from CTE)
    from CTE
   
    return (@n)
end
;
