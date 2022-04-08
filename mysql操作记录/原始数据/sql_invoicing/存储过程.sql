#存储过程可以理解为将查询打包一体化，存储在函数中便直接查看和使用
#注意分隔符的使用
DELIMITER $$
CREATE PROCEDURE get_clients()
BEGIN
		SELECT * FROM clients;
END $$

DELIMITER ;

#另一个调用存储过程的方法
CALL get_clients()

DELIMITER $$
CREATE PROCEDURE get_invoices_with_balance()
BEGIN
		SELECT * FROM invoices_with_balance
		WHERE balance>0;
END $$

DELIMITER ;

-- 删除

#一般定义存储过程时会把删除放在前面，作为一整套
DROP PROCEDURE IF EXISTS get_clients_by_state;

DELIMITER $$
CREATE PROCEDURE get_clients_by_state
(
state CHAR(2) #表示有两个字符的字符串，或者用varchar表示可变字符串
)
BEGIN
		SELECT * FROM clients c
		WHERE c.state= state;
END $$
DELIMITER ;

CALL get_clients_by_state('CA')


-- 存储过程练习
DROP PROCEDURE IF EXISTS get_invoices_by_client;
DELIMITER $$
CREATE PROCEDURE get_invoices_by_client
(
client_id INT #表示有两个字符的字符串，或者用varchar表示可变字符串 先去设计表看格式
)
BEGIN
		SELECT * FROM invoices i
		WHERE i.client_id = client_id;
END $$
DELIMITER ;
CALL get_invoices_by_client(2)



-- 以下两种情况等价，但第二种更简洁
DELIMITER $$
CREATE PROCEDURE get_clients_by_state
(
state CHAR(2) #表示有两个字符的字符串，或者用varchar表示可变字符串
)
BEGIN
		IF state IS NULL THEN
			SELECT*FROM clients;
		ELSE
			SELECT*FROM clients c
			WHERE c.state = state;
		END IF;
END $$
DELIMITER ;
CALL get_clients_by_state(NULL)



DELIMITER $$
CREATE PROCEDURE get_clients_by_state
(
state CHAR(2) #表示有两个字符的字符串，或者用varchar表示可变字符串
)
BEGIN
		SELECT * FROM clients c
		WHERE c.state= IFNULL(state,c.state);
END $$
DELIMITER ;

CALL get_clients_by_state(NULL)


#练习

DELIMITER $$
CREATE  PROCEDURE get_payments
(
client_id INT,payment_method TINYINT #表示有两个字符的字符串，或者用varchar表示可变字符串
)
BEGIN
		SELECT * FROM payments p
			WHERE p.client_id= IFNULL(client_id,p.client_id) AND
		p.payment_method = IFNULL(payment_method ,p.payment_method);
END $$
DELIMITER ;
CALL get_payments(3,1)





-- 参数验证
DELIMITER $$
CREATE  PROCEDURE make_payments
(
payment_date DATE,#有bug，必须放在第一行
invoice_id INT,
payment_amount DECIMAL(9,2)#表示前面可以有九位，小数点后保留两位

)
BEGIN
		UPDATE invoices i
		SET
				i.payment_total=payment_amount,
				i.payment_date= payment_date
		WHERE i.invoice_id = invoice_id;
END $$
DELIMITER ;


-- 输出参数 get_unpaid 在函数里

-- 变量variables 这些变量仅在过程中可视，通过传递这些变量来获取输出参数,在存储过程中声明并定义本地变量，定义完后即无意义
DELIMITER $$
CREATE  PROCEDURE get_risk_factor()
BEGIN
DECLARE risk_factor DECIMAL(9,2) DEFAULT 0;
DECLARE invoices_total DECIMAL(9,2) ;
DECLARE invoices_count INT;

SELECT COUNT(*),SUM(invoice_total)
INTO invoices_count,invoices_total
FROM invoices;

SET risk_factor = invoices_total/invoices_count*5;

SELECT risk_factor;

END $$
DELIMITER ;


-- 函数，只能返回单一结果
SELECT
client_Id,
name,
get_risk_factor_for_client(client_id)
FROM clients

DROP FUNCTION IF EXISTS get_risk_factor_for_client

 
