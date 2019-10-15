/*
	1. Узнать 3 города с самым большим числом работников
*/
select top 3 city, count(*) as cnt from (
	select c.city, e.id
	from employee e
	inner join companies as c
	on e.company = c.company
) as n_tbl
group by city
order by cnt desc

/*
	2. Найти имена, фамилии и телефон рабочих,
	у которых паспорт был выдан после 80го года
*/
select e.first_name, e.last_name, e.phone_number, p.issue_date
from employee e
inner join passports as p on e.PASSPORT_FK = p.id
where issue_date > '1980-01-01' -- between '1980-01-01' and (select max(issue_date) from passports)
order by issue_date

/*
	3. Найти работников, с почтой на Яндексе
*/
select first_name, last_name, phone_number from employee
where email like '%yandex%'

/*
	4. Получить контакты работников из Китая,
	отсортированные по имени
*/
select first_name, last_name, phone_number from employee
where id in (
	select id from passports
	where issue_country = 'China'
)
order by first_name

/*
	5. Найти всех вице президентов компаний,
	у которых з/п больше любых Web-специалистов

*/
select job_position from job_position
where job_position like 'VP%' and salary > ALL (
	select salary from job_position
	where job_position like 'Web%'
)

/*
	6. Отсортировать людей по признаку взрослый/ребенок
	и вывести значение в новый столбец
*/
select p.issue_date,
	   first_name,
	   last_name,
	   phone_number,
	   case 
	       when year(GETDATE()) - year(issue_date) > 18
		       then 'Adult'
		   else 'Child'
	   end as 'Adult/Child'
from employee e 
inner join passports p
on e.PASSPORT_FK = p.id
order by issue_date desc

/*
	7. Сгруппировать и отсортировать компании
	под количеству работников по убыванию
	и сохранить в новую временную таблицу
*/
select c.company, count(*) as n_empl
into #companies_and_employees
from employee e
inner join companies c
on e.company = c.company
group by c.company
order by n_empl desc

go

drop table #companies_and_employees

go

/*
	8. Найти города, в которых средняя зарплата больше 100,000
	используя group by и having
	Отсортировать по средней зп
*/
select city, avg(salary) as sal from (
	select c.company, c.city, e.job_position from employee e
	inner join companies c
	on c.company = e.company
) as nt
inner join job_position jp
on nt.job_position = jp.job_position
group by city
having AVG(salary) > 100000
order by sal desc

/*
	9. tbc...
*/