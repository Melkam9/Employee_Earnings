use employees;
select * from employees;

-- The following code is used to display the average salary of different genders 
-- starting from the companies inception

SELECT 
	e.gender,
    ROUND(AVG(s.salary), 2) AS AVERAGE_Salary,
    YEAR(s.from_date) AS calander_year,
    d.dept_name
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
        JOIN
    dept_emp de ON de.emp_no = e.emp_no
        JOIN
    departments d ON de.dept_no = d.dept_no
    -- by joining the four tables we are able to get a detailed information of employees
GROUP BY  d.dept_name , e.gender, calander_year
order by AVERAGE_Salary desc;

-- The following code is used to display the highest earners from each departments

select  
  d.dept_name,
max(s.salary) as highest_Earner 
from employees e join salaries s on e.emp_no = s.emp_no 
join dept_emp de on de.emp_no = e.emp_no 
join departments d on d.dept_no = de.dept_no
group by dept_name
order by highest_earner desc;
