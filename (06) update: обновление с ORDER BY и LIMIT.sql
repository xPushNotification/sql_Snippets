-- (SQL): UPDATE вместе с ORDER BY и LIMIT:

    update `employees`
        set 
            `isConfirmed` = 1
        order by `joiningDate`
        limit 10
