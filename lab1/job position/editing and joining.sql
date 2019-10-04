select job_position
into #jp
from job_position

go

-- Add id column
alter table #jp
add 
	jp_id int identity(1, 1) not null

go

-- Join
select *
into #e_tmp
from employee e
full join #jp jp on jp.jp_id = e.id

go

alter table #e_tmp drop column jp_id

go


drop table employee

go

select * 
into employee
from #jp

go

drop table #jp

go

