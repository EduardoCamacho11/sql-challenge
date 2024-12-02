-- #1
SELECT e.employee_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
JOIN  salaries as s
ON e.employee_no = s.employee_no

--#2

SELECT e.first_name, e.last_name, e.hire_date
FROM employees as e
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- #3 
SELECT first_join.department_no, first_join.employee_no, d.department_name, first_join.last_name, first_join.first_name 
FROM (
	SELECT m.department_no, m.employee_no,e.last_name, e.first_name
	FROM department_manager as m
	LEFT JOIN employees as e ON m.employee_no = e.employee_no 
) AS first_join 
LEFT JOIN department as d ON first_join.department_no = d.department_no;

-- #4

SELECT first_join.department_no, first_join.employee_no, first_join.last_name, first_join.first_name, d.department_name
FROM (
	SELECT m.department_no, m.employee_no,e.last_name, e.first_name
	FROM department_emp as m
	LEFT JOIN employees as e ON m.employee_no = e.employee_no 
) AS first_join 
LEFT JOIN department as d ON first_join.department_no = d.department_no;

-- #5

SELECT e.first_name, e.last_name, e.sex
FROM employees as e
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- #6

SELECT first_join.employee_no, first_join.last_name, first_join.first_name
FROM (
	SELECT m.department_no, m.employee_no,e.last_name, e.first_name
	FROM department_emp as m
	LEFT JOIN employees as e ON m.employee_no = e.employee_no 
) AS first_join 
LEFT JOIN department as d ON first_join.department_no = d.department_no
WHERE department_name = 'Sales';

-- #7

SELECT first_join.employee_no, first_join.last_name, first_join.first_name, d.department_name
FROM (
	SELECT m.department_no, m.employee_no,e.last_name, e.first_name
	FROM department_emp as m
	LEFT JOIN employees as e ON m.employee_no = e.employee_no 
) AS first_join 
LEFT JOIN department as d ON first_join.department_no = d.department_no
WHERE department_name = 'Sales' OR department_name LIKE 'Development';

-- #8

SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;