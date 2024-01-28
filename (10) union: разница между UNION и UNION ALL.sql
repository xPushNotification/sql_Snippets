-- (SQL): Разница Между UNION / UNION ALL:
/*
    UNION               будет удалять дубликаты
    UNION ALL           не будет

    tbl:employee:
    --------------------------------
    emdid		empname		empcode
    1			one			1609
    2			two			2568   
    --------------------------------

    tbl:customers:
    --------------------------------
    custid 		custname	custcode
    1			one			2233
    2			thr			3421    
    --------------------------------
*/
    select `empname` as `name` from `employee`
    union 
    select `custname` as `name` from `customers`
    --//* one, two, thr

    select `empname` as `name` from `employee`
    union all
    select `custname` as `name` from `customers`
    --//* one, two, one, thr

