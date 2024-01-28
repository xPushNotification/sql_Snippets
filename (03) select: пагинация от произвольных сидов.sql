-- (SQL): Select: Пагинация от Произвольных Сидов:
-- очевидно что сид можно хранить: 
-- 1. в куке пользователя (при выдаче ключа)
-- 2. в сессии (первые команды скрипта)

--//* простой offset:

    select *
        from `table1`
        limit 10 offset 10;

--//* random offset:

    -- здесь мы получим одну выборку:
    select *  from `table1` order by rand() limit 10 offset 10;

    -- а здесь уже другую:
    select *  from `table1` order by rand() limit 10 offset 10; 

--//* но в random можно заложить сид:

    -- эта выборка
    select *  from `table1` order by rand(123) limit 10 offset 10;

    -- будет аналогична вот этой:
    select *  from `table1` order by rand(123) limit 10 offset 10;

--//* теперь по этой выборке можно организовать пагинацию:

    limit 10, offset 0;             -- 1st page
    limit 10, offset limit *1;      -- 2nd
    limit 10, offset limit *2;      -- 3rd
