-- (SQL): SELECT с CASE он же IF условие:
-- вообще автоколонки тем не очевидны, что их название
-- указывается в хвосте объявления case - хотя это собственно
-- колонка просто и есть

--//* вариант с 'case':
    
    select 
        `st`.`name`,
        `st`.`percentage`,
        CASE when             -- автоколонка (вычисляемая)
            `st`.`percentage` >= 35
            THEN "Pass"
            ELSE "Fail"
        END AS `Remark`       -- имя автоколонки
        from `students` AS `st`;

--//* вариант с 'if':

    select 
        `st`.`name`,
        `st`.`percentage`,
        IF(`st`.`percentage` >=35, "Pass", "Fail") AS `Remark`  -- автоколонка
        from `students` as `st`;
        ----------------------
        /*
        name			percentage			remark -- автокоолнка
        Isha			67					Pass
        Rucha			30					Fail    
        */
        ----------------------
