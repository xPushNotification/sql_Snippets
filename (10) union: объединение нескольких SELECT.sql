-- (SQL): UNION - объединение результатов SELECT выборок:
-- там где нужно просто сляпать таблицу из нескольких - с равными значениями ячеек
-- выгоднее использовать UNION, а не JOIN, JOIN это про умные выборки 
-- union - это просто про сляпать результаты

    (
        select 
            `name`,
            `email`,
            `phone_number`
            from `authors`
    )
    union
    (
        select
            `name`,
            `email`,
            `authors`
            from `editors`
    );

--//? плейсхолдер для пустых ячеек:

    (
        select 
            `name`,
            `caption` as `title`,
            `year`,
            `pages` 
            from `books` 
    )
    union
    (
        select 
            `name`, 
            `title`,
            `year`,
            0 as `pages`      -- placeholder
            from `movies`
    );

--//? порядок можно задать как для отдельной  - так и для сляпаной таблиц:

    (
        (
            select ... order by x limit 40
        )
        union 
        (
            select ... order by y limit 40
        )
    ) order by x limit 30,10

