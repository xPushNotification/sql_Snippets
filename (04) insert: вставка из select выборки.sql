-- (SQL): INSERT и SELECT в Комбинации:
/*
    выборка полученная через SELECT может быть 
    использвана как основа для INSERT

    или как база для другого SELECT
    ----------------------------------
*/
    insert into `tableA` 
        (`field1`, `field2`)
            select                   -- значения приходят от SELECT!
                `tableb`.`field1`, `table2`.`field2`
                from `tableB`
                where 
                    `tableB`.`clmn` <> "someValue"
                order by `tableB`.`sortingClmn`
