-- (SQL): Строковые Функции в Запросах:

    length("some data")             -- strlen
    char_length("some data")        -- mb_strlen

    substring("somedata", start_pos)
    substring("somedata", from 4)
    substring("somedata", from 4 for 3)     -- 3 от смещения

    --одно и тоже:
    upper(str)
    ucase(str)

    --одно и тоже:
    lower(str)
    lcase(str)

    str_to_data("date", format)
    select 
        str_to_date(my_date_field, "%m/%d/%Y") from `my_table`

    replace("foobarbaz", "bar", "BAR")  -- fooBARbaz

    --//* поиск внутри множества, разделенного ',':
    select find_in_set("b", "a,b,c")        -- 2
    select find_in_set("d", "a,b,c")        -- 0
