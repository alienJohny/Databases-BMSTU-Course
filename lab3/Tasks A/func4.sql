use data

go

/*
    A.4 Recursive factorial function
*/
create function dbo.fact (
    @iNumber int
)
returns int
    with returns null on null input
as
begin
    declare @i int

    if (@iNumber = 0)
        set @i = 0

    if (@iNumber < 0)
        set @i = -1

    if (@iNumber > 0)
        if @iNumber <= 1
            set @i = 1
        else
            set @i = @iNumber * dbo.fact(@iNumber - 1)
   
    return (@i)
end
;
