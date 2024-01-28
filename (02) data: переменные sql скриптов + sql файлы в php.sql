-- (PHP-SQL): SQL Переменные + .sql файлы в php:
/*
    переменные будут работать в загружаемых .sql файлах
    которые загружаются так:

        $commands = file_get_contents($location);   
        $this->_connection->multi_query($commands);
*/
    ---------------

    set @var_string = "my_var";
    set @var_num = "2";
    set @var_data = "2015-07-20";
