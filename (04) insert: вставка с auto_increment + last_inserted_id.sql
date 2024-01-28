-- (SQL): INSERT + AUTO_INCREMENT + LAST_INSERTED_ID():

--//? поля с auto_increment не используются при вставке:
    create table t
    (
        id smallint unsigned auto_increment not null,
        tt varchar(300) default null,
        primary key(id)
    );

    insert into `t` (`tt`) values ("value1");

    select last_insert_id() into @id; -- значение приходит в переменную

    insert into `another_table` 
        (`t_id`)
        values
        (@id);                       -- используем переменную

    create table `iodku`
    (
        `id`    int auto_increment not null,
        `name`  varchar(99) not null,
        `misc`  int not null,

        primary key (id),           
        unique(name)                -- теперь можно использовать "on duplicate key"

    ) engine = InnoDB;

    insert into `iodku`
        (`name`,`misc`)
        values
        ("Lesly",123),
        ("Sally",456);
        -----------------------------
        /*
        | id 	| name 		| misc 	|
        | 1 	| Leslie 	| 123 	|
        | 2 	| Sally 	| 456 	|
        */
        -----------------------------

    insert into `iodku` 
        (`name`, `misc`)
        values
        ("Sally", 3333)
        on duplicate key                -- событие "duplicate key" (на уникальной)
            update                      -- операция на событии
            id = last_inserted_id(id),
            misc = values(misc);        -- не "misc = misc"

        -----------------------------
        /*
        | id 	| name 		| misc 	|
        | 1 	| Leslie 	| 123 	|
        | 2 	| Sally 	| 3333 	|  -- на дубликате (id сохранено)
        */
        -----------------------------
