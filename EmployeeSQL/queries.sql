--import data and view tables

select * from departments
select * from dept_emp
select * from dept_manager
select * from employees
select * from salaries
select * from titles


--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no, employees.last_name, employees.first_name, salaries.salary 
from employees
inner join salaries on salaries.emp_no=employees.emp_no

--2.List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date 
from employees
where date_part('year',hire_date)=1986

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
--department number & employee number
--select * from dept_manager
--department name
--select * from departments
--employees first & last name
--select * from employees

select dept_manager.dept_no,  departments.dept_name,dept_manager.emp_no, employees.last_name, employees.first_name
from dept_manager
inner join departments on departments.dept_no=dept_manager.dept_no
inner join employees on employees.emp_no=dept_manager.emp_no

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
--select * from dept_emp

select dept_emp.emp_no, departments.dept_name, employees.last_name, employees.first_name
from dept_emp
inner join departments on departments.dept_no = dept_emp.dept_no
inner join employees on employees.emp_no=dept_emp.emp_no

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where first_name='Hercules' and last_name like ('Q%')

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select dept_emp.dept_no,dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name 
from dept_emp
inner join departments on 
	(
	select departments.dept_no 
	where departments.dept_name='Sales'
	)=dept_emp.dept_no
left join employees on employees.emp_no = dept_emp.emp_no

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select dept_emp.emp_no,employees.last_name, employees.first_name, departments.dept_name 
from dept_emp
inner join departments on departments.dept_no = dept_emp.dept_no
inner join employees on dept_emp.emp_no=employees.emp_no
where dept_name = 'Sales' or dept_name ='Development' 

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name,count(*) 
from employees
group by last_name
order by count desc


