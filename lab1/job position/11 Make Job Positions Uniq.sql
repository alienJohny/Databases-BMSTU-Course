delete from job_position
where id_p not in (
	select min(id_p) as id from job_position
		group by job_position
)
go

alter table job_position drop column id_p

go

alter table job_position
	add
		id int identity(1, 1) not null
go