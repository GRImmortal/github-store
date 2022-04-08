SELECT*
FROM products
WHERE unit_price>(
SELECT unit_price
FROM products
WHERE product_id = 3)


USE sql_hr;
SELECT*
FROM employees
WHERE salary > (
SELECT AVG(salary) 
FROM employees)


-- IN运算符
-- 查找未被订购过的产品
USE sql_store;
SELECT*
FROM products
WHERE product_id NOT IN (
SELECT DISTINCT product_id
FROM order_items)


USE sql_invoicing;
SELECT*
FROM clients
WHERE client_id NOT IN(
SELECT DISTINCT client_id
FROM invoices)




-- 练习
SELECT customer_id,first_name,last_name
FROM customers
WHERE customer_id IN (
SELECT o.customer_id
FROM order_items oi
JOIN orders o USING (order_id)
WHERE product_id = 3)


SELECT DISTINCT customer_id,first_name,last_name
FROM customers
JOIN orders o USING (customer_id)
JOIN order_items oi USING (order_id)
WHERE  oi.product_id = 3
ORDER BY customer_id



-- ALL关键字
-- 大于客户3的所有发票额的发票
USE sql_invoicing;
SELECT*
FROM invoices
WHERE invoice_total>(
SELECT MAX(invoice_total)
FROM invoices
WHERE client_id=3)


USE sql_invoicing;
SELECT*
FROM invoices
WHERE invoice_total> ALL(
SELECT invoice_total
FROM invoices
WHERE client_id=3)


-- ANY关键词
-- 找到发票数大于等于2的用户的信息
USE sql_invoicing;
SELECT*
FROM clients
WHERE client_id IN(
SELECT client_id
FROM invoices
GROUP BY client_id
HAVING COUNT(*) >=2)


USE sql_invoicing;
SELECT*
FROM clients
WHERE client_id = ANY(
SELECT client_id
FROM invoices
GROUP BY client_id
HAVING COUNT(*) >=2)



-- 相关子查询(查询多次)练习
USE sql_hr;
SELECT*
FROM employees e
WHERE salary > (
SELECT AVG(salary)
FROM employees
WHERE office_id=e.office_id
)

-- 相关子查询练习
USE sql_invoicing;
SELECT*
FROM invoices i
WHERE invoice_total > (
SELECT AVG(invoice_total)
FROM invoices
WHERE client_id=i.client_id)
ORDER BY client_id



-- EXISTS 运算符,返回指令，说明这个子查询中是否有符合条件的行
SELECT*
FROM clients c
WHERE EXISTS(
SELECT client_id
FROM invoices
WHERE client_id=c.client_id)


USE sql_store;
SELECT*
FROM products p
WHERE NOT EXISTS(
SELECT product_id
FROM order_items
WHERE product_id = p.product_id)


-- SELECT中的子查询
USE sql_invoicing;
SELECT
invoice_id,
invoice_total,
(SELECT AVG(invoice_total) FROM invoices) AS invoice_average,
invoice_total- (SELECT invoice_average) AS difference
FROM invoices




-- FROM中的子查询,直接将查询得到的表格作为FROM的来源

SELECT*
FROM(
SELECT
invoice_id,
invoice_total,
(SELECT AVG(invoice_total) FROM invoices) AS invoice_average,
invoice_total- (SELECT invoice_average) AS difference
FROM invoices
) AS sales_summary
WHERE invoice_total > 150 