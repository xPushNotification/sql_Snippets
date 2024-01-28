-- (SQL): UPDATE:

    update `customers`
        set 
            `email` = "like@email.com"
        where
            `id`=1;

    update `customers`
        set 
            `lastname` = "smith";       -- all the rows

--//* update это ОЧЕНЬ медленная операция 
--//* поэтому поставим её в 'low_priority'

    update LOW_PRIORITY `customers`
        set
            `email` = "like@email.com"
        where
            `id` = 1;

--//* множественные условия:
    update `people`
        set `name` = 
        (
            case `id`           -- "if" для `id` ячейки
                when 1 then "karl"
                when 2 then "tom"
                when 3 then "mary"
            end
        )
        where `id` in (1,2,3);  -- ограничение выборки для набора
