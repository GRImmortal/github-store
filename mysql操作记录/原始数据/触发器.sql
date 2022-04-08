-- 这个触发器的目的是再加入新的付款条目时，对应的发票总额自动累计，先加入payments然后触发器影响invoices
DROP TRIGGER payment_after_insert
DELIMITER $$
CREATE  TRIGGER payment_after_insert
AFTER INSERT ON payments #在插入payments之后触发
FOR EACH ROW #对于受影响的每一行

BEGIN
UPDATE invoices
SET payment_total = payment_total + NEW.amount
WHERE invoice_id = NEW.invoice_id;

INSERT INTO payments_audit
VALUES(NEW.client_id,NEW.date,NEW.amount,'Insert',NOW());

END $$
DELIMITER ;

INSERT INTO payments
VALUES(9,5,3,'2019-01-01',1,1)


-- 练习
 DROP TRIGGER payment_after_delete
DELIMITER $$
CREATE  TRIGGER payment_after_delete
AFTER DELETE ON payments #在删除payments之后触发
FOR EACH ROW #对于受影响的每一行

BEGIN
UPDATE invoices
SET payment_total = payment_total - OLD.amount
WHERE invoice_id = OLD.invoice_id;

INSERT INTO payments_audit
VALUES(OLD.client_id,OLD.date,OLD.amount,'Delete',NOW());

END $$
DELIMITER ;

DELETE FROM payments
WHERE payment_id = 9



-- 查看触发器
SHOW TRIGGERS
SHOW TRIGGERS LIKE 'payment%'查找以payment开头的triggers


-- 使用触发器进行审计


-- 事件，自动运行，设置好就行
SHOW VARIABLES LIKE 'event%';l
-- 该事件的目的是定期删除存储一年以上的审计数据
DROP EVENT yearly_delete_stale_audit_rows

DELIMITER $$
CREATE EVENT yearly_delete_stale_audit_rows
ON SCHEDULE 
-- 如果只想执行一次，就用at “日期”
EVERY 1 YEAR STARTS'2019-01-01' ENDS '2029-01-01'
DO BEGIN
DELETE FROM payments_audit
WHERE action_date < NOW()-INTERVAL 1 YEAR;
-- DATEADD(NOW(),INTERVAL -1 YEAR)

END $$
DELIMITER ;

SHOW EVENTS;
SHOW EVENTS LIKE 'yearly%';

ALTER EVENT 修改事件，之后的语法和创建一样

ALTER EVENT yearly_delete_stale_audit_rows DISABLE #暂时禁止事件 ENABLE #启用事件

