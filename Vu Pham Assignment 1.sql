-- *********************** 
-- Name: Vu Pham 
-- ID: 129908174
-- Date: 02/18/2018 
-- Purpose: Assignment 1 - DBS301 
-- ***********************  

-- Question 1 
SELECT 
    ltrim(employee_id) as "Employee Number",
    last_name || ', ' || first_name as "Full name",
    job_id,
    TO_CHAR(LAST_DAY(HIRE_DATE),'fm[Month ddth "of" YYYY]') as "Start Date"
    FROM employees
    WHERE to_char(hire_date, 'fmMonth') IN ('May','November') AND to_char(hire_date,'yyyy') NOT IN (2014, 2015)
    ORDER BY "Start Date" desc;
    
-- Question 2
SELECT 
    'Emp# ' || employee_id || 
    ' named ' || last_name || ' ' || first_name ||
    ' who is ' || job_id || 
    ' will have a new salary of ' || '$' ||
    CASE 
        WHEN upper(job_id) like '%VP%' THEN  salary * 1.25
        ELSE salary * 1.18
    END
    AS "Employees with increased Pay"
    FROM employees
    WHERE salary NOT BETWEEN 5000 AND 10000
        AND (upper(job_id) like '%VP%' 
        OR upper(job_id) like '%MAN'
        OR upper(job_id) like '%MGR')
    ORDER BY salary desc;
    
    --select * from employees;
-- Question 3
SELECT 
    last_name,
    ltrim(salary) as "Salary",
    job_id,
    ltrim(nvl(to_char(manager_id),'NONE')) as "Manager #",
    to_char((1000+salary)*12, '$999,999.00') as "Total Income"
    FROM employees
    WHERE (nvl(commission_pct,0) = 0 OR department_id = 80) AND (SALARY + 1000 + (SALARY * nvl(COMMISSION_PCT,0))) > 15000
    ORDER BY "Total Income" desc;
    
    -- 2nd solution
    SELECT 
    last_name,
    ltrim(salary) as "Salary",
    job_id,
    ltrim(nvl(to_char(manager_id),'NONE')) as "Manager #",
    to_char((1000+salary)*12, '$999,999.00') as "Total Income"
    FROM employees
    WHERE (NVL(commission_pct,0) = 0 OR department_id = (
                                                            SELECT 
                                                                department_id
                                                                FROM departments
                                                                WHERE upper(department_name) = 'SALES'
                                                        )
        ) 
    AND (SALARY + 1000 + (SALARY * NVL(commission_pct,0))) > 15000
    ORDER BY "Total Income" desc;

-- Question 4
SELECT 
    Department_id || ', ' || job_id ||  ', $' || min(salary) as "Lowest Dept/Job Pay" , salary
    FROM  employees
    GROUP BY department_id, job_id, salary
    HAVING min(salary) BETWEEN 6000  AND 18000  
        AND upper(job_id) NOT LIKE '%REP' 
        AND upper(job_id) NOT LIKE '%IT%' 
        AND upper(job_id) NOT LIKE '%SA%'
    ORDER BY department_id; job_id;
   --select * from departments;

-- Question 5
SELECT 
    last_name,
    salary,
    job_id
    FROM employees JOIN departments USING (department_id)
                   JOIN locations USING (location_id)
    WHERE salary > ALL (
                    SELECT 
                        min(salary) --, departments.department_id
                        FROM employees 
                        WHERE upper(job_id) NOT IN ('AD_PRES','AD_VP')--AND country_id 'US'
                        GROUP BY department_id
                        )
    AND  upper(country_id) != 'US' 
    ORDER BY job_id asc;
   -- select * from departments;

   
    
-- Question 6
SELECT 
    last_name,
    salary,
    job_id
    FROM employees
    WHERE department_id IN (
                            SELECT
                                department_id 
                                FROM departments
                                WHERE upper(department_name) IN ('IT', 'MARKETING')
                            )
    AND salary > (
                    SELECT
                        min(salary)
                        FROM employees
                        WHERE department_id = (
                                                SELECT
                                                    department_id
                                                    FROM departments
                                                    WHERE upper(department_name) = 'ACCOUNTING'
                                                )
                   )
    ORDER BY last_name;   
                       
-- Question 7
SELECT 
    cast((First_Name || ' ' || Last_Name) AS VARCHAR2(25)) AS "Employee",
    job_id,
    LPAD(to_char(SALARY,'$99,999'),15,'=') as "Salary",
    department_id
    FROM employees JOIN departments 
    USING (department_id)
    WHERE salary < (
                    SELECT max(salary)
                        FROM employees 
                        WHERE --upper(job_id) NOT LIKE '%MAN' 
                               upper(job_id) NOT LIKE '%MGR' 
                              AND upper(job_id) NOT LIKE '%VP' 
                              AND upper(job_id) NOT LIKE '%PRES' 
                              AND upper(department_name) IN('SALES', 'MARKETING')
                              AND employee_id NOT IN (
                            SELECT 
                                nvl(manager_id,0) 
                                FROM departments
                            )
                    ) 
    AND employee_id NOT IN (
                            SELECT 
                                nvl(manager_id,0) 
                                FROM departments
                            );
                           -- select max(salary) from employees where department_id = 80;
-- Question 8

INSERT INTO employees VALUE()
SELECT 
    department_name,
    SUBSTR(nvl(city, 'Not Assigned Yet'), 0, 25) as "City",
    count( DISTINCT job_id) as "# of Jobs"
    FROM employees FULL JOIN departments
    USING (department_id)
    LEFT OUTER JOIN locations
    USING (location_id)
    GROUP BY department_name, city;
    select * from employees;
    
    
    
   
   
    
    