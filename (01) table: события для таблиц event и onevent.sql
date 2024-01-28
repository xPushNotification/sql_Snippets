-- (SQL): События для таблиц (Events / OnEvents):

    -- xxsql обладает собственный планировщиком событий 
    -- события привязываются к самой базе данных
    -- и являются по сути хранимыми процедурами
    -- планировщик обычно используется чтобы удалять мусор

    set global event_scheduler = ON;

--//* событие делающее drop каждый день:

    drop event if exists "delete7dayoldmessages"
        DELIMITER $$
        create event "delete7dayoldmessages"
            on schedule every 1 day start "2015-09-01 00:00:00"
            on completion preserve      -- if doesnt set -> delete after 1st start
        go begin                        -- body
            delete from `messages`
                where datediff( now(), updatedt ) > 6
        end$$
        DELIMITER

--//* onevent, делающий dorp каждые 10 минут:

    drop event if exists "every10minutescleanup"
        DELIMITER $$
        create event "every10minutescleanup"
            on schedule every 10 minute starts "2015-09-01 00:00:00"
            on completion preserve
        do begin
            delete from `messages`
            where timestampdiff(hour, updatedt, now()) > 168
        end$$
        DELIMITER;

--//* показать предустановленные события:

    show events from dbname;
    show events;
    show events\g;

--//* удалить событие по имени:

    drop event "someeventname";
