-- (SQL): ORDER BY: ASCending / DESCending:
/*
.. order by `column` ASC
.. order by `column` DESC
.. order by `lastname`, `firstname`   -- используются две ячейки
.. order by `submit_date` desc, `id` asc  
*/
--//? Произвольный порядок:

select * from `some_table`
    where
        `id` in (100,200,300,400)
    order by field(`id`, 100,200,300,400);
    -----------
    /*
        `id`
        100
        200
        300
        400
    */
    -----------
