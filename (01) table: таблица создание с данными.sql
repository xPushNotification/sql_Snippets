-- (SQL): Создаем Таблицу с Данными Одной Командой:
-- так как возврат от select(и подобных) это таблица, 
-- а любое действие в sql настроено на приемку такой 
-- таблицы - их можно комбинировать 
-- в принципе где угодно и в любой комбинации

    create table `team_person`
        as          select "a" `team`, "John"   `person`
        union all   select "b" `team`, "smith"  `person`
        union all   select "c" `team`, "walter" `person`;
