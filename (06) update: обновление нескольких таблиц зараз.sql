-- (SQL): UPDATE для больше чем одной строки за раз:

    update `table1`, `table2`
        set
            `table1`.`quantity` = `table1`.`quantity`-5,
            `table2`.availableStock` = `table2`.`availableStock` + 5
        where 
            `table1`.`productId` = `table2`.`productId`
            and
            `table1`.`productId` = 100
            and 
            `table2`.`productId` = 20;
