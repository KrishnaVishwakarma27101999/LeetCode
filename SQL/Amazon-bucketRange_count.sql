/*

I have an employee table with 2 columns ( employee ID , commute distance).   I need the output as 
count of employees in 4 different buckets ( 0-5, 6-10, 11-15, 16+). 

EMPLOYEE_ID | COMMUTE_DISTANCE
------------|----------
        1   |   5 		
		2   |   10  	
		3   |   4 		
		4   |   19 		
		5   |   12 		
		6   |   7		

*/
		
Solution :		
    with cte as
        (select employee_id ,
            case when COMMUTE_DISTANCE between 0 and 5 then '0-5'
                when COMMUTE_DISTANCE between 6 and 10 then '6-10'
                when COMMUTE_DISTANCE between 11 and 15 then '11-15'
                when COMMUTE_DISTANCE >= 16+ then '16+' 
                else null end
                                as buckets
            from table)
            
            select buckets ,count(employee_id)
                from cte 
                where buckets != null
                group by buckets 
