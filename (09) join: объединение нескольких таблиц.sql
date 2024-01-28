-- (SQL): JOIN:
/*
    Там где нужно просто сляпать таблицу из двух
    лучше использовать UNION, а не JOIN.

    Думать об объединениях JOIN как о чем то логическом
    не очень корректно.
    Левая(LEFT) и Правые(RIGHT) таблицы не равны (!) 
    это не логическое объединение вроде && ||
    (и соеденены разве что foreign key)

    Логическое объединение выглядело бы так:
        -. люди с усами / люди в красных шапках
        -. таксономии А / таксономии Б
    SQL логика:
        -. покупатели / заказы этих покупателей
        -. пользователи / лайки этих пользователей
        -. пользователи / посты этих пользователей / лайки 

    То есть логическое объединение это выборка с двух РАВНЫХ единиц
    а SQL - это выборка пошагам
    взять выборку из левой таблицы (основа LEFT) - и на основе неё по какой то 
    совпадающей ячейке построить выборку из правой таблицы (решение RIGHT).

    -------
    У нас есть
        customers                   левая(LEFT) таблица (SELECT FROM ..)
        и
        orders                      правая(RIGHT) таблица (JOIN .. ON)
    мы можем получить:
        покупатели с заказами       (inner join)
        покупатели без заказов      (left outer join)
        заказы без покупателей      (right outer join)
    -------
*/
--//* схема для тестов:
    create table `positions`
    (
    `id` smallint(5) unsigned not null auto_increment,
    `name` varchar(50) not null,
    primary key(`id`)
    );

    create table `persons`
    (
    `id` smallint(5) unsigned not null auto_increment,
    `name` varchar(50) not null,
    `pos_id` smallint(5),         -- не отмечен как foreign key!
    primary key(`id`)
    );

    insert into `positions` 
        (`name`) 
        values 
        ("Дизайнер"),
        ("Редактор"),
        ("Программист");        --//? отсутствует в `persons`

    insert into `persons` 
        (`name`, `pos_id`) 
        values 
        ("Владимир",1), 
        ("Татьяна",2), 
        ("Александр",6),        --//? отсутствует в `positions`
        ("Борис",2);

--//* INNER JOIN (только те где <условие> есть и в LEFT и в RIGHT таблицах): 

    select
        `persons`.`id` as `person.id`,
        `persons`.`name` as `имя`,
        `positions`.`id` as `pos.id`,
        `positions`.`name` as `название должности`
        from `persons`                                  --//? LEFT
        inner join
            `positions`                                 --//? RIGHT
            on
            `persons`.`pos_id` = `positions`.`id`;      --//? пересечение
            --------------------------------------------------------
            /*
            person.id	имя	        pos.id	    название должности
            1	        Владимир	1	        Дизайнер
            2	        Татьяна	    2	        Редактор
            4	        Борис	    2	        Редактор
            */
            --------------------------------------------------------

--//?аналогично:

    select
        per.id as `person.id`,
        per.name as `имя`,
        pos.id as `pos.id`,
        pos.name as `название должности`
        from `persons` per                      -- сокращение
        inner join
            `positions` pos                     -- сокращение
            on
            per.pos_id = pos.id;


--//* LEFT OUTER JOIN: (выбрать даже если <условие> отсутствует в RIGHT таблице):

    select
        `persons`.`id` as `person.id`,
        `persons`.`name` as `имя`,
        `positions`.`id` as `pos.id`,
        `positions`.`name` as `название должности`
        from `persons` 
        left outer join
            `positions` 
            on
            `persons`.`pos_id` = `positions`.`id`;
            -------------------------------------------------------
            /*
            person.id   имя	        pos.id	    название должности
            1	        Владимир	1	        Дизайнер
            2	        Татьяна	    2	        Редактор
            3	        Александр	(null)	    (null)
            4	        Борис	    2	        Редактор
            */
            -------------------------------------------------------

