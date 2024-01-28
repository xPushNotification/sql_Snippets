-- (SQL): SELECT вместе с BETWEEN (значение между):

    select * 
        from `stack` 
        where 
            `id` >= 2 and `id` <= 5;    -- вот этот код

    select * 
        from `stack` 
        where 
            `id` BETWEEN 2 and 5;       -- аналогичен этому

    select * 
        from `stack` 
        where 
            `id` NOT BETWEEN 2 and 5;   -- тоже но с негативом
