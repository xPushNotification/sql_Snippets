-- (SQL): Триггеры для Таблиц:

    create table accound(acct_num int, amound decimal(10,2));

--//* триггер для insert:

    create trigger ins_sum
        before insert on `account`
            for each row set @sum = @sum + NEW.amount;

-- данные для теста:

    set @sum = 0;       -- триггер оперирует переменной скл
    insert into `account`
        values
        (137, 14.98),
        (141, 1937.50),
        (90,  -100.00);

-- тестируем:

    select 
        @sum as "total amount inserted";    -- 1852.48


--//* триггер для update:

    DELIMITER $$
        create trigger insert_date
            beforeinsert on `stack`
                for each row 
                begin
                    set NEW.insert_date = now();
                end;
    $$
    DELIMITER;

--//* удаляем триггер:

    drop trigger ins_sum;
