 USE sql_invoicing;
 CREATE VIEW sales_by_client AS
 SELECT
 c.client_id,
 c.name,
 SUM(invoice_total) AS total_sales
 FROM clients c
 JOIN invoices i USING (client_id)
 GROUP BY client_id,name
 #创建视图可以当作表格使用（虚拟表）


 USE sql_invoicing;
 CREATE VIEW clients_balance AS
 SELECT
 i.client_id,
 c.name,
 SUM(invoice_total-payment_total) AS balance
 FROM invoices i
 JOIN clients c USING (client_id)
 GROUP BY client_id,name
 
--  更改和删除视图

-- DROP VIEW invoices_with_balance 或者是用creat or replace 不用另外删除，如果有修改会自动替换


-- 可更新视图 不包含distinct ，min，max，sum等。以及group by，having，union等运算符
CREATE OR REPLACE VIEW invoices_with_balance AS
SELECT
invoice_id,
number,
client_id,
invoice_total,
payment_total,
invoice_total-payment_total AS balance,
invoice_date,
due_date,
payment_date
FROM invoices
WHERE (invoice_total-payment_total) >0
WITH CHECK OPTION


DELETE FROM invoices_with_balance
WHERE invoice_id = 1
-- 给invoice_id = 2的due_date加两天
UPDATE invoices_with_balance
SET due_date = DATE_ADD(due_date,INTERVAL 2 DAY)
WHERE invoice_id = 2

UPDATE invoices_with_balance
SET payment_total = invoice_total
WHERE invoice_id = 2
