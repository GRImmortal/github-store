INSERT INTO customers(
		last_name,
		first_name,
		birth_date,
		address,
		city,
		state)
VALUES(
		'Smith',
		'John',
		'1990-01-01',
		'address',
		'China',
		'ZZ')
-- 添加新的一行，未指定的则按默认填充


INSERT INTO shippers(name)
VALUES('Shipper1'),
			('Shipper2'),
			('Shipper3')
-- 一次性插入多行


INSERT INTO orders(customer_id,order_date,status)
VALUES(1,'2019-01-02',1);
INSERT INTO order_items #因为每一列都需要指定所以不用专门指定列名
VALUES(LAST_INSERT_ID(),1,1,2.95),
			(LAST_INSERT_ID(),2,1,3.95)
-- 插入分层数据


CREATE TABLE orders_archived AS
SELECT*FROM orders
-- 复制表
-- 截断表格，清除表格内所有数据，再进行选择性复制


INSERT INTO orders_archived
SELECT*
FROM orders
WHERE order_date<'2019-01-01'
-- 选择性插入数据


USE sql_invoicing;
CREATE TABLE invoices_archived AS
SELECT 
			i.invoice_id,
			i.number,
			c.name AS client,
			i.invoice_total,
			i.payment_total,
			i.invoice_date,
			i.payment_date,
			i.due_date
FROM invoices i
JOIN clients c
	USING(client_id)
WHERE payment_date IS NOT NULL #过滤掉未支付的订单，完美!
ORDER BY invoice_id
-- 创建一个新的表格并且处理内部数据


UPDATE invoices
SET
payment_total=invoice_total*0.5,
payment_date=due_date
WHERE invoice_id = 3
-- 更新数据


UPDATE invoices
SET
payment_total=invoice_total*0.5,
payment_date=due_date
WHERE client_id = 3
-- 更新多条数据

USE sql_store;
UPDATE customers
SET points=points+50
WHERE birth_date <'1990-01-01'
-- 限定条件更新表格

USE sql_invoicing;
UPDATE invoices
SET
payment_total=invoice_total*0.5,
payment_date=due_date
WHERE client_id=(SELECT client_id FROM clients WHERE name = 'Myworks')
-- 运用子查询进行表格更新

USE sql_invoicing;
UPDATE invoices
SET
payment_total=invoice_total*0.4,
payment_date=due_date
WHERE client_id IN (SELECT client_id FROM clients WHERE state IN ('CA', 'NY'))#当涉及多条时，要用in，不能用等号
-- 子查询，多条信息


USE sql_invoicing;
UPDATE invoices
SET
payment_total=invoice_total*0.4,
payment_date=due_date
WHERE payment_date IS NULL
-- 表内条目的子查询可以直接使用WHERE语句，不用SELECT

USE sql_store;
UPDATE orders
SET comments = 'Gold Customers'
WHERE customer_id IN (SELECT customer_id
FROM customers
WHERE points>3000)
-- 更新表格并且通过子查询插入特定讯息
