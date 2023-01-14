SELECT r.region_name, COUNT(first_name)
FROM employees e
JOIN departments d ON (e.department_id = d.department_id)
JOIN locations l ON (d.location_id = l.location_id)
JOIN countries c ON (l.country_id = c.country_id)
JOIN regions r ON (c.region_id = r.region_id)
GROUP BY r.region_name;

SELECT first_name, last_name, department_name, job_id, street_address, country_name, region_name
FROM employees e
JOIN departments d ON (e.department_id = d.department_id)
JOIN locations l ON (d.location_id = l.location_id)
JOIN countries c ON (l.country_id = c.country_id)
JOIN regions r ON (c.region_id = r.region_id);

SELECT e.first_name, e.last_name, COUNT(e2.first_name)
FROM employees e
JOIN employees e2 
ON (e.employee_id = e2.manager_id)
GROUP BY e.first_name, e.last_name
HAVING COUNT(e2.first_name) > 6;

SELECT department_name, COUNT(first_name)
FROM departments
JOIN employees USING (department_id)
GROUP BY department_name
HAVING COUNT(first_name) > 30;

SELECT department_name
FROM departments d
LEFT OUTER JOIN employees e
ON (d.department_id = e.department_id)
WHERE e.first_name IS NULL;

SELECT emp1.* FROM employees emp1
JOIN employees emp2
ON (emp1.employee_id = emp2.manager_id)
WHERE
TO_CHAR(emp1.hire_date, 'YYYY') = '2005'
AND
emp2.hire_date < TO_DATE('01-JAN-2005', 'dd-MON-YYYY');

SELECT country_name, region_name
FROM countries
NATURAL JOIN regions;

SELECT first_name, last_name, salary
FROM employees
NATURAL JOIN jobs
WHERE salary < min_salary + 1000;

SELECT DISTINCT first_name, last_name, country_name
FROM employees e
FULL OUTER JOIN departments d ON (e.department_id = d.department_id)
FULL OUTER JOIN locations l ON (d.location_id = l.location_id)
FULL OUTER JOIN countries c ON (l.country_id = c.country_id);

SELECT first_name, last_name, country_name
FROM employees
CROSS JOIN countries;

SELECT r.region_name, COUNT(first_name)
FROM employees e, departments d, locations l, countries c, regions r
WHERE e.department_id = d.department_id AND d.location_id = l.location_id AND l.country_id = c.country_id AND c.region_id = r.region_id
GROUP BY r.region_name;

SELECT department_name
FROM departments d, employees e
WHERE d.department_id = e.department_id(+) AND e.first_name IS NULL;