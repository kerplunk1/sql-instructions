SELECT manager_id, job_id, department_id, SUM(salary) FROM employees
GROUP BY manager_id, job_id, department_id;

SELECT department_id FROM employees WHERE manager_id = 100 
INTERSECT
SELECT department_id FROM employees WHERE manager_id NOT IN (145, 201);

SELECT first_name, last_name, salary FROM employees WHERE first_name LIKE '_a%'
INTERSECT
SELECT first_name, last_name, salary FROM employees WHERE LOWER(last_name) LIKE '%s%'
ORDER BY salary DESC;

SELECT location_id, postal_code, city FROM locations
NATURAL JOIN countries WHERE country_name LIKE 'Italy'
UNION
SELECT location_id, postal_code, city FROM locations
NATURAL JOIN countries WHERE country_name LIKE 'Germany'
MINUS
SELECT location_id, postal_code, city FROM locations
WHERE postal_code LIKE '%9%';

