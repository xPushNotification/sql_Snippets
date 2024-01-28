-- (SQL): SELECT c DISTINCT (без дубликатов):

    create table `car`
    (
        `car_id` int unsigned not null primary key,
        `name` varchar(20),
        `price` decimal(8,2)
    );

    insert into `car` 
        (`car_id`,`name`,`price`) 
        values 
        (1,"Audi","20000"),
        (2,"Audi","15000"),
        (3,"Audi","30000"),
        (4,"Audi","20000"); -- дубликат по данным 
    
--//? DISTINCT убирает дубликаты из выборки:

    select distinct 
        `name`, `price` 
        from `car`;     -- только первые три
