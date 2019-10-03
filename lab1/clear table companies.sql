delete from companies
where id not in (
	select min(id) as id from companies
		group by company
)