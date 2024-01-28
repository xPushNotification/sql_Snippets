-- (SQL): SELECT c Датами:

--//? будет работать с типами: DATE, TIMESTAMP, DATETIME

    select *
        from `stack`
        where 
            `dt` >= '2017-02-01'
            and
            `dt` <  '2017-02-01' + interval 1 month
