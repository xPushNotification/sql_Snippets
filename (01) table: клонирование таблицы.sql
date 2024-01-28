-- (SQL): Клонирование Существующей Таблицы:

--//* Клонируем только структуру:

    create table `clone_persons` like `persons`;

--//* Клонируем структуру и данные:

    create table `clone_persons` (select * from `persons`);

--//* Клонируем и модифицируем данные:

    create table `modified_persons`
    (
        select 
            `person_id`,
            `firstname` + `lastname` as `fullname`
            from `persons`
            where
                `lastname` is not null
    )
