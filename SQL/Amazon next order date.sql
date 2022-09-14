
/*
I have an order table in  with 2 fields product id and order date. This table is sorted by order date ( ascending order).  
Write a SQL to print product id, current order date, and next order date?

ORDER_DATE | PRODUCT_ID | QTY
-----------|------------|----------
2007/09/25 |1000        | 20
2007/09/26 |2000        | 15
2007/09/27 |1000        | 8
2007/09/28 |2000        | 12
2007/09/29 |2000        | 2
2007/09/30 |1000        | 4 
*/

solutions:

--without windows function
select o1."PRODUCT_ID" ,o1."ORDER_DATE"  ,min(o2."ORDER_DATE")  as next_order_date
from orders o1
left join orders o2 on o1."PRODUCT_ID"  = o2."PRODUCT_ID" and o1."ORDER_DATE"  != o2."ORDER_DATE" and o1."ORDER_DATE"  < o2."ORDER_DATE"
group by o1."ORDER_DATE" ,o1."PRODUCT_ID" ,o1."PRODUCT_ID" 
order by o1."PRODUCT_ID", o1."ORDER_DATE"


--using windows function 
select * ,lead("ORDER_DATE") over(partition by "PRODUCT_ID" order by "ORDER_DATE" asc)
from
orders o 
