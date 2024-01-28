-- (SQL): VIEWs:
/*
    VIEW это не сохраненная выборка 
    это просто сохраненный запрос
    который можно подставить когда нужно
    куда нужно - и вот на базе этого сохраненного
    запроса получить выборку 
    на которой можно строить другие запросы
    (VIEW будет пересчитываться каждый раз)

    проще говоря VIEW делает запросы более понятными 
    и чистыми 
*/
    create view LondonStaff
        as 
        select * 
            from `salespeople`
            where `city` = "London"

--//* без использования view:
    select * 
        from 
        (select * from `salespeople` where `city` = "London")
        limit 20

--//* с использованием view:

    select * 
        from LondonStaff           -- view развернулось в: "(select..)"
        limit 20

--//* и еще более сложный пример:

    create view MyView
        as
        select
            a.*, 
            b.extra_data
            from `main_table` a
            left outer join 
                `other_table` b
                on 
                a.id = b.id
