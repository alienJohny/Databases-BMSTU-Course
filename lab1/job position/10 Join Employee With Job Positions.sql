use data

go

-- Joins on ids
SELECT *
into tmp
FROM employee e
FULL OUTER JOIN job_position c
ON e.id = c.id_p

go


-- Got a new table, then we need to drop some columns
alter table tmp drop column id_p, sys_access, work_hours, missions, company_share, salary

go

drop table employee

go

-- Rename 
EXEC sp_rename 'tmp', 'employee'

go

