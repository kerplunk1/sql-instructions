SELECT * FROM employees;

-- 14-JAN-2023 )))
SELECT SYSDATE - TO_DATE('13-AUG-92', 'dd-MON-RR') FROM dual;
SELECT TO_DATE('13-AUG-92', 'dd-MON-RR') + 11111 FROM dual;
--

SELECT first_name, COUNT(*) FROM employees
GROUP BY first_name
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

SELECT department_id, COUNT(*), AVG(LENGTH(UPPER(last_name)))
FROM employees
GROUP BY department_id;

SELECT last_name, LENGTH(last_name), department_id FROM employees
WHERE department_id = 90;

-------------------------------------

SELECT department_id, MIN(salary), MAX(salary), MIN(hire_date), MAX(hire_date), COUNT(*)
FROM employees
GROUP BY department_id
ORDER BY COUNT(*) DESC;

SELECT SUBSTR(first_name, 1, 1), COUNT(*) FROM employees
GROUP BY SUBSTR(first_name, 1, 1)
HAVING COUNT(*) > 1
ORDER BY COUNT(*);

SELECT department_id, salary, COUNT(*) FROM employees
GROUP BY department_id, salary;

SELECT TO_CHAR(hire_date, 'Day'), COUNT(*) FROM employees
GROUP BY TO_CHAR(hire_date, 'Day');

SELECT department_id, COUNT(*), SUM(salary) FROM employees
GROUP BY department_id
HAVING COUNT(*) > 30 AND SUM(salary) > 300000;

SELECT region_id, SUM(LENGTH(country_name)) FROM countries
GROUP BY region_id
HAVING SUM(LENGTH(country_name)) > 50;

SELECT job_id, ROUND(AVG(salary)) FROM employees
GROUP BY job_id;

SELECT department_id, COUNT(DISTINCT job_id) FROM employees
GROUP BY department_id
HAVING COUNT(DISTINCT job_id) > 1
ORDER BY department_id;

SELECT department_id, job_id, MAX(salary), MIN(salary) FROM employees
GROUP BY department_id, job_id
HAVING AVG(salary) > 10000;

SELECT manager_id FROM employees
WHERE commission_pct IS NULL
GROUP BY manager_id
HAVING AVG(salary) BETWEEN 6000 AND 9000;

SELECT ROUND(MAX(AVG(salary)), -3) FROM employees
GROUP BY department_id;

