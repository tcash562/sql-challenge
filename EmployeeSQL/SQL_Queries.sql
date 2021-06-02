-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, 
employees.hire_date, salaries.salary
FROM employees
LEFT JOIN salaries ON employees.emp_no = salaries.emp_no
ORDER BY employees.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
Select * From employees
WHERE date_part('year',hire_date) = 1986

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT employees.emp_no, employees.last_name, employees.first_name, dept_manager.dept_no, departments.dept_name
FROM ((employees
INNER JOIN dept_manager ON employees.emp_no = dept_manager.emp_no)
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no);

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no, departments.dept_name
FROM ((employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no)
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no);

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT last_name, first_name, gender
from employees
where first_name = 'Hercules' and last_name like 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name in ('Sales', 'Development')

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC;
