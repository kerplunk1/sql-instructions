SELECT first_name, last_name, commission_pct, NVL(commission_pct, 0) AS commission
FROM employees
ORDER BY commission;

SELECT first_name, last_name, commission_pct, NVL2(commission_pct, 'yes', 'no') AS commission
FROM employees
ORDER BY commission;

-- NULLIF - Comparing two arguments, if they are equal, will return null, if not, return the first argument.
SELECT first_name, last_name, manager_id, commission_pct, NULLIF(manager_id, commission_pct) AS eq
FROM employees
ORDER BY eq NULLS FIRST;

-- COALESCE - Similar to NLV but can have more than two arguments, will return the first non-null argument.
SELECT COALESCE(null, null, null, 'hello') FROM dual;

SELECT first_name, DECODE(first_name, 'Steven', 'yes', 'no') AS fork FROM employees
ORDER BY fork DESC;

SELECT first_name, last_name, commission_pct, DECODE(commission_pct, null, 'don''t have commission', 0.4, 'big', 'small')
FROM employees;

-- Simple CASE
SELECT first_name, last_name,
CASE first_name
WHEN 'Steven' THEN 'yes'
ELSE 'no'
END
FROM employees;

--Searched CASE
SELECT first_name, last_name,
CASE
WHEN first_name LIKE 'St%' THEN 'yes'
ELSE 'no'
END AS cs
FROM employees
ORDER BY cs DESC;

-----------

SELECT * FROM employees WHERE LOWER(first_name) LIKE '%b%';  

SELECT * FROM employees WHERE LOWER(first_name) LIKE '%a%a%';

SELECT SUBSTR(department_name, 1, INSTR(department_name, ' ')) FROM departments
WHERE INSTR(department_name, ' ') != 0;

SELECT first_name, SUBSTR(first_name, 2, LENGTH(first_name) - 2) FROM employees;

SELECT * FROM employees
WHERE LENGTH(SUBSTR(job_id ,INSTR(job_id, '_') + 1)) >= 3
AND
SUBSTR(job_id ,INSTR(job_id, '_') + 1) != 'CLERK';

SELECT * FROM employees
WHERE hire_date = TRUNC(hire_date, 'MM');

SELECT * FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') = '2008';

SELECT TO_CHAR(SYSDATE + 1, '"Tomorrow is" Ddsp "day of" Month') FROM dual;

SELECT first_name, TO_CHAR(hire_date, 'ddth "of" fmMonth, YYYY') FROM employees;

SELECT first_name, last_name, salary, TO_CHAR(salary * 0.2 + salary, '$999,999.99')
FROM employees;

SELECT TO_CHAR(SYSDATE, 'DD-MON-RR, +ss, +mi, +hh24, +dd, +MM, +YYYY') FROM dual;

SELECT first_name, salary, salary + TO_NUMBER('$12,345.55', '$99,999.99') FROM employees;

SELECT first_name, hire_date,
MONTHS_BETWEEN(TO_DATE('SEP, 18:45:00 18 2009', 'MON, hh24:mi:ss dd YYYY'), hire_date)
FROM employees;

SELECT first_name, salary, commission_pct,
TO_CHAR(salary * NVL(commission_pct, 0) + salary, '$999,999.99')
FROM employees
ORDER BY commission_pct NULLS LAST;

SELECT first_name, last_name,
NVL2(NULLIF(LENGTH(first_name), LENGTH(last_name)), 'different length', 'same length')
FROM employees;

SELECT first_name, commission_pct, NVL2(commission_pct, 'yes', 'no') FROM employees;

SELECT first_name, COALESCE(commission_pct, manager_id, salary) FROM employees;

SELECT first_name, salary,
CASE
WHEN salary < 5000 THEN 'Low level'
WHEN salary >=5000 AND salary < 10000 THEN 'Normal level'
WHEN salary >= 10000 THEN 'High level'
END
FROM employees;

SELECT country_name, DECODE(region_id, 1, 'Europe', '2', 'America', '3', 'Asia', '4', 'Africa') FROM countries;

SELECT country_name,
CASE region_id
WHEN 1 THEN 'Europe'
WHEN 2 THEN 'America'
WHEN 3 THEN 'Asia'
WHEN 4 THEN 'Africa'
END
FROM countries;

SELECT first_name, salary, commission_pct,
CASE
WHEN salary < 10000 AND commission_pct IS NULL THEN 'BAD'
WHEN salary BETWEEN 10000 AND 15000 OR commission_pct IS NOT NULL THEN 'NORMAL'
WHEN salary >= 15000 THEN 'GOOD'
END
FROM employees;