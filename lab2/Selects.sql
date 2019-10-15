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
*/

/*
	2. Найти имена, фамилии и телефон рабочих,
	у которых паспорт был выдан после 80го года
*/
/*
select e.first_name, e.last_name, e.phone_number, p.issue_date
from employee e
inner join passports as p on e.PASSPORT_FK = p.id
where issue_date > '1980-01-01' -- between '1980-01-01' and (select max(issue_date) from passports)
order by issue_date
*/

/*
	3. Найти работников, с почтой на Яндексе
*/
/*
select first_name, last_name, phone_number from employee
where email like '%yandex%'
*/

/*
	4. Получить контакты работников из Китая,
	отсортированные по имени
*/
/*
select first_name, last_name, phone_number from employee
where id in (
	select id from passports
	where issue_country = 'China'
)
order by first_name
*/

/*
	5. Найти всех вице президентов компаний,
	у которых з/п больше любых Web-специалистов

*/
/*
select job_position from job_position
where job_position like 'VP%' and salary > ALL (
	select salary from job_position
	where job_position like 'Web%'
)
*/

/*
	6. Отсортировать людей по признаку взрослый/ребенок
	и вывести значение в новый столбец
*/
/*
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
*/

/*
	7. 
*/
