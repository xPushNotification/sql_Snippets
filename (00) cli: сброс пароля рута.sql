-- (SQL-CLI): Сброс Пароля Рута:
/*
--//* сброс системы авторизации на mysql:
    sudo /etc/init.d/mysql stop
    sudo mysqld --skip-grant-tables &
    mysql -u root

--//* установка нового пароля:
    flush privileges 
    set password for "root"@"localhost" = password("new_passowrd")
    flush privileges
    exit;

*/
