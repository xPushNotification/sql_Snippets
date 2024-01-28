-- (SQL-CLI): Администрирование Пользователей:

/*
    $mysql -u root -p
    mysql> create user "my_new_user"@"localhost" identified by "test_password";
    mysql> grant all privileges on my_db.* to "my_new_user"@"localhost" identified by "my_password";

    mysql> rename user "user"@"%" to "new_name"@"%";
*/

