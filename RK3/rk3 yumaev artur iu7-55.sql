-- ВАРИАНТ 2

create database RK3

go

use RK3

go

/* === Задание 1 === */
-- Задание 1.1
create table filials (
	id_fil int identity(1, 1) not null,
	[name] varchar(500) not null,
    [address] varchar(500) not null,
    [phone] varchar(200) not null
)

create table employee (
	id int identity(1, 1) not null,
	[fio] varchar(250) not null,
    [bd] date not null,
    department varchar(250) not null,
    filial_code int not null
)

insert into filials
values
    (N'Moskovskij filial', N'Gercena, 5', '89995556699'),
    (N'Moskovskij filial', N'Gercena, 6', '89995556694'),
    (N'Moskovskij filial', N'Gercena, 7', '89995556695'),
    (N'Kievskij filial',   N'Ordzhonikidze, 10', '89995556696'),
    (N'Tomskij filial',    N'Ordzhonikidze, 5', '89995556697'),
    (N'Kievskij filial',   N'Lenina, 59', '89995556798'),
    (N'Moskovskij filial', N'Lenina, 19', '89953346699'),
    (N'Tomskij filial',            N'Lenina, 5b', '89995587699'),
    (N'Kievskij filial',   N'Prospekt Vernadskogo, 1', '89555676699'),
    (N'Tomskij filial',            N'Prospekt Vernadskogo, 6', '89956694259')


insert into employee
values
        (N'Ivanov Ivan Ivanovich', '1970-06-23', N'IT', 1),
        (N'Olegovna Tatiana Petrovna', '1971-06-23', N'IT', 2), 
        (N'Petrov Oleg Aleksandrovich', '1972-06-13', N'Sales', 3), 
        (N'Buzhin Sergej Mihajlovich', '1973-06-23', N'Prodazhi', 4), 
        (N'Petrov Aleksand Alekseevich', '1974-06-23', N'Razrabotka', 5), 
        (N'Ivanov Ivan Olegovich', '1975-06-27', N'Razrabotka', 8),
        (N'Petrov Nikolaj Aleksandrovich', '1976-06-3',  N'Razrabotka', 6), 
        (N'Skvorcova Elena Mihajlovna', '1977-06-9',  N'Razrabotka', 7),
        (N'Ivanova Svetlana Alekseevna', '1993-06-23', N'Buhgalterija', 9), 
        (N'Popov Jurij Mihajlovich', '1993-06-23', N'Buhgalterija', 10),
        (N'Trubicyn Nikola', '1993-06-23', N'Buhgalterija', 10),
        (N'Aleksej Mihajlovich Gorov', '1993-06-23', N'Buhgalterija', 10),
        (N'Buzhin Sergej Mihajlovich', '1993-06-23', N'Buhgalterija', 10),
        (N'Ivanov Ivan Ivanovich', '1993-06-23', N'Buhgalterija', 10),
        (N'Petrov Oleg Aleksandrovich', '1993-06-23', N'Buhgalterija', 10)

-- Задание 1.2
-- drop function dbo.f1
select dbo.f1()