--//* RIGHT OUTER JOIN: (выбрать даже если <условие> отсутствует в LEFT таблице):
    select
        `persons`.`id` as `person.id`,
        `persons`.`name` as `имя`,
        `positions`.`id` as `pos.id`,
        `positions`.`name` as `название должности`
        from `persons` 
        right outer join
            `positions` 
            on
            `persons`.`pos_id` = `positions`.`id`;
            -------------------------------------------------------
            /*
            person.id	имя	        pos.id	    название должности
            1	        Владимир	1	        Дизайнер
            2	        Татьяна	    2	        Редактор
            4	        Борис	    2	        Редактор
            (null)	    (null)	    3	        Программист
            */
            -------------------------------------------------------

--//* FULL OUTER JOIN (Left Outer Join) + (Right Outer Join):
    (
    select
        `persons`.`id` as `person.id`,
        `persons`.`name` as `имя`,
        `positions`.`id` as `pos.id`,
        `positions`.`name` as `название должности`
        from `persons` 
        left outer join
            `positions` 
            on
            `persons`.`pos_id` = `positions`.`id`
    )
    union
    (
        select
            `persons`.`id` as `person.id`,
            `persons`.`name` as `имя`,
            `positions`.`id` as `pos.id`,
            `positions`.`name` as `название должности`
            from `persons` 
            right outer join
                `positions` 
                on
                `persons`.`pos_id` = `positions`.`id`
    );                                                  -- только один ';'!!
    -------------------------------------------------------
    /*
    person.id	имя	        pos.id	    название должности
    1	        Владимир	1	        Дизайнер
    2	        Татьяна	    2	        Редактор
    3	        Александр	(null)	    (null)
    4	        Борис	    2	        Редактор
    (null)	    (null)	    3	        Программист
    */
    -------------------------------------------------------

--//* Отличия LEFT таблицеы от RIGHT таблицы:

    select
        `persons`.`id` as `person.id`,
        `persons`.`name` as `имя`,
        `positions`.`id` as `pos.id`,
        `positions`.`name` as `название должности`
        from `persons` 
        left outer join
            `positions` 
            on
            `persons`.`pos_id` = `positions`.`id`
            where
            `positions`.`id` is NULL             -- не positions.id = NULL
            ------------------------------------------------------
            /*
            person.id	имя	        pos.id	    название должности
            3	        Александр	(null)	    (null)
            */
            ------------------------------------------------------

--//* Отличия RIGHT таблицы от LEFT таблицы:

    select
        `persons`.`id` as `person.id`,
        `persons`.`name` as `имя`,
        `positions`.`id` as `pos.id`,
        `positions`.`name` as `название должности`
        from `persons` 
        right outer join
            `positions` 
            on
            `persons`.`pos_id` = `positions`.`id`
            where
            `persons`.`id` is NULL
            -------------------------------------------------------
            /*
            person.id	имя	        pos.id	    название должности
            (null)	    (null)	    3	        Программист
            */
            -------------------------------------------------------

--//** Полный набор отличий (отлич. левой от правой + правой от левой):
    (
        select
            `persons`.`id` as `person.id`,
            `persons`.`name` as `имя`,
            `positions`.`id` as `pos.id`,
            `positions`.`name` as `название должности`
            from `persons` 
            left outer join
                `positions` 
                on
                `persons`.`pos_id` = `positions`.`id`
                where
                `positions`.`id` is NULL
    )
    union
    (
        select
            `persons`.`id` as `person.id`,
            `persons`.`name` as `имя`,
            `positions`.`id` as `pos.id`,
            `positions`.`name` as `название должности`
            from `persons` 
            right outer join
                `positions` 
                on
                `persons`.`pos_id` = `positions`.`id`
                where
                `persons`.`id` is NULL
    );
    -------------------------------------------------------
    /*
    person.id	имя	        pos.id	    название должности
    3	        Александр	(null)	    (null)
    (null)	    (null)	    3	        Программист
    */
    -------------------------------------------------------
