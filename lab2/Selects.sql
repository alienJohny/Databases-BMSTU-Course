/*
	1. Узнать 3 города с самым большим числом работников
*/
/*
select top 3 city, count(*) as cnt from (
	select c.city, e.id
	from employee e
	inner join companies as c
	on e.company = c.company
) as n_tbl
group by city
order by cnt desc

go
*/

/*
	2. Найти имена, фамилии и телефон рабочих,
	родившихся после 80го года
*/
select e.first_name, e.last_name, e.phone_number, p.issue_date
from employee e
inner join passports as p on e.PASSPORT_FK = p.id
where issue_date > '1980-01-01'
order by issue_date