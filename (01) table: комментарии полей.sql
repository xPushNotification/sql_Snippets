-- (SQL): Комментарии При Создании Полей и Таблиц:
-- есть ограничение в размер длины

    create table `bird`
    (
        `bird_id` int not null auto_increment,
        `species` varchar(300) default null comment "это комментарий"
    )
    engine inndoDB comment "и это комментарий";
