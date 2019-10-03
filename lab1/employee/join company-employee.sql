use users

go

-- Joins on ids
SELECT *
into tmp
FROM employee e
FULL OUTER JOIN companies c
ON e.id = c.id_cmp

go

-- Got a new table, then we need to drop some columns
alter table tmp drop column id_cmp, sector, city, address

go

drop table employee

go

-- Rename 
EXEC sp_rename 'tmp', 'employee'

go
