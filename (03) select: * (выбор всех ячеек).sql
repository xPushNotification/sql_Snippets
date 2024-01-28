-- (SQL): SELECT (*) все ячейки:

--//? подобные выборки жрут производительность:
    select * 
        from `stack`

    select 
        `stack`.* 
        from `stack`
        join `overflow` on 
            `stack`.`id` = `overflow`.`id`;
