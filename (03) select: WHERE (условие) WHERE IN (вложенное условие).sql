-- (SQL): SELECT c WHERE (условия и вложенные условия):

    select * 
        from `stack` 
        WHERE 
            `username` = "admin" 
            AND 
            `password` = "admin"

--//* вложенные запросы:

    select 
        `title`
        from `books` 
        where 
            `author_id` =   -- ожидается одно значение
            (
                select 
                    `id` 
                    from `authors` 
                    where 
                        `last_name` = "bar" 
                        and 
                        `first_name` = "foo"
            );

--//* выборка всех 'username' без 'email'

    select * 
        from `stack`
        where 
            `username` IN   -- ожидается массив значений
            (
                select 
                    `username`
                    from `signups`
                    where 
                        `email` is null
            );
