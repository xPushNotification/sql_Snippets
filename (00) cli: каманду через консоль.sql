-- (SQL-CLI): Стандартные Действия через CLI:
/*
--//* логин:
    mysql --user=username --password=pwd --host=hostname test_db
    mysql -u username -p password -h hostname test_db

--//* запрос через cli:
    mysql -uroot -proot test -e'select * from people'

--//* выполнить скрипт и сохранить вывод в файл:
    mysql -uroot -proot test < my_script.sql > out.txt

*/
