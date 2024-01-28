-- (SQL): Действия в Полях по Событиям (on "Event"):
-- значения вроде времени вставки, промежуточных вычислений и тд.

    create table `tbl1`
    (
        `id` int null,
        `name` varchar(50) null,
        `address` varchar(50) null,
        `last_update` timestamp null default current_timestamp 
            on update                   -- событие
                current_timestamp       -- значение по событию
    )
