--                                      ***** ЗАДАНИЕ 3 *****
-- Хранимая процедура, которая получает на вход название таблицы
--  на выходе получает инфу об индексах в этйо таблице
create procedure dbo.index_info (
    @table_name varchar(250)
) as 
begin
    -- Вывод инфы об индексах, если она есть и есть разрешение
    EXEC sys.sp_helpindex @objname = @table_name;
end