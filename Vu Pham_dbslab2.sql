-- *********************** 
--Name: Vu Pham
-- ID: 129908174
-- Date: 01-20-2019
-- Purpose: Lab 2 DBS301
-- ***********************


-- Question 1 – write a brief note about what the question is asking  

SELECT 
    employee_id, 
    last_name, 
    to_char(salary, '$999,999.99') AS "SALARY"
    FROM employees
    WHERE (salary >= 8000 AND salary <= 12000)
    ORDER BY salary DESC, last_name ;
    
-- Question 2 –

SELECT 
    employee_id, 
    last_name, job_id,
    to_char(salary, '$999,999.99') AS "SALARY"
    FROM employees 
    WHERE job_id = 'IT_PROG' OR job_id = 'SA_REP'
    ORDER BY salary DESC, last_name ;
    
-- Question 3 –
SELECT 
    employee_id, 
    last_name, job_id,
    to_char(salary, '$999,999.99') AS "SALARY"
    FROM employees 
    WHERE (salary < 8000 OR salary > 12000)
    ORDER BY salary DESC, last_name ;
    
-- Question 4 –
SELECT 
    last_name,
    job_id, 
    to_char(salary, '$999,999.99') AS "SALARY"
    FROM employees
    WHERE hire_date < to_date('20180101', 'yyyyddmm')
    ORDER BY hire_date DESC;

-- Question 5 –
SELECT 
    last_name,
    job_id, 
    to_char(salary, '$999,999.99') AS "SALARY"
    FROM employees
    WHERE salary > 12000
    ORDER BY job_id, salary DESC;

-- Question 6 –
SELECT 
    job_id  "Job Title",
    first_name || ' ' || last_name AS "Full Name"   
    FROM employees
    WHERE lower(first_name) LIKE '%e%';
    
-- Question 7 –
SELECT 
    last_name,
    to_char(salary, '$999,999.99') AS "SALARY",
    commission_pct*100 || '%' AS "COMMISSION"
    FROM employees
    WHERE (commission_pct IS NOT NULL);
    
-- Question 8 –
SELECT 
    last_name,
    to_char(salary, '$999,999.99') AS "SALARY",
    commission_pct*100 || '%' 
    FROM employees
    WHERE (commission_pct IS NOT NULL)
    ORDER BY salary DESC;
   
-- Question 9 –
SELECT 
    last_name,
    to_char(salary, '$999,999.99') AS "SALARY",
    commission_pct*100 || '%' 
    FROM employees
    WHERE (commission_pct IS NOT NULL)
    ORDER BY LPAD(lower(last_name), 10,0) DESC;
    


    

    