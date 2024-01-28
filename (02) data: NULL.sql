-- (SQL): NULL:
/*
    null появляется там где мы вставляем ячейки
    без значения null это не "" и не 0

    поэтому запросы на null требуют особенного
    указания null как возможного варианта значения

    ожидаемые проблемы также возникнут в join
*/
--------------

    select * 
        from `stack`
        where 
            `b`.`id` is NULL

--------------
/*
    tbl:example:
    | id | company_name 	| end_date 
    | 1  | Google 			| NULL 		
    | 1  | Initech 			| 2013-01-31
*/    
--------------

--//* ошибочный подход (null значение не учтено):

    select *         -- выборка не вернет "Google"
        from `example`
            where 
                `end_date` > "2016-01-01";

--//* здесь все нормально (null учтен):

    select *
        from `example`
            where 
                `end_date` > "2016-01-01" or `end_date` is null; 

--//* в выборке можно заменить null чем то еще:

    select *
        case 
            when `end_date` is null then "present"  else `end_date`
            end as `max date`
        from `example`;
