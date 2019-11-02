use data

go

create function get_user_data (
    @phone_number varchar(100)
)
returns table as
return (
    select username,
           password,
           first_name,
           last_name,
           email,
           phone_number,
           gender,
           insurance_company,
           department,
           university,
           credit_card_type,
           credit_card_number,
           shirt_size,
           C.company, C.city, C.sector, C.address,
           JP.job_position, JP.company_share, JP.missions, JP.salary, JP.work_hours, JP.sys_access,
           P.serial, P.number, P.issue_date, P.issue_country, P.GUID, P.SSN
    from employee e
        inner join passports P
            on P.id = e.PASSPORT_FK
        inner join companies C
            on C.id = e.id
        inner join job_position JP
            on JP.job_position = e.job_position
    where e.phone_number = @phone_number
)
;