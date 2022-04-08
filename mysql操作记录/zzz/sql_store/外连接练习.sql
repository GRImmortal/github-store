-- 内部链接只选取两者或多者共有的数据，外部链接则会取最多的
-- SELECT
-- 		c.customer_id,
-- 		c.first_name,
-- 		o.order_id
-- FROM customers c
-- JOIN orders o
-- 		ON c.customer_id = o.customer_id
-- ORDER BY customer_id #可以看出只显示有订单的客户，不是全
-- SELECT
-- 		c.customer_id,
-- 		c.first_name,
-- 		o.order_id
-- FROM customers c
-- LEFT JOIN orders o #LEFT选择左侧表全部主键,right选择右侧
-- 		ON c.customer_id = o.customer_id
-- ORDER BY customer_id
#优化，使排序正常并且显示正常
-- SELECT
-- 		c.customer_id,
-- 		c.first_name,
-- 		o.order_id
-- FROM orders o
-- RIGHT JOIN customers c 
-- 		ON o.customer_id = c.customer_id
-- ORDER BY c.customer_id
SELECT
		c.customer_id,
		c.first_name,
		o.order_id,
		sh.name
FROM customers c
LEFT JOIN orders o #LEFT选择左侧表全部主键,right选择右侧
		ON c.customer_id = o.customer_id
LEFT JOIN shippers sh
		ON o.shipper_id=sh.shipper_id
ORDER BY c.customer_id