-- (SQL): JOIN: Примеры Объединений:

--//* примитивный запрос строиться следующим образом:

      select
            songs.track, songs.title, albums.name    -- поля общей выборки
            from `songs` join `albums`               -- таблицы выборки
            on                                       -- условия объединения
            songs.album = albums._id

--//* объединение трех таблиц (!) крайне важен порядок создания выборки:
/*
      таблица_01: [_id][track][title][bu == таблица_02:_id]     : songs
      таблица_02: [_id == таблица_01:bu][name][artist]          : albums
      таблица_03: [_id == таблица_02:artist][name]              : artists
*/      

      select
            artists.name,
            albums.name,
            songs.track,
            songs.title
            from `songs`                                                 -- база являющаяся базой запроса
                 inner join `albums` on songs.album = albums._id         -- первый запрос выборки
                 inner join `artists` on artists.album = artists._id     -- второй запрос выборки
            where albums._id = 19                                        -- условия для итоговой выборки
            order by
                  artists.name, albums.name, songs.track

--//* все заказы от всех покупателей:

    select 
        c.CustomerName, 
        o.OrderID
        from `customers` as c
        inner join 
            `orders` as o
            on 
            c.CustomerID = o.CustomerID

--//* посчитай заказы от каждого покупателя:

    select 
        c.CustomerName, 
        count(*) as `Order Cound`
        from `customers` as c
        inner join
            `orders` as o
            on 
            c.CustomerID = o.CustomerID
        group by c.CustomerID         -- агрегируется через count(*)
        order by c.CustomerID

--//? eq:
    select 
        c.CustomerName,
        (select count(*) from `orders` where CustomerID = c.Customer) as `Count`
        from `customers` as c
        order by c.CustomerName

--//* покупатели с заказами:

    select 
        c.CustomerName
        from `customers` as c
        where exists
            (select * from `orders` where CustomerID = c.CustomerID)
        order by c.CustomerName
