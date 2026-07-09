select distinct de.emp_no 
from employees e
join dept_manager  dm
on e.emp_no  = dm.emp_no 
join dept_emp de
on dm.dept_no = de.dept_no 


select count(*)
from dept_emp 

select * 
from employees



CREATE USER 'technical_manger'@'localhost' IDENTIFIED BY 'Zam62P"9;6S:'




GRANT ALL PRIVILEGES ON employees.* TO 'technical_manger'@'localhost'

REVOKE ALL PRIVILEGES ON employees.* FROM 'technical_manger'@'localhost'


SHOW GRANTS FOR 'technical_manger'@'localhost';

REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'technical_manger'@'localhost';


SHOW GRANTS FOR 'technical_manger'@'localhost';

REVOKE DELETE ON employees.* FROM 'technical_manger'@'localhost';
FLUSH PRIVILEGES;


SELECT user, host FROM mysql.user WHERE user = 'technical_manger';


REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'technical_manger'@'localhost';


GRANT SELECT, INSERT, UPDATE ON employees.* TO 'technical_manger'@'localhost';

GRANT DELETE ON employees.* TO 'technical_manger'@'localhost';



GRANT DELETE ON employees.departments TO 'technical_manger' WITH GRANT OPTION;


START TRANSACTION;

-- Step 1: "Close" his current Senior Engineer title by updating the to_date to today
UPDATE titles 
SET to_date = CURRENT_DATE 
WHERE emp_no = 10001 AND title = 'Senior Engineer' AND to_date = '9999-01-01';

-- Step 2: Insert his new title, making the to_date '9999-01-01' so we know it is his active role
INSERT INTO titles (emp_no, title, from_date, to_date) 
VALUES (10001, 'Staff', CURRENT_DATE, '9999-01-01');

-- If both queries succeeded without syntax errors, we lock it in!
COMMIT;

-- (If something went wrong, you would run ROLLBACK; instead)


select * 
from titles 
WHERE emp_no = 10001 ;


select * 
from dept_manager dm 
WHERE dept_no = 'd005' AND to_date = '9999-01-01';



select * 
from salaries s 


select * 
from current_dept_emp cde 


select *
from dept_emp


select *
FROM dept_emp de 
where de.to_date  = '9999-01-01'


-- 10179 1994-03-21


UPDATE current_dept_emp 
set from_date = "1994-03-22"
where emp_no = 10178





-- Run this ONCE to create the virtual table
CREATE VIEW v_current_employee_roster AS
SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name, 
    d.dept_name, 
    s.salary
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no 
JOIN departments d ON de.dept_no = d.dept_no
JOIN salaries s ON e.emp_no = s.emp_no
-- Only grab active departments and active salaries
WHERE de.to_date = '9999-01-01' AND s.to_date = '9999-01-01';




EXPLAIN select *
from employees
where last_name  = "Waterhouse"


CREATE INDEX idx_lastname ON employees(last_name)


