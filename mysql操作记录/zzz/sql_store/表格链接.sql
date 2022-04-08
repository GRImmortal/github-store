-- SELECT *
-- FROM orders
-- JOIN customers ON orders.customer_id = customers.customer_id


-- SELECT order_id,orders.customer_id,first_name,last_name
-- FROM orders
-- JOIN customers ON orders.customer_id = customers.customer_id


-- SELECT order_id,o.customer_id,first_name,last_name 因为customer_id在两个表中都存在所以必须指定来自哪个表
-- FROM orders o
-- JOIN customers c ON o.customer_id = c.customer_id 缩写直接跟在后边


-- SELECT*
-- FROM order_items oi
-- JOIN products p on oi.product_id = p.product_id

SELECT order_id,oi.product_id,quantity,p.unit_price
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id