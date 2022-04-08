-- 只会返回非空值
SELECT 
MAX(invoice_total) AS highest,
MIN(invoice_total) AS lowest,
AVG(invoice_total) AS average,
SUM(invoice_total) AS total,
COUNT(DISTINCT client_id) AS total_records #不计算重复值
-- COUNT(invoice_total) AS number_of_invoices,
-- COUNT(*) AS total_records #表格中共有多少条目
FROM invoices
WHERE invoice_date>'2019-07-01' #限制数据范围

-- 练习
SELECT
'First half of 2019' AS date_range,
SUM(invoice_total) AS total_sales,
SUM(payment_total) AS total_payments,
SUM(invoice_total-payment_total) AS what_we_except
FROM invoices
WHERE invoice_date BETWEEN '2019-01-01' AND '2019-06-30'
UNION
SELECT
'Second half of 2019' AS date_range,
SUM(invoice_total) AS total_sales,
SUM(payment_total) AS total_payments,
SUM(invoice_total-payment_total) AS what_we_except
FROM invoices
WHERE invoice_date BETWEEN '2019-07-01' AND '2019-12-31'
UNION
SELECT
'TOTAL' AS date_range,
SUM(invoice_total) AS total_sales,
SUM(payment_total) AS total_payments,
SUM(invoice_total-payment_total) AS what_we_except
FROM invoices
WHERE invoice_date BETWEEN '2019-01-01' AND '2019-12-31'

-- 顺序很重要
SELECT 
client_id,
SUM(invoice_total) AS total_sales
FROM invoices
WHERE invoice_date>='2019-07-01'
GROUP BY client_id
ORDER BY total_sales DESC

-- 得到group by的多个组合
SELECT 
c.state,
c.city,
SUM(invoice_total) AS total_sales
FROM invoices i
JOIN clients c USING (client_id)
GROUP BY state,city

-- 练习
SELECT 
p.date,
pm.name AS payment_methods,
SUM(amount) AS total_payments
FROM payments p 
JOIN payment_methods pm ON p.payment_method=pm.payment_method_id
GROUP BY date,name
ORDER BY date


-- having 语句在分组之后筛选数据
SELECT 
client_id,
SUM(invoice_total) AS total_sales,
COUNT(*) AS number_of_invoices
FROM invoices
-- WHERE total_sales>500#因为这个条件出现在计算结果之前所以不正确
GROUP BY client_id
HAVING total_sales>800 AND number_of_invoices>5x


-- 练习
USE sql_store;
SELECT 
c.customer_id,
c.first_name,
c.last_name,
SUM(oi.quantity*oi.unit_price) AS total_sales
FROM customers c
JOIN orders o USING (customer_id)
JOIN order_items oi USING(order_id)
WHERE state = 'VA'
GROUP BY 
c.customer_id,
c.first_name,
c.last_name
HAVING total_sales>100


-- rollup运算符 计算每一分组的总值
USE sql_invoicing;
SELECT 
state,
city,
SUM(invoice_total) AS total_sales
FROM invoices
JOIN clients c USING (client_id)
GROUP BY state,city WITH ROLLUP


-- rollup练习
USE sql_invoicing;
SELECT
pm.name AS payment_method,
SUM(amount) AS total
FROM payments p
JOIN payment_methods pm ON p.payment_method=pm.payment_method_id
GROUP BY  WITH ROLLUP
