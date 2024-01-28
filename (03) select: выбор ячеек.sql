-- (SQL): SELECT Выборки Ячеек:

    create table `stack`
    (
        `id` int,
        `username` varchar(30) not null,
        `password` varchar(30) not null
    );

    insert into `stack` 
        (`id`,`username`,`password`)
        values
        (1,"foo","hiddenGem"),
        (2,"baa","verySecret");

    select 
        `id`,`username`,`password` 
        from 
            `stack`;
