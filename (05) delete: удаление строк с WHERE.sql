-- (SQL) DELETE:
/*
    Поля могут удаляться и не сразу:
    LOW_PRIORITY        -- удалить когда таблица расслабилась
    IGNORE              -- игнорировать ошибки
    LIMIT               -- удалить за раз только #строк
    ----------------------
*/        
    delete from `people`
        where
            `people`.`name` = "Paul";

    delete from `table_name`;   -- удалить все строки

    delete from `table_name`
        where 
            `field_one` = "value_one"
        limit 1;
