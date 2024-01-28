-- (SQL): Функции Агрегации для GROUP BY:
/*
    tbl:orders:

 	----------+------------+----------+-------+--------+
	| orderid | customerid | customer | total | items  |
	+---------+------------+----------+-------+--------+
	| 1 	  | 1 		   | Bob 	  | 1300  | 10 	   |
	| 4 	  | 1 		   | Bob 	  | 300   | 6 	   |
	| 5 	  | 2 		   | Carly 	  | 800   | 3 	   |
	| 6 	  | 2 		   | Carly 	  | 1000  | 12 	   |
	| 10 	  | 1 		   | Bob 	  | 500   | 15 	   |
	+---------+------------+----------+-------+--------+   
*/
--//* count:
    select
        `customer`,
        count (*) as `orders`
        from `orders`
            group by `customer`
            order by `customer`
        ---------------------------
        /*
            customer		orders 
            bob				3
            carly			2
        */
        ---------------------------

--//* sum:
    select
        `customer`,
        sum(`total`) as `sum_total`,
        sum(`items`) as `sum_items`
        from `orders`
            group by `customer`
            order by `customer`
        --------------------------------------
        /*
        customer    sum_total		sum_items
        bob		    2100			31
        carly	    1800			15
        */
        --------------------------------------

--//* avg:
    select 
        `customer`,
        avg(`total`) as `avg_total`,
        from `orders`
            group by `customer`
            order by `customer`
        ----------------------
        /*
        customer    avg_total
        bob	        700
        carly       900
        */
        ----------------------
