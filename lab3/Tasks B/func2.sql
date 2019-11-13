create procedure dbo.selectCompany
as
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
    SELECT *
    FROM CTE
GO