-- ***********************
-- Name: Vu Pham
-- ID: 129908174
-- Date: 03-10-2019
-- Purpose: Lab 7 DBS301 
-- ***********************

-- Question 1 
SELECT department_id
    FROM departments
    MINUS
SELECT department_id
    FROM employees
    WHERE upper(job_id) = 'ST_CLERK';

-- Question 2
SELECT 
    country_id, country_name
    FROM (SELECT 
            country_id
            FROM countries
          MINUS
          SELECT country_id
            FROM locations) 
    JOIN countries
    USING (country_id);
    
-- Question 3
SELECT 
    job_id, department_id
    FROM employees
    WHERE department_id = 10
UNION ALL
SELECT 
    job_id, department_id
    FROM employees
    WHERE department_id = 50
UNION ALL
SELECT 
    job_id, department_id
    FROM employees
    WHERE department_id = 20;
    
    
-- Question 4
SELECT 
    employee_id, job_id
    FROM (SELECT employee_id
        FROM employees
        MINUS
        SELECT employee_id
        FROM job_history) 
    JOIN employees
    USING(employee_id)
    ORDER BY employee_id;
    
-- Question 5
SELECT 
    last_name,department_id
    FROM employees 
UNION ALL
SELECT 
    to_char(null),department_id
    FROM departments;


