use data

go

/*
    C.1 Creates simple backup on inserted into the table companies a new row
*/
create trigger backup_companies
on data.dbo.companies
after insert as
begin
    print 'Triggered backup_companies after insert command';

    if OBJECT_ID('companies_backup') is not null
        drop table companies_backup

    select * into companies_backup
    from companies

    print 'Table companies was successfully saved!'
end
;