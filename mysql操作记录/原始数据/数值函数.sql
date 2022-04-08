#搜索mysql string functions得到所有可用的函数

-- 取整

SELECT ROUND(5.3745,1)
SELECT ROUND(5.3745,2)

SELECT CEILING(5.7) #返回大于等于该数的最小整数

SELECT FLOOR(5.7) #返回小于等于该数的最小整数

SELECT ABS(-5.7)

SELECT RAND() #生成0-1随机数

-- 字符串函数

SELECT LENGTH('SKY') #字符串长度

SELECT LOWER('SKY') #小写

SELECT UPPER('sky')  #大写

SELECT LTRIM('  sky')#左修整
SELECT RTRIM('sky  ')#右修整

SELECT LEFT('KSDQWEJNCVN',4) #得到左侧前几个字符

SELECT SUBSTRING('KSDQWEJNCVN',4,3) #得到从第几个数开始的前几个字符

SELECT LOCATE('D','ASDGVASEBVD') #确定被搜索的字符的位置

SELECT REPLACE('ASDGVASEBVD','ASD','asd') #替换字符串

SELECT CONCAT('first','last') #连接字符串

USE sql_store;
SELECT CONCAT(first_name,' ',last_name) AS full_name
FROM customers

#日期函数
SELECT NOW(),CURDATE(),CURTIME()
SELECT YEAR(NOW())#同理可用month，day，hour，minute，second，dayname和monthname得到英文全称
SELECT EXTRACT(YEAR FROM NOW())

SELECT*
FROM orders
WHERE YEAR(order_date)=YEAR(NOW())-3 #找到表格中日期为今年的订单


#格式化日期和时间 搜索mysql date fomat string查找参考手册得到日期显示表
SELECT DATE_FORMAT(NOW(),'%M %d %y') #%Y得到四位数年份，%y得到两位数年份.%m得到两位数月份，%M得到月份全称,%d得到日期,%D得到大写日期

SELECT TIME_FORMAT(NOW(),'%H:%i %p') #小时，分钟，pm和am

-- 计算日期和时间

SELECT DATE_ADD(NOW(),INTERVAL 1 YEAR)

SELECT DATE_SUB(NOW(),INTERVAL 1 YEAR)

SELECT DATEDIFF('2019-01-05','2019-01-01') #计算两个日期差值，不考虑小时的时间间隔

SELECT TIME_TO_SEC('09:00')-TIME_TO_SEC('09:02')#计算从零开始的秒数

-- ifnull

USE sql_store;
SELECT 
order_id,
IFNULL(shipper_id,'Not assigned') AS shipper#用其他内容替换空值
FROM orders
ORDER BY order_id

USE sql_store;
SELECT 
order_id,
COALESCE(shipper_id,comments,'Not assigned') AS shipper#返回第一个非空值 如果第一个空，返回第二个，以此类推
FROM orders
ORDER BY order_id

USE sql_store;
SELECT 
CONCAT(first_name,' ',last_name) AS customer,
IFNULL(phone,'Unknown') AS phone
FROM customers


-- if函数
SELECT
order_id,
order_date,
IF(YEAR(order_date)=YEAR(NOW())-3,'Active','Archived') AS category
FROM orders
-- 练习，使用count时一定最后要用groupby排序，否则会显示总数，出现错误。
USE sql_store;
SELECT
product_id,
name,
COUNT(*) AS orders,
IF(COUNT(*) > 1,'Many times','Once')
FROM products 
JOIN order_items USING (product_id)
GROUP BY product_id,name


-- case 运算符
USE sql_store;
SELECT
order_id,
CASE
WHEN YEAR(order_date) = YEAR(NOW())-3 THEN 'Active'
WHEN YEAR(order_date) = YEAR(NOW())-4 THEN 'Last Year'
WHEN YEAR(order_date) < YEAR(NOW())-4 THEN 'Archived'
ELSE 'Future'
END AS category
FROM orders


SELECT
CONCAT(first_name,'',last_name) AS customer,
points,
CASE
WHEN points>3000 THEN 'Gold'
WHEN points>= 2000 THEN 'Sliver'
WHEN points<2000 THEN 'Bronze'
END AS category
FROM customers
ORDER BY points







