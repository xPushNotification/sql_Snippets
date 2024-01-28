-- (SQL): Встроенный Regexp:

    select * from `emps` where `phonenum`  REGEXP '4567$'
    select * from `emps` where `phonenum`  REGEXP '^[1234567890-]'
    select * from `emps` where `firstname  REGEXP '^N'
