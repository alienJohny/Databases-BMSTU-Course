-- ЮМАЕВ АРТУР ИУ7-55 РК2 ВАРИАНТ 3

--                                       ***** ЗАДАНИЕ 1 *****
-- Создание базы данных
create database RK2
use RK2

go

-- Создание таблицы ПРЕПОДАВАТЕЛИ
create table teachers (
	PK int identity(1, 1) not null,
	[FIO] varchar (200) not null, -- ФИО
    [degree] varchar(200) not null, -- СТЕПЕНЬ
    [position] varchar(200) not null, -- ДОЛЖНОСТЬ
	[faculty] varchar(200) not null -- КАФЕДРА
)

create table faculty (
    PK int identity(1, 1) not null,
    [fac_name] varchar (200) not null, -- название кафедры,
    [description] varchar (500) not null --  описание
)

create table school_subject( -- БД предмет
    PK int identity(1, 1) not null,
    [name] varchar (200) not null, -- название предмета,
    [hours] int not null, -- кол-во часов,
    [semester] int not null, -- семестр,
    [rate] float not null -- рейтинг
)

go

-- Связующая таблица между таблицей
-- преподаватели и предмет
create table TS (
    [FIO] varchar (200) not null, -- ФИО
    [name] varchar (200) not null -- название предмета,
)

-- Заполнение таблицы кафедра
insert into faculty -- кафедра
	values
        ('iu7', 'the best faculty in the whole universe'),
        ('fn11', ':((((((('),
        ('rk1', ':/'),
        ('iu6', 'descr'),
        ('iu5', 'radioelectronics'),
        ('fn12', 'mathematics'),
        ('iu8', 'inf security'),
        ('iu11', 'chipher'),
        ('another one', '...'),
        ('another two', '...')

go

select * from faculty

insert into teachers -- табоица учителя
	values
		('tassov kirill leonidovich', 'phd', 'lecturer', 'iu7'),
		('tassov kirill leonidovich', 'phd', 'semenarist', 'iu7'),
		('barichnikova l. k.', 'phd', 'lecturer', 'iu7'),
		('ivanov ovan ivanovich', 'phd', 'lecturer', 'fn11'),
		('borisov k. p.', 'master', 'lecturer', 'fn11'),
		('petrov t. t.', 'master', 'semenarist', 'fn11'),
		('bolshov o. p.', 'phd', 'lecturer', 'rk1'),
		('vlasov b. b.', 'phd', 'researcher', 'rk1'),
		('winogradov e. p.', 'phd', 'lecturer', 'rk1'),
		('pokrovski w. w.', 'phd', 'researcher', 'iu7')

go

insert into TS -- связующая таблица
	values
		('tassov kirill leonidovich', 'programming'),
		('tassov kirill leonidovich', 'programming'),
		('barichnikova l. k.', 'programming'),
		('ivanov ovan ivanovich', 'python'),
		('borisov k. p.', 'python'),
		('petrov t. t.', 'algorithms'),
		('bolshov o. p.', 'databases'),
		('vlasov b. b.', 'algorithms'),
		('winogradov e. p.', 'databases'),
		('pokrovski w. w.', 'databases')

go

select * from teachers

insert into school_subject -- таболица предметов
	values
        ('programming', 120, 1, 0.2),
        ('c language', 120, 2, 0.89),
        ('python', 80, 2, 0.5),
        ('math', 80, 1, 0.3),
        ('integrals', 180, 2, 0.35),
        ('diff eques', 180, 3, 0.4),
        ('databases', 120, 3, 0.8),
        ('OS', 180, 5, 0.9),
        ('algorithms', 180, 5, 0.3),
        ('linux', 120, 6, 0.9)

go

select * from school_subject


--                                            ***** ЗАДАНИЕ 2 *****
-- Запрос 1
-- Смотрим кол-во предметов,
-- которые идут 180 часов в рамках семестра
select * from RK2.dbo.school_subject
where hours = 180

-- Запрос 2
-- Смотрим сколько предметов у нас есть,
-- по разбиению на количество чисов
select hours,
       COUNT(hours) as 'number of school subjects'
from school_subject
group by hours

-- Запрос 3
-- Сохраняет бэкап базы данных с учителями
select * 
into #teachers_backup
from teachers

