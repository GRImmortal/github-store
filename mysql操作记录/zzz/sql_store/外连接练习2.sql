-- SELECT
-- 		p.product_id,
-- 		p.name,
-- 		oi.quantity
-- FROM products p
-- LEFT JOIN order_items oi
-- ON p.product_id=oi.product_id
-- ORDER BY p.product_id

SELECT
			o.order_id,
			o.order_date,
			c.first_name,
			sh.name AS shipper,
			os.name AS status
FROM orders o
LEFT JOIN customers c 
-- 			ON o.customer_id=c.customer_id
				USING(customer_id)#当列名完全相同可以使用using简化语句
LEFT JOIN shippers sh 
-- 			ON o.shipper_id=sh.shipper_id
				USING(shipper_id)
LEFT JOIN order_statuses os 
			ON o.status=os.order_status_id
ORDER BY OS.name
