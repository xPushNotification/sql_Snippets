-- (SQL): Обратные кавычки (``):

--//* Нужны для ИМЕН ПОЛЕЙ, если: 
    --. в качестве имени используется зарезервированное слово
    --. поле содержит пробелы внутри названия

    select 
        `student_name`,
        AVG(`test_score`) 
        from `students`
        group by `group`

--//* Кавычки нельзя использовать для вставляемых значений:

    insert into mytable 
        (`username`, `email`)
        values 
        ("myuser", "myuser@example.com") -- не `myuser`

    update `stack`
        set 
            `username`="123adm"          -- не `123adm`
        where 
            `username` like "k%";

--//* Для композитных имен (tbl.field):

    select 
        `users`.`username` as `users.username` 
        from `users`

--//* Ситуация с зарезервированными словами:

    select * from order     -- ошибка
    select * from `order`   -- а здесь все впорядке
