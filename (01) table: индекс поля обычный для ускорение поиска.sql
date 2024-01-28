-- (SQL): Индекс Поля для Ускорения Поиска:

--//? при добавлении индекса - медленнее insert, быстрее select

    alter table `table_name`
        add index `index_name` (`column_name`)


--//? вообще конечно поле индекса надо создавать на момент создания таблицы:

create table user_notification_main(
   nentm_id int auto_increment primary key,
   nentm_user_to varchar(64) not null,
);
CREATE INDEX idx_user_notification ON user_notification_main (nentm_user_to);

