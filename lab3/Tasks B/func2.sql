use data

go

create procedure Factorial (
    @n integer,
    @ReturnValue integer output
) as
begin
    declare @in integer
    declare @out integer
    
    if @n != 1
    begin
        select @in = @n - 1
        exec Factorial @in, @out output
    select @ReturnValue = @n * @Out
    end
    else
    begin
        select @ReturnValue = 1
    end
return
end

go