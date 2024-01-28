-- (SQL): Изменение (alter) Структуры Таблиц

--//* Добавление,Изменение,Удаление ячеек:

    create database stackoverflow;
    use stackoverflow;

    create table `stack`
    (
        `id_user` int not null,
        `username` varchar(30) not null,
        `password` varchar(30) not null
    );

    alter table `stack`
        add column 
            `submit` date not null;

    alter table `stack`
        modify `submit`           -- меняем имя
            `submit_date` datetime not null;

    alter table `stack`
        drop column `submit`;

--//* меняем auto_increment значение:

    alter table `stack` auto_increment = 101;

--//* изменяем имя таблицы:

    alter table `stack` 
        rename to `stack1`

--//* добавляем индекс:

    alter table `stack`
        add index "index_name" (`username`)

    alter table `stack`
        add index "index_name" (`username`, `password`)

--//* оперируем с primary key:

    alter table `stack` drop primary key;
        --или--
    alter table `stack` 
        modify column 
        `username` decimal(20,0) not null primary key;
