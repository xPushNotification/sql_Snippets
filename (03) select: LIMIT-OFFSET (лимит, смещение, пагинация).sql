-- (SQL): SELECT выборка с ограничением LIMIT:
-- именно огарничением + смещением и делают пагинацию данных
-- пагинация с большого объма:
-- order=random(fixedSeed) + offset+limit

    select * 
        from `customers`
        order by `customer_id`
        limit 3;                -- первые три строки

    select * 
        from `customers`
        order by `customer_id`
        limit 2,1;              -- limit/offset

-- //? Используем LIMIT / OFFSET:

    select * 
        from `users`
        order by `id`
        asc
        limit 2                 -- limit

    select * 
        from `users`
        order by `id` 
        asc 
        limit 2,3               -- limit/offset

    select * 
        from `users`
        order by `id` 
        asc
        limit 2 offset 3        -- limit/offset

-- //? пагинация:

    select * 
        from `users`
        order by `id` 
        asc
        limit 10, offset 10*2;
