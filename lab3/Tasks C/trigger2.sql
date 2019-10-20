use data

go

/*
    C.2 The same rows in the passports(SSN) column
        are replaced by update instructions
*/
create trigger check_dublicate_ssn
on passports
instead of insert as
begin
    -- Check for dublicate ssn
    -- If there is no duplicate, do an insert
    if (not exists
           (select P.SSN
            from passports P, inserted I
            where P.SSN = I.SSN))
        insert into passports
        select serial,
               number,
               issue_date,
               issue_country,
               GUID,
               SSN
        FROM inserted
    -- If there is duplicate, do an update
    else
        print 'There was a dublicated SSN'
        print 'Data will be updated'

        update passports
            SET serial = I.serial,
                number = I.number,
                issue_date = I.issue_date,
                issue_country = I.issue_country,
                GUID = I.GUID
            FROM passports P, inserted I
            WHERE P.SSN = I.SSN
end
;