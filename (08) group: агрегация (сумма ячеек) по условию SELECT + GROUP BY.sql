-- (SQL): Агрегация с GROUP BY: 
-- как только агрегацию не называют в php это тоталирование (array_reduce)
/*
    -------------------------
    select + group by
    создает агегацию по полю с помощью aggr_function
    (было много полей - стало одно - например среднее по зарплате)

    а вот если aggr_function не задана, 
    то вернется по одному значению для каждой из груп

    вообще агрегирование это отдельный(!) вид селекта 
    или если проще селект и из него еще одна операция агрегации
    (group by не очень удачно описывает происходящее)
    с отдельной логикой которая очень не похода на обычные выборки
    это скорее больше похоже на отчет по таблице по всем вхождениям
    ключевого поля

    select - выбирает строки
    агрегация - строит отчет где ключем является колонка, а остальные 
                ячейки рассчитываются функциями 
    -------------------------
*/    
    select 
        `model`,                        -- ключевая колонка
        count(`model`) as `qty_model`,   -- функция для первого поля
        avg(`price`) as `avg_price`     -- функция для второго поля
        from `pc`
            group by `model`;           -- агрегировать по какому полю
    --------------------------------------------------
    /*
        model			qty_model			avg_price
        1121			3					850
        1232			4					425
        1233			3					843
    */
    --------------------------------------------------
    select 
        `department`,
        count(*) as `man_power`
        from `employees`
        group by `department`
        having 
            count(*) >= 10;     -- eq:where

    select 
        `name`,
        group_concat(`score` order by `score` desc separator " ") as `grades`
        from `grade`
            group by `name`;
        ---------------------------
        /*
            name		grades
            adam		c+ b a- a+
            bill		d-
            john		a-
        */
        ---------------------------

    select 
        `department`,
        min(`salary`) as `lowest salary`
        from `employees`
            group by `department`;

--//? агрегация может быть достигнута через (SELECT+aggr func) в имени поля:

    select 
        c.CustomerName,
        (select count(*) from `orders` where CustomerID = c.Customer) as `Count`
        from `customers` as c
        order by c.CustomerName
