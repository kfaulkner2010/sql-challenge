--List the employee number, last name, first name, sex, and salary of each employee.
select e.emp_no,
e.first_name,
e.last_name,
e.sex,
s.salary

from employees e
join salaries s on s.emp_no = e.emp_no;

--or

select emp_no,
first_name,
last_name,
sex,
(select salary from salaries where employees.emp_no = salaries.emp_no) as salary

from employees;

--List the first name, last name, and hire date for the employees who were hired in 1986.

select first_name,
last_name,
hire_date

from employees

WHERE EXTRACT(YEAR FROM hire_date) = 1986;


--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT dm.emp_no AS manager,
dm.dept_no AS department_number,
d.dept_name AS department_name,
e.first_name,
e.last_name

FROM dept_manager dm
JOIN department d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name 

select e.first_name,
e.last_name,
e.emp_no,
de.dept_no,
d.dept_name

from employees e
join dept_emp de on de.emp_no = e.emp_no
join department d on d.dept_no = de.dept_no;


--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

select first_name,
last_name,
sex

from employees

where first_name = 'Hercules'
and last_name like 'B%';


--List each employee in the Sales department, including their employee number, last name, and first name.

select e.first_name,
e.last_name,
e.emp_no,
d.dept_name

from employees e
join dept_emp de on de.emp_no = e.emp_no
join department d on d.dept_no = de.dept_no

where d.dept_name = 'Sales'


--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.first_name,
e.last_name,
e.emp_no,
d.dept_name

from employees e
join dept_emp de on de.emp_no = e.emp_no
join department d on d.dept_no = de.dept_no

where d.dept_name in ('Sales', 'Development');


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

select last_name,
count(last_name) as name_count

from employees

group by last_name
order by name_count desc;













