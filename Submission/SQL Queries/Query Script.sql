-- 1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT 
		e.emp_no AS "Employee No.",
		e.last_name AS "Last Name",
		e.first_name AS "First Name",
		e.sex AS "Sex",
		s.salary AS "Salary"
FROM employees AS e
JOIN salaries AS s on e.emp_no = s.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT 
		first_name AS "First Name",
		last_name AS "Last Name",
		hire_date AS "Hire Date"	
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date;

-- 3. List the manager of each department along with their department number, department name, 
-- employee number, last name, and first name.

SELECT 
		manager.id AS "Manager No.",
		dept.dept_no AS "Department No.",
		dept.dept_name AS "Department Name",
		manager.emp_no AS "Employee No.",
		emp.last_name AS "Last Name",
		emp.first_name AS "First Name"
FROM dept_manager AS manager
JOIN departments AS dept ON manager.dept_no = dept.dept_no
JOIN employees AS emp ON manager.emp_no = emp.emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name.

SELECT
		e.emp_no AS "Employee No.",
		e.last_name AS "Last Name",
		e.first_name AS "First Name",
		dept.dept_no AS "Dept No.",
		dept.dept_name AS "Dept Name"
FROM employees AS e
JOIN dept_emp ON e.emp_no = dept_emp.emp_no
JOIN departments AS dept ON dept_emp.dept_no = dept.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules 
-- and whose last name begins with the letter B.

SELECT 
		first_name AS "First Name",
		last_name AS "Last Name",
		sex AS "Sex"
FROM employees
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT 
		e.emp_no AS "Employee No.",
		e.last_name AS "Last Name",
		e.first_name AS "First Name",
		d.dept_name AS "Department"
FROM departments AS d
JOIN dept_emp ON d.dept_no = dept_emp.dept_no
JOIN employees AS e ON e.emp_no = dept_emp.emp_no
WHERE d.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.

SELECT 
		e.emp_no AS "Employee No.",
		e.last_name AS "Last Name",
		e.first_name AS "First Name",
		d.dept_name AS "Department"
FROM departments AS d
JOIN dept_emp ON d.dept_no = dept_emp.dept_no
JOIN employees AS e ON e.emp_no = dept_emp.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';
		
-- 8. List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).

SELECT
		last_name AS "Last Name",
		Count(last_name) AS "Count of Common Last Names"
FROM employees
GROUP BY last_name
ORDER BY Count(last_name) DESC;