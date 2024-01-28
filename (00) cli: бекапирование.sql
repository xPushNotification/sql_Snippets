-- (SQL-CLI): DB Backup:
/*
--//* бекапирование в другую базу данных:
    mysqladmin: -uroot -p<password> create <new name>
    mysqladmin: -uroot -p<password> --routines <old name> | 
                    mysql -uroot -p<mypassword> <new name>
    mysqladmin: -uroot -p<password> drop <old name>

--//* в .sql файл:
--//? создание бекапа:
    mysqldump [db_name] > filename.sql
    mysqldump --databases db_name1 db_name2 > filename.sql
--//? восстановление из файла бекапа:
    mysql db_name < filename.sql

--//* с подключением к серверу:
    mysqldump -h db.example.com -u username -p --compress dbname > dbname.sql
        -- or --
    mysqldump -h db.example.com -u username -p --compress dbname | gzip --stdout > dbname.sql.gz

--//* стандартное бекапирование (не затронет сохраненные процедуры):
    mysqldump -u username -p -R db_name > dump.sql
*/
