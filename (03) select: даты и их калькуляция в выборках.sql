-- (SQL): Select: Даты и Калькуляция в Выборках:
/*
    now() + interval 1 day
    curdate() - interval 4 day
    sysdate()
*/
--//* показывает вопросы заданные от 3 до 10 часов назад (180-600 минут назад):
    select 
        `qID`,
        `askDate`,
        `minuteDiff`
        from
        (
            select 
                `qID`,
                `askDate`,
                timestampdiff(MINUTE, `askDate`, now()) as `minuteDiff`
                from `question_mysql`
        ) `xDerived`
        where
            `minuteDiff` between 180 and 600
        order by qID DESC
        limit 50;

--//* Прямое тестирование портив дат:
    where x >= "2016-02-25"
    and   x <  "2016-02-25" + interval 5 day
