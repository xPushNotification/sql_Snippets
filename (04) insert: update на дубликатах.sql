-- (SQL): INSERT, но на дубликатах вызов UPDATE:

--//? если ключа нет - то вставка, а если есть то update
insert into `table_name`
    (`index_field`,`other_field_1`, `other_field_2`)
    values
    ("index_value", "insert_value", "other_value")
    on duplicate key update                       -- отдельная инструкция
        `other_field_1` = "update_value",
        `other_field_2` = values(`other_field_2`) -- ссылка на другую ячейку таблицы
