-- (SQL): Внешние Ключи (FOREIGN KEYS):

    -- Внешний ключ это просто ограничение (constraint)
    -- скл не удалит вненюю строку в которой внешний ключ
    -- до момента как не удалится ссылающаяся строка

    create table `course`
    (
        `id` smallint(5) unsigned not null auto_increment, --fk:откуда
        `name` varchar(50) not null,
        primary key(`id`)
    ) engine=InnoDB;

    create table `user`
    (
        `id` smallint(5) unsigned not null auto_increment,
        `name` varchar(30) not null,
        `course_id` smallint(5) unsigned default null,     -- fk:куда
        primary key(`id`)
    ) engine=InnoDB;

--//* Добавляем Внешний Ключ:

    alter table `user`
        add constraint "FK_course" -- имя ограничения
        foreign key (`course_id`) references `course` (`id`)
        on update cascade

--//* Внешний Ключ никак не связан с работою SELECT:
--    можно подразумевать и без ограничения, что поля коррелируются

    select 
        `user`.`name`,
        `course`.`name`
        from `user`
        inner join      -- очевидно, что корреляция там же вн.ключ!
            `course`
            on 
            `user`.`course_id` = `course`.`id`
