USE sql_hr;

-- SELECT*
-- FROM employees e
-- JOIN employees m ON e.reports_to = m.employee_id#相当于将每位员工的经理的信息加进表格

-- SELECT e.employee_id,e.first_name,m.first_name AS manager
-- FROM employees e
-- JOIN employees m ON e.reports_to = m.employee_id#相当于将每位员工的经理的信息加进表格
SELECT e.employee_id,e.first_name,m.first_name AS manager
FROM employees e
LEFT JOIN employees m ON e.reports_to = m.employee_id