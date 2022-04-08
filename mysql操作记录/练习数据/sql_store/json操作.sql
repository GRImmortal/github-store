UPDATE products
SET properties = JSON_OBJECT(
'weight',10,
'dimensions',JSON_ARRAY(1,2,3),
'manufacrture',JSON_OBJECT('name','sony'))
WHERE product_id = 1


SELECT*FROM products


SELECT product_id,JSON_EXTRACT(properties, '$.weight') AS 'weight'
FROM products
WHERE product_id = 1


SELECT product_id,properties -> '$.weight' AS 'weight'
FROM products
WHERE product_id = 1

SELECT product_id,properties -> '$.dimensions[0]' AS 'dimensions'
FROM products
WHERE product_id = 1


SELECT product_id,properties ->>'$.manufacrture.name' AS 'manufacrture' #双大于号直接得到字符串的内容，去掉引号
FROM products
WHERE properties ->>'$.manufacrture.name' = 'sony'


-- 更改内部信息
UPDATE products
SET properties = JSON_SET(
properties,
'$.weight',20,
'$.age',10)
WHERE product_id = 1


-- 删除内部信息
UPDATE products
SET properties = JSON_REMOVE(
properties,
'$.age')
WHERE product_id = 1