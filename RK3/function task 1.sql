create function dbo.f1 (
)   
returns varchar
begin
    declare @str varchar(100)
    
    set @str=(
    select tmp2.name
    from
    (
        select top 1 name, count(name) as 'cnt'
        from
        (
        select *
        from filials f
        join employee e
        on e.filial_code = f.id_fil
        ) as tmp
        group by tmp.name
        order by cnt asc
    ) as tmp2)

    return @str
end