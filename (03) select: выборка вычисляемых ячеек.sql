-- (SQL): SELECT к Вычисляемым Ячейкам:
/*
    -----------------------------
    tbl `team_person`:
 		team 	person
		A		John
		B		Smith
		A		Walter
		A		Louis
		C		Elizabeth
		B		Wayne   
    -----------------------------        
*/
--//? вот это:
    set @row_no := 0;
    select
        @row_no := @row_no +1 as `row_number`,
        `team`,
        `person`
        from `team_person`

--//? можно также записать в одну операцию:
    select 
        @row_no := @row_no+1 as `number`,
        `team`,
        `person`
        from `team_person`,
        (select @row_no := 0) t     -- инициализация 'row_no'

    -----------------------------        
    /*
        row_number		team 	person
        1				A		John
        2				B		Smith
        3				A		Walter
        4				A		Louis
        5				C		Elizabeth
        6				B		Wayne
    */
    -----------------------------        

    select 
        @row_no := if(@prev_lav = `t`.`team`, @row_no +1, 1) as `row_number`,
        @prev_val := `t`.`team` as `team`,
        `t`.`person`
        from `team_person` t,
            (select @row_no := 0) x,    -- инициализация (без возврата значения)
            (select @prev_val := "") y,
        order by 
            `t`.`team` asc,
            `t`.`person` desc

    -----------------------------        
    /*
        row_number		team 	person
        1				A		John
        2				A		Walter
        3				A		Louis
        1				B		Smith
        2				B		Wayne
        1				C		Elizabeth
    */
    -----------------------------        
    