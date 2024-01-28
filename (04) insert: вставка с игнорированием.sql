-- (SQL): INSERT + IGNORE:
/*
    без поля с autoincrement мы не сможем
    вставить две строки с одинаковыми значениями 
    полей
*/
create table `people`
(
    id int not null,
    name varchar(40)
);

insert into `people`
    (`id`,`name`)
    values
    (1, "john"),
    (2, "anna");
    ------------------
    /*
        tbl: `people`:
        id		name
        1		john
        2		anna     -- !   
    */
    ------------------

insert into `people` 
    (`id`,`name`)
    values
    ("2", "anna");      -- ошибка


insert IGNORE into `people` 
    (`id`,`name`)
    values
    ("2", "anna"),      -- ok
    ("3", "mike");
    ------------------
    /*
        tbl: `people`:
        id		name
        1		john
        2		anna
        3       mike
    */
    ------------------
