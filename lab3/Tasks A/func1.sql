use data

go

/*
    A.1 Example of the scalar function
*/
create function dbo._percent (
    @value float,
    @percent float
)   
returns float
    begin
        return ((@value / 100) * @percent)
    end
;