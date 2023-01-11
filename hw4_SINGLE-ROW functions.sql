SELECT * FROM employees WHERE LENGTH(first_name) > 10;

SELECT * FROM employees WHERE MOD(salary, 1000) = 0;

SELECT phone_number, SUBSTR(phone_number, 1, 3)
FROM employees
WHERE phone_number LIKE '___.___.____';

SELECT * FROM employees WHERE first_name LIKE '%m' AND LENGTH(first_name) > 5;

SELECT NEXT_DAY(SYSDATE, 5) FROM dual;

SELECT * FROM employees WHERE MONTHS_BETWEEN(SYSDATE, hire_date) > 150;

SELECT REPLACE(phone_number, '.', '-') FROM employees;

SELECT UPPER(first_name), LOWER(email), INITCAP(job_id) FROM employees;

SELECT CONCAT(first_name, salary) FROM employees;

SELECT hire_date, ROUND(hire_date, 'MM'), TRUNC(hire_date, 'YYYY') FROM employees;

SELECT RPAD(first_name, 10, '$'), LPAD(last_name, 15, '!') FROM employees;

SELECT first_name, INSTR(LOWER(first_name), 'a', '1', '2') FROM employees;

SELECT '!!!HELLO!! MY FRIEND!!!!!!!!!', TRIM('!' FROM '!!!HELLO!! MY FRIEND!!!!!!!!!')
FROM dual;

SELECT salary, salary*3.1514, ROUND(salary*3.1415), TRUNC(salary*3.1415, -3)/1000 FROM employees;

SELECT hire_date, ADD_MONTHS(hire_date, 6), LAST_DAY(hire_date) FROM employees;

