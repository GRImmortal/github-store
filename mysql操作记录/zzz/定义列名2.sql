USE sql_store;
SELECT 
		last_name,
		first_name,
		points,
		(points + 10) * 100 AS 'discount_factor'
FROM customers
#WHERE customer_id = 1
#ORDER BY first_name
#注意这些语句的顺序，先选择，再定位，最后排序或者其他处理