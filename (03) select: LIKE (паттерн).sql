-- (SQL): SELECT с паттернами на данные через LIKE(%):

--//? '%' любое число знаков 
--//? '_' только один знак

    create table `stack`
    (
        `id` int auto_increment primary key,
        `username` varchar(100) not null
    );

    insert into `stack` 
        (`username`) 
        values 
            ("admin"),
            ("k admin"),
            ("adm");

    select * from `stack` where `username` LIKE "%adm%"     -- adm где угодно
    select * from `stack` where `username` LIKE "adm%"      -- начинается с
    select * from `stack` where `username` LIKE "%adm"      -- заканчивается на
    select * from `stack` where `username` =    "adm_n"     -- adm?n

    select * 
        from `stack` 
        where 
            `username` LIKE "adm_n"     -- adm?n
    select 
        `username`
        from `users`
        where 
            `username` like "admin_";
