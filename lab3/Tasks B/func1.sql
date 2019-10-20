use data

go

/*
    B.1 Simple debug procedure
*/
create procedure dbo.debug_message (
    @message varchar(200)
) as 
begin
    print 'DEBUG: (' + @message + ')'
    print 'Time: ' + convert(varchar(200), GETDATE())
    print ''
end
;