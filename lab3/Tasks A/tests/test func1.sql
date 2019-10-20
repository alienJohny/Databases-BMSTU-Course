create table ##test (
    id int identity(1, 1) not null,
    expected float,
    true float
)

go

insert into ##test
    values
        (12.5, (select dbo._percent(50, 25))),
        (25, (select dbo._percent(100, 25))),
        (1, (select dbo._percent(100, 1))),
        (125, (select dbo._percent(100, 125)))

go

select *,
       case
           when expected = true
               then 'OK'
           else 'ERROR'
       end as 'Result'
from ##test

go

drop table ##test

go