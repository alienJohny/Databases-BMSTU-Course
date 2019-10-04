delete from companies
where id_cmp not in (
	select min(id_cmp) as id from companies
		group by company
)
go

alter table companies drop column id_cmp

go

alter table companies
	add
		id int identity(1, 1) not null
go