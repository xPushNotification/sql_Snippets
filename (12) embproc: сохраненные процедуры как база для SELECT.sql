-- (SQL): Сохраненные Процедуры для Баз:
-- так как результат появляется от SELECT операции
-- для вызова будет использвон именно SELECT

    DELIMITER ||
        create function xFuncname (pArgname INT)
        returns int
        begin 
            return (argname + 1);
        end;
        ||
        DELIMITER;

--//? как использовать:
    select xFuncname(10);
