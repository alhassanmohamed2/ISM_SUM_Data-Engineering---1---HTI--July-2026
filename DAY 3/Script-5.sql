SELECT * 
FROM employees 
where (birth_date  BETWEEN '1953-09-02' AND '1965-02-01') 
	AND gender = 'M' 
	AND first_name  LIKE  "%D___"  

order by birth_date DESC

SELECT * from dept_emp where  emp_no  = 11430



select count(*) from employees where first_name  IS  NULL


select DISTINCT  gender from employees 


select * from employees





select DISTINCT dept_no from dept_manager 




