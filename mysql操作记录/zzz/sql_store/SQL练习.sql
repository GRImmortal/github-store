#练习3
SELECT*
#FROM order_items
#WHERE order_id = 6 AND unit_price * quantity > 30
FROM products
WHERE quantity_in_stock IN (49,38,72)