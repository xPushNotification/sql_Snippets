-- (SQL): JSON внутри ячеек:

    create table `tablename`
    (
        `id` int not null auto_increment,
        `json_col` JSON,        -- часть может выбираться через SELECT
        primary key(`id`)
    );

    insert into `tablename` 
        (`json_col`)
        values
        ({ "city":"galle", "description":"best damn city in the world" });
