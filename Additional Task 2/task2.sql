create database task2

go

use task2

go

create table staff (
    id int identity(1, 1) not null,
    fio varchar(250) not null
)

create table staff_lack (
    id int identity(1, 1) not null,
    id_staff int not null,
    [date] date not null,
    type int not null
)

create table lack_type (
    id int identity(1, 1) not null,
    type varchar(250) not null
)

go

insert into staff
    values
        ('Ivanov Ivan Ivanovich'),
        ('Petrov Petr Petrovich'),
        ('Popov Alexei Mihailovich')

insert into staff_lack
    values
        (1, '2020-01-20', 1),
        (1, '2020-01-21', 1),
        (1, '2020-01-22', 1),
        (1, '2020-01-23', 1),
        (1, '2020-01-25', 3),
        (1, '2020-01-26', 3),
        (2, '2020-01-22', 2),
        (2, '2020-01-23', 2)

insert into lack_type
    values
        ('At his own expense'),
        ('Disease'),
        ('Billable')

-- drop table staff
-- select * from staff
-- select * from staff_lack
-- select * from lack_type

select * from
staff_lack sl
join staff s
on sl.id_staff = s.id
join lack_type lt
on sl.type = lt.id

/*
select row_number() over () as id, *
from (
    select distinct *
    from (select fio,
                 min(date) over (partition by id_staff, staff_lack.type),
                 max(date) over (partition by id_staff, staff_lack.type),
                 lack_type.type
            from staff_lack
            join staff on staff_lack.id = staff.id
            join lack_type on staff_lack.type = lack_type.id
    ) as almready
) as ready;
*/

/*
select *
from staff_lack
join staff on staff_lack.id_staff = staff.id
join lack_type on staff_lack.type = lack_type.id
*/

select distinct * from (
    select fio,
           lack_type.type,
           min(date) over (partition by id_staff, lack_type.type) as 'start',
           max(date) over (partition by id_staff, lack_type.type) as 'end'
    from staff_lack
    join staff on staff_lack.id_staff = staff.id
    join lack_type on staff_lack.type = lack_type.id
) as tmp1


