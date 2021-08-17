********************************************************************************************************
1. List the following details of each employee: employee number, last name, first name, sex, and salary.
********************************************************************************************************

SELECT
	em. emp_no
	, em. last_name
	, em. first_name
	, em. sex
	, s. salary
FROM 
	employees AS em
	INNER JOIN salaries AS s
	ON em.emp_no = s.emp_no
LIMIT(10);

**********************************************************************************
2. List first name, last name, and hire date for employees who were hired in 1986.
**********************************************************************************

SELECT 
	first_name
	, last_name
	, hire_date 
FROM 
	employees
WHERE extract(year from hire_date) = 1986
LIMIT (5);

****************************************************************************************************************************************************************
3. List the manager of each department with the following information: department number, department name, the managers employee number, last name, first name.
****************************************************************************************************************************************************************

SELECT
	d.dept_no
	, dep.dept_name
	, em.emp_no
	, em.last_name
	, em.first_name
FROM 
	employees AS em
INNER JOIN
	dept_manager AS d
	ON em.emp_no = d.emp_no
	JOIN departments AS dep
	ON d.dept_no = dep.dept_no
LIMIT(5);


************************************************************************************************************************************	
4. List the department of each employee with the following information: employee number, last name, first name, and department name.
************************************************************************************************************************************

SELECT
	em.emp_no
	, em.last_name
	, em.first_name
	, dep.dept_name
FROM 
	employees AS em
INNER JOIN 
	dept_emp AS de
	ON em.emp_no = de.emp_no
	JOIN departments AS dep
	ON de.dept_no = dep.dept_no
LIMIT(5);

******************************************************************************************************************	
5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
******************************************************************************************************************

SELECT
	first_name
	, last_name
	, sex 
FROM 
	employees 
WHERE
	first_name = 'Hercules' AND last_name LIKE 'B%'
LIMIT(5);

***************************************************************************************************************************
6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
***************************************************************************************************************************

SELECT 
	em.emp_no
	, em.last_name
	, em.first_name
	, dep.dept_name
FROM 
	employees AS em
INNER JOIN
	dept_emp AS de
	ON em.emp_no = de.emp_no
	JOIN departments AS dep
	ON de.dept_no = dep.dept_no
	WHERE dep.dept_name = 'Sales'

********************************************************************************************************************************************
7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
********************************************************************************************************************************************

SELECT
em.emp_no
, em.last_name
, em.first_name
, dep.dept_name
FROM 
	employees AS em
INNER JOIN 
	dept_emp AS de
	ON em.emp_no = de.emp_no
	JOIN departments AS dep
	ON de.dept_no = dep.dept_no
	WHERE 
	dep.dept_name = 'Sales' OR dep.dept_name = 'Development'
LIMIT(5);	

***********************************************************************************************************************
8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
***********************************************************************************************************************

SELECT 
	last_name
	, COUNT(last_name) AS "Repeated last_name COUNT"
FROM 
	employees 
GROUP BY 
	last_name
HAVING COUNT
	(last_name) > 1
ORDER BY  
	"Repeated last_name COUNT" DESC
LIMIT (5);
