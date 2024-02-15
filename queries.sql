--Data analysis 

---(1)List the employee number, last name, first name, sex, and salary of each employee 
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary 
from employees
inner join salaries on employees.emp_no = salaries.emp_no

---(2)List the first name, last name, and hire date for the employees who were hired in 1986
select first_name, last_name, hire_date
from employees
where extract(year from hire_date) = 1986

---(3)List the manager of each department along with their department number, department name, employee number, last name, and first name
select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from dept_manager
left join departments
on dept_manager.dept_no = departments.dept_no
left join employees 
on dept_manager.emp_no = employees.emp_no

---(4)List the department number for each employee along with that employee’s employee number, last name, first name, and department name
select dept_emp.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
left join employees
on dept_emp.emp_no = employees.emp_no
left join departments 
on dept_emp.dept_no = departments.dept_no
order by dept_no asc

---(5)List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%'

---(6)List each employee in the Sales department, including their employee number, last name, and first name
select emp_no, last_name, first_name
from employees
where emp_no in
(select emp_no
from dept_emp
where dept_no in
(select dept_no
from departments
where dept_name = 'Sales'))

---(7)List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
left join dept_emp
on employees.emp_no = dept_emp.emp_no
left join departments
on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales' or dept_name = 'Development'

---(8)List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) 
select last_name, count(last_name) 
from employees
group by last_name
order by count desc

