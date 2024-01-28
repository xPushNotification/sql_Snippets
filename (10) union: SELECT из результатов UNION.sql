-- (SQL): SELECT из Результатов Union:

    select 
        `one`,
        `two`,
        `three`
        from        -- временная таблица
        (
            select `one`, `two`, `three` from `table1` where `state` = "action"
            union
            select `one`, `two`, `three` from `table2` where `state` = "action"
        )   as `table_all`
        order by `one`;
