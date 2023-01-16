SELECT first_name, last_name, salary FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT (SELECT MAX(LENGTH(first_name)) FROM employees), (SELECT MIN(min_salary) FROM jobs) FROM dual;

SELECT first_name, last_name FROM employees
WHERE employee_id IN (SELECT manager_id FROM employees);

SELECT department_name, MIN(salary), MAX(salary)
FROM (
SELECT salary, department_name FROM employees e
JOIN departments d
ON e.department_id = d.department_id
)
GROUP BY department_name;

SELECT first_name, last_name, salary FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees) / 5;

SELECT job_title, salary FROM employees e
JOIN jobs j ON (e.job_id = j.job_id)
WHERE salary = (SELECT MAX(AVG(salary)) FROM employees GROUP BY job_id);

SELECT job_title, AVG(salary) FROM employees e
JOIN jobs j ON (e.job_id = j.job_id)
GROUP BY job_title
HAVING AVG(salary) = (SELECT MAX(AVG(salary)) FROM employees GROUP BY job_id);

SELECT first_name, last_name, salary FROM employees
WHERE job_id IN (SELECT job_id FROM jobs WHERE min_salary > 8000);

SELECT e1.first_name, e1.last_name, e1.salary FROM employees e1
WHERE salary > (SELECT AVG(e2.salary) FROM employees e2 WHERE e1.department_id = e2.department_id);

SELECT e2.first_name, e2.last_name, e2.salary, ea.department_id, ea.s FROM employees e2
JOIN (SELECT department_id, AVG(salary) s FROM employees GROUP BY department_id ) ea
ON (ea.department_id = e2.department_id)
WHERE e2.salary > ea.s;

------------------------------------------------
SELECT * FROM employees
WHERE LENGTH(first_name) = (SELECT MAX(LENGTH(first_name)) FROM employees);

SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT city FROM locations WHERE location_id IN (
SELECT location_id FROM departments WHERE department_id IN (
SELECT department_id FROM (
SELECT MIN(SUM(salary)) FROM employees GROUP BY department_id)));

SELECT * FROM employees WHERE manager_id IN (
SELECT employee_id FROM employees WHERE employee_id IN (
SELECT manager_id FROM employees)
AND salary > 15000);

SELECT * FROM departments
WHERE department_id NOT IN (SELECT DISTINCT department_id FROM employees WHERE department_id IS NOT NULL);

SELECT * FROM employees WHERE employee_id NOT IN (
SELECT DISTINCT manager_id FROM employees WHERE manager_id IS NOT NULL);

SELECT * FROM employees WHERE employee_id IN (
SELECT manager_id FROM employees GROUP BY manager_id HAVING COUNT(employee_id) > 6);

SELECT * FROM employees WHERE department_id IN (
SELECT department_id FROM departments WHERE department_name LIKE 'IT');

SELECT * FROM employees WHERE manager_id IN (
SELECT employee_id FROM employees WHERE employee_id IN (
SELECT manager_id FROM employees) AND TO_CHAR(hire_date, 'YYYY') = '2005') AND hire_date < TO_DATE('01-JAN-2005', 'dd-MON-YYYY');

SELECT * FROM employees WHERE manager_id IN (
SELECT employee_id FROM employees WHERE employee_id IN (
SELECT manager_id FROM employees) AND TO_CHAR(hire_date, 'fmMonth') = 'January')
AND job_id IN (
SELECT job_id FROM jobs WHERE LENGTH(job_title) > 15);

