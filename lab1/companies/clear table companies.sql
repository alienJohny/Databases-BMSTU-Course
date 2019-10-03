delete from companies
where id_cmp not in (
	select min(id_cmp) as id from companies
		group by company
)