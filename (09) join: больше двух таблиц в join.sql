-- (SQL): Больше чем Один JOIN:

    select
        t1.id as t1id,
        t2.id as t2id,
        t3.id as t3id
        from t1
            left join t2 on t2.id = t1.id       -- без ','
            left join t3 on t3.id = t1.id;      -- без 'outer'/'inner'
