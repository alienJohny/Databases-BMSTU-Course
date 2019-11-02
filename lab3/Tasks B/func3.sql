use data

go

create procedure testCursor
as
begin
    -- Объявляем переменную
    declare @TableName varchar(255)
    -- Объявляем курсор
    declare TableCursor cursor for
    select TABLE_NAME from INFORMATION_SCHEMA.TABLES
    where TABLE_TYPE = 'BASE TABLE'
    -- Открываем курсор и выполняем извлечение первой записи 
    open TableCursor
    fetch next from TableCursor into @TableName
    -- Проходим в цикле все записи из множества
    while @@FETCH_STATUS = 0
    begin
        print @TableName
    fetch next from TableCursor into @TableName
    end
    -- Убираем за собой «хвосты»
    close TableCursor
    deallocate TableCursor
end
;