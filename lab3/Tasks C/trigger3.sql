create trigger dropSafe
on database for DROP_TABLE  
as
    print N'Попытка удалить таблицу companies_backup'
    RAISERROR(N'Неавторизаванный DROP TABLE', 10, 1);
    
    -- Откатывает транзакцию до начала транзакции или
    -- до точки сохранения внутри транзакции
    rollback;
go

drop trigger dropSafe on database