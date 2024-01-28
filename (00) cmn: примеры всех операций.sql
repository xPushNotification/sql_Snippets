-- (SQL): Обзор Всех Операций:

--//* создание:

    create database `mydb`
    use `mydb`

    create table `mytable`
    (
        `id`          int unsigned NOT NULL auto_increment,
        `username`    varchar(100) NOT NULL,
        `email`       varchar(100) NOT NULL,
        primary key (`id`)
    )

--//* несколько баз данных
    -- можно обойтись без "use `mydb`" - но тогда придется писать префиксы:
    create table `mydb`.`mytable`
    (
        `id`          int unsigned NOT NULL auto_increment,
        `username`    varchar(100) NOT NULL,
        `email`       varchar(100) NOT NULL,
        primary key (`id`)
    )

    -- то есть если контроллер работает с несколькими бд - не надо прыгать между ними
    -- просто используй префиксы
    -- как видим будет работать даже выборка с двух баз данных (подходила бы лишь учетка):
    
    (select * from `gg_directory`.`mytable`)
    UNION
    (select * from `gg_sqltests`.`mytable`)    

--//* вставка (insert):

    insert into `mytable` 
        (`username`, `email`)
        values 
        ("myuser", "myuser@example.com")

        --eq:

    insert into `mytable`
        set `username` = `myuser`, `email` = "myuser@example.com"

--//* обновление строки (update):

    update 
        `mytable` 
        set `username`="myuser"
        where 
            `id`=8

--//* удаление строки (delete):

    delete from 
        `mytable`
        where 
            `id`=8

--//* выборка (select):
    --
    -- SELECT создает строковый/табличный вывод навроде "echo"
    -- или можно сказать возвращает "хандлер таблицы"
    -- поэтому он и может быть базой других SELECT и
    -- поэтому может комбинироваться с операциями навроде 
    -- select ROUND(4.51)

    select * 
        from `mytable`       -- возвр. хандлер таблицы (см.ниже)
        where 
            `username` = "myuser"

    select *
        from
        (
            select * from `mytable`     -- возвр. хандлер таблицы
        ) as `tmptable`
        where 
            `username` = "myuser"       -- переменная в контексте

--//* список баз данных:

    show databases

--//* выбрать базу данных:
    
    use `mydb`

--//* список таблиц:

    show tables

--//* список полей в таблице:

    describe `mydb`.`tablename`
    describe `tablename`

--//* создать пользователя:

    create user 
        "user"@"localhost"
        identified by "some password"

--//* создать пользователя (соединение только локально):

    create user 
        "user"@"%" 
        identified by "some_password"

--//* привилегии пользователю:

    grant 
        select, insert, update 
        on `mydb`.* 
        to "username"@"localhost"

--//* предоставить привилегии:

    grant all 
        on *.* 
        to "username"@"localhost"
        with grant option

--//* для полей с пробелами используем ``:

    create table `table` 
    (
        `first name` varchar(30)
    )

