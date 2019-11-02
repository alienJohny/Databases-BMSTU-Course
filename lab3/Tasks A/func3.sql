use data

go

/*
    A.3 Examle of the table fucntion
        Transact-SQL Inline Table-Valued Function
        
        RETURNS sets the type to TABLE with the
        definition of columns and their data types
*/
create function dbo.describe_jp ()
returns @tbl table (
    column_name varchar(100),
    max float,
    min float,
    std float,
    variance float,
    count int,
    average float
) as
begin
    insert into @tbl values
        ('salary',
            (select max  (salary) from job_position),
            (select min  (salary) from job_position),
            (select stdev(salary) from job_position),
            (select var  (salary) from job_position),
            (select count(salary) from job_position),
            (select avg  (salary) from job_position)),
        ('company_share',
            (select max  (company_share) from job_position),
            (select min  (company_share) from job_position),
            (select stdev(company_share) from job_position),
            (select var  (company_share) from job_position),
            (select count(company_share) from job_position),
            (select avg  (company_share) from job_position)),
        ('missions',
            (select max  (missions) from job_position),
            (select min  (missions) from job_position),
            (select stdev(missions) from job_position),
            (select var  (missions) from job_position),
            (select count(missions) from job_position),
            (select avg  (missions) from job_position)),
        ('work_hours',
            (select max  (work_hours) from job_position),
            (select min  (work_hours) from job_position),
            (select stdev(work_hours) from job_position),
            (select var  (work_hours) from job_position),
            (select count(work_hours) from job_position),
            (select avg  (work_hours) from job_position)),
        ('sys_access',
            (select max  (sys_access) from job_position),
            (select min  (sys_access) from job_position),
            (select stdev(sys_access) from job_position),
            (select var  (sys_access) from job_position),
            (select count(sys_access) from job_position),
            (select avg  (sys_access) from job_position))
    return 
end
;
