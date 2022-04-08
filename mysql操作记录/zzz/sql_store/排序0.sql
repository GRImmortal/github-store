#SELECT*
#FROM customers
#ORDER BY first_name DESC #倒序排列
#ORDER BY state DESC,first_name DESC
SELECT first_name,last_name,10 AS points
FROM customers
ORDER BY points,first_name