-- (SQL): Вставка Нескольких Строк за Раз:
-- строки вставляемые блоками в х10 раз быстрее работают чем по одиночке

    insert into `my_table`
        (`field_1`, `field_2`)
        values
        ("data1", "data2"),     -- 1st row
        ("data3", "data4"),     
        ("data5", "data6");     -- nst row
