-- (SQL): Операции с Базою Данных в Целом:


--//* schema или database:
    -- разметку базы данных называют также "схемою"

    create database `name`
    create schema           -- eq: create database
        if not exists       -- предотвращает ошибку
        `name`

--//* создание:
    create database `baseball`;

    create database
        if not exists 
        `baseball`;

--//* удаление (всегда проверяйте на наличие):

    drop database 
        if exists 
        `baseball`;

    drop database `baseball`;

--//* создание с указанием кодировки:

    create database 
        `baseball`
        character set utf8
        collate utf8_general_cli;

--//* показываем существующие:

    show databases;

--//* делаем базу данных активной:

    use `baseball`;

--//* создаем пользователя:

    create user
        "john123"@"%"             -- % может соединятся с любого хоста
        identified by "password"

--//* пользовательские данные:

    select
        `user`, 
        `host`,
        `password`
        from `mysql`.`user`
        where 
            `user` in ("John123", "John456")

--//* установка пользователям прав на базы/таблицы:

    grant all on
        `baseball`.*
        to
        "John123"@"%"

    grant select on 
        `baseball`.*
        to
        "John123"@"%"

