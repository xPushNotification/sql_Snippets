-- (SQL): Транзакции (наборы связанных операций):

start transaction               -- старт
                                -- тело
    set @transAmt = "500";      -- ';' конец каждой операции
    select @availableAmt := `ledgerAmt` from `tbl1` where `id`=1 for update;
    update `tbl1` set `ledgerAmt`=`ledgerAmt`-@transAmt where `id`=1;
    update `tbl1` set `ledgerAmt`=`ledgerAmt`-@transAmt where `id`=2;

commit;                         -- конец

