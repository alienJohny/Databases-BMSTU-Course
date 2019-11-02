use data

go

create procedure extractMetadata
as
begin
    -- Extract data metadata
    select TABLE_NAME,
           COLUMN_NAME,
           ORDINAL_POSITION,
           DATA_TYPE,
           CHARACTER_MAXIMUM_LENGTH
    from data.INFORMATION_SCHEMA.COLUMNS

    -- Extract keys
    select *
    from data.INFORMATION_SCHEMA.KEY_COLUMN_USAGE
end
;