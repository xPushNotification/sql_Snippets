-- (SQL): Полнотекстовый Поиск (fulltext):

-- Если в таблице планируется полнотекстовый поиск
-- там должен быть fulltext index

--//* задание полнотекстового поиска при создании таблицы:

    create table tbl1
    (
        `id` int not null auto_increment,
        `title` varchar(50),
        `body` text,

        primary key(`id`),
        fulltext key(`body`)
    );

--//* добавление через инструкцию alter:

    alter table `book`
        add 
        FULLTEXT(column1, column2)

--//* операция поиска:

    MATCH (col1,col2,...) 
    AGAINST (expr [search_modifier])

    set @srch = "what to find";
    select 
        match (`title`) against (@srch in natural language mode) `score`,
        `ISBN`,
        `Author`,
        `Title`
        from `books`
            where 
                match(`title`) against (@srch in natural language mode)
        order by match(`title`) against (@srch in natural language mode) DESC;

--//* поиск по маске:

    -- ищем: Database
    -- ищем: Programming
    -- исключаем: Java

    set @srch = "Database Programming -Java";
    select 
        match (`title`) against (@srch in booliean mode) `score`,
        `ISBN`,
        `author`,
        `title`
        from `book`
            where
                match(`title`) against (@srch in booliean mode)
        order by match(`title`) against (@srch in boolean mode) DESC;

--//* поиск по нескольким полям:

    alter table `book` 
        add fulltext index indexname (`title`,`author`);

    set @srch = "database programming";
    select 
        match(`title`,`author`) against (@srch in natural language mode) `score`,
        `ISBN`,
        `author`,
        `title`
        from `books`
            where 
                match(`title`,`author`) against (@srch in natural language mode)
        order by 
            match(`title`,`author`) against (@srch in natural language mode) DESC;
