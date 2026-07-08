

SELECT emp_no , first_name, gender
from employees
where first_name = 'Georgi'

EXCEPT 

SELECT *
FROM employees_males 


select *
from employees
where gender = "F"



select distinct title
from titles



select * from titles
except
select * from titles where title = 'Technique Leader'

select * from titles  where not title =  'Technique Leader'


select * from titles 
where title in ('Senior Engineer', 
'Staff', 'Engineer',
'Senior Staff','Assistant Engineer','Manager')


select *
FROM  titles
where title not in ('Technique Leader')




select count(from_date) -- 2844047
from salaries s 


select count( distinct from_date) -- 6392
from salaries s 

select emp_no, salary, from_date , to_date
from salaries


SELECT e.first_name , d.dept_name 
FROM employees e
JOIN dept_manager dm 
ON e.emp_no = dm.emp_no 
JOIN departments d 
ON dm.dept_no = d.dept_no 

select * from dept_manager dm 


select * from employees where emp_no  = 




select e.first_name , s.salary , s.from_date 
from salaries s
inner join  employees e
on e.emp_no  = s.emp_no 


select  *
from dept_manager dm 
left join departments d
on d.dept_no  = dm.dept_no 



DELETE  from dept_manager 
where dept_no = "d001"


select *
from salaries s 
where s.salary > (select avg(salary) from salaries s ) -- 63810.7448


select e.first_name , 
s.salary, 
CASE s.salary -(select avg(salary) from salaries s ) 
	WHEN  s.salary -(select avg(salary) from salaries s )  < 0 THEN "BELOW AVG"
	ELSE "ABOVE AVG"
END
 as diff_avg, from_date

from salaries s
join employees e
on e.emp_no = s.emp_no 
-- where s.salary > (select avg(salary) from salaries s ) 

 

select * 
from employees
join dept





SELECT e.first_name , dm.dept_no 
FROM employees e
JOIN dept_manager dm 
ON e.emp_no = dm.emp_no 

select *
from dept_manager



select mohamed_ahmed_modohe_mohes.first_name from employees mohamed_ahmed_modohe_mohes
where emp_no  in (select emp_no from dept_manager)

select count(*)
from (select * from employees where gender = "M") as emp_male
where emp_male.emp_no  BETWEEN  10005 and 10100



with t1 as ( -- virtual table
    SELECT e.first_name,
           s.salary,
           s.from_date,
           (s.salary - (SELECT avg(salary) FROM salaries)) AS diff_avg
           
           
           
           
           
    FROM salaries s 
    JOIN employees e ON e.emp_no = s.emp_no
)
           
           
           


SELECT first_name,
       salary,
       from_date,
       diff_avg,
       CASE 
           WHEN diff_avg > 0 THEN 'Above AVG'
           WHEN diff_avg < 0 THEN 'Below AVG'
       END AS salary_status
       

       
FROM t1








WITH DeptAvg AS (
    -- Calculate average salary for EVERY department once
    SELECT de.dept_no, AVG(s.salary) AS avg_dept_salary
    FROM salaries s
    JOIN dept_emp de ON s.emp_no = de.emp_no
    GROUP BY de.dept_no
)


SELECT e.first_name, e.last_name, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN DeptAvg da ON de.dept_no = da.dept_no
WHERE s.salary > da.avg_dept_salary;




