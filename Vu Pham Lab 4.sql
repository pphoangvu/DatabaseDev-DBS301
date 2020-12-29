-- ***********************
-- Name: Vu Pham
-- ID: 129908174
-- Date: 01-31-2019
-- Purpose: Lab 4 DBS301 
-- ***********************


-- Question 1  Display the difference between the Average pay and Lowest pay in the company
SELECT 
    (to_char(avg(salary), '$9999.99') || ' - ' || to_char(min(salary),'$9999.99')) AS "REAL AMOUNT" 
    FROM employees;
    
-- Question 2  Display the department number and Highest, Lowest and Average pay per each department
SELECT 
    department_id, 
    to_char(MAX(salary), '$99999.99') AS "High", 
    to_char(MIN(salary), '$99999.99') AS "Low", 
    to_char(AVG(salary), '$99999.99') AS "Avg"
    FROM employees
    GROUP BY department_id
    ORDER BY "Avg" Desc;
    
-- Question 3  Display how many people work the same job in the same department
SELECT 
    department_id AS "Dept#", 
    job_id AS "Job",
    count(DISTINCT employee_id) AS "How Many"
    FROM employees
    GROUP BY department_id, job_id
    ORDER BY "How Many" Desc;
    
-- Question 4  For each job title display the job title and total amount paid each month for this type of the job
    
SELECT
    job_id,
    sum(salary)
    FROM employees
    GROUP BY job_id
    HAVING sum(salary) > 11000 AND job_id != 'AD_PRES' AND job_id != 'AD_VP'
    ORDER BY sum(salary) Desc;

-- Question 5 For each manager number display how many persons he / she supervises
SELECT 
    manager_id,
    count(DISTINCT employee_id) AS "Employees they supervises"
    FROM employees
    WHERE manager_id NOT IN (100,101,102)
    GROUP BY manager_id
    HAVING count(DISTINCT employee_id) > 2
    ORDER BY "Employees they supervises" Desc;

-- Question 6
SELECT
    department_id,
    MAX(hire_date) AS "Latest",
    MIN(hire_date) AS "Earliest"
    FROM employees
    WHERE department_id NOT IN(10, 20)
    GROUP BY department_id
    HAVING max(hire_date) < to_date('20010101', 'yyyyddmm')
    ORDER BY "Latest" Desc;
    


    
    